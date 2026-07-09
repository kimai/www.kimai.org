---
title: Webhooks
description: Notify external systems about changes in Kimai
---

Kimai can notify external systems in real time when something happens — a timesheet is created, a customer is updated, an invoice is deleted, and so on. These notifications are called **webhooks**: Kimai sends an HTTP POST request with a JSON payload to a URL you configure.

## Configuration

Webhooks are configured under **System > Settings** in the **Webhooks** section.

Each webhook endpoint consists of three fields:

| Field      | Required | Description                                                                                                                                                 |
|------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **URL**    | Yes      | The HTTPS URL that Kimai will send events to. Must be a publicly reachable address — private/internal network addresses are blocked by default.             |
| **Secret** | Yes      | A shared secret string used to sign every request. The receiving system uses this secret to verify that the request actually came from your Kimai instance. |
| **Events** | No       | The list of events this endpoint should receive. If no events are selected, the endpoint will not receive any notifications.                                |
{:.table}

You can configure up to **5 endpoints** (this limit can be adjusted by changing the `webhook.max_endpoints` setting). The same URL cannot be used more than once.

### Adding an endpoint
 
1. Navigate to **System > Settings**
2. Open the **Webhooks** section
3. Click the add button to create a new endpoint
4. Enter the target URL (must use HTTPS)
5. Enter a secret (keep this value safe — you will need it on the receiving end to verify requests)
6. Select one or more events you want to subscribe to
7. Save the configuration

### Removing an endpoint

Click the delete button next to the endpoint you want to remove, then save.

## Available events

Events are grouped by the entity they belong to. Each event fires at a specific moment in the lifecycle of that entity.

### Timesheets

| Event               | Trigger                            |
|---------------------|------------------------------------|
| `timesheet.created` | A new timesheet record was created |
| `timesheet.updated` | A timesheet record was updated     |
| `timesheet.stopped` | A running timesheet was stopped    |
{:.table}

### Customers

| Event              | Trigger                           |
|--------------------|-----------------------------------|
| `customer.created` | A new customer was created        |
| `customer.updated` | A customer was updated            |
| `customer.deleted` | A customer is about to be deleted |
{:.table}

### Projects

| Event             | Trigger                          |
|-------------------|----------------------------------|
| `project.created` | A new project was created        |
| `project.updated` | A project was updated            |
| `project.deleted` | A project is about to be deleted |
{:.table}

### Activities

| Event              | Trigger                            |
|--------------------|------------------------------------|
| `activity.created` | A new activity was created         |
| `activity.updated` | An activity was updated            |
| `activity.deleted` | An activity is about to be deleted |
{:.table}

### Users

| Event          | Trigger                |
|----------------|------------------------|
| `user.created` | A new user was created |
| `user.updated` | A user was updated     |
| `user.deleted` | A user was deleted     |
{:.table}

### Teams

| Event          | Trigger                |
|----------------|------------------------|
| `team.created` | A new team was created |
| `team.updated` | A team was updated     |
| `team.deleted` | A team was deleted     |
{:.table}

### Invoices

| Event             | Trigger                |
|-------------------|------------------------|
| `invoice.created` | An invoice was created |
| `invoice.deleted` | An invoice was deleted |
{:.table}

## Request format

When an event fires, Kimai sends an HTTP `POST` request to every endpoint that is subscribed to that event. The request uses the following format:

### Headers

| Header              | Description                                        |
|---------------------|----------------------------------------------------|
| `Content-Type`      | `application/json`                                 |
| `Webhook-Event`     | The event name (e.g. `timesheet.created`)          |
| `Webhook-Id`        | A unique UUID identifying this delivery            |
| `Webhook-Signature` | HMAC-SHA256 signature for verification (see below) |
| `User-Agent`        | `Kimai <version>`                                  |
{:.table}

### Body

The body is a JSON object with three fields:

```json
{
    "id": "550e8400-e29b-41d4-a716-446655440000",
    "event": "timesheet.created",
    "data": {
        ...
    }
}
```

| Field   | Description                                                                                           |
|---------|-------------------------------------------------------------------------------------------------------|
| `id`    | The unique event delivery ID (same as the `Webhook-Id` header)                                        |
| `event` | The event name                                                                                        |
| `data`  | The serialized entity that triggered the event (e.g. the full timesheet, customer, or project object) |
{:.table}

The `data` field contains the same structure you would receive from the corresponding Kimai API endpoint.

## Request signing and verification

Every webhook request is signed using **HMAC-SHA256** so the receiving system can verify that the request is authentic and has not been tampered with.

### How signing works

1. Kimai constructs the JSON request body
2. It concatenates the event name, the event ID, and the JSON body into a single string
3. It computes an HMAC-SHA256 hash of that string using the **secret** you configured for the endpoint
4. The resulting signature is sent in the `Webhook-Signature` header, prefixed with `sha256=`

### Verifying a request

On the receiving end, you should:

1. Read the `Webhook-Event`, `Webhook-Id`, and the raw request body
2. Concatenate them in this order: `event name` + `event ID` + `body`
3. Compute the HMAC-SHA256 hash of that string using the shared secret
4. Compare your computed signature to the value in the `Webhook-Signature` header (after stripping the `sha256=` prefix)

If the signatures match, the request is genuine. If they don't match, reject the request.

**Example in PHP:**

```php
$event     = $_SERVER['HTTP_WEBHOOK_EVENT'];
$id        = $_SERVER['HTTP_WEBHOOK_ID'];
$body      = file_get_contents('php://input');
$secret    = 'your-shared-secret';

$expected  = hash_hmac('sha256', $event . $id . $body, $secret);
$signature = str_replace('sha256=', '', $_SERVER['HTTP_WEBHOOK_SIGNATURE']);

if (!hash_equals($expected, $signature)) {
    http_response_code(403);
    exit('Invalid signature');
}

$payload = json_decode($body, true);
// process $payload ...
```

## Asynchronous delivery

Webhook requests are dispatched asynchronously through a message queue. This means:

- The user action that triggered the event (e.g. saving a timesheet) is not slowed down by the webhook delivery.
- If the receiving server is temporarily unavailable, the message will be retried according to your messenger transport configuration.
- The order of delivery is generally preserved, but not strictly guaranteed.

## Security notes

- **HTTPS only**: Webhook URLs must use HTTPS. Plain HTTP is not accepted.
- **No private networks**: By default, Kimai blocks webhook URLs that resolve to private or reserved IP ranges (e.g. `10.x.x.x`, `192.168.x.x`, `127.0.0.1`) to prevent server-side request forgery (SSRF). If you need to send webhooks to internal services, the `webhook.allow_private_network` setting can be enabled by a system administrator via the configuration file — but be aware of the security implications.
- **Secret rotation**: If you suspect a secret has been compromised, change it immediately in the Kimai settings and update the receiving system accordingly. There is no grace period — the old secret stops working as soon as you save.
