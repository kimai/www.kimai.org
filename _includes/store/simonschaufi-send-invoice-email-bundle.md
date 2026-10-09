{% if page.lang == 'de' %}
## Rechnungen automatisch per E-Mail versenden

Ein Kimai-Plugin, das neu erstellte Rechnungen automatisch per E-Mail an Kunden versendet – mit der Rechnung im Anhang.

Kein manuelles Versenden mehr: Das Plugin prüft regelmäßig, ob neue Rechnungen vorhanden sind, und sendet sie automatisch an die hinterlegte E-Mail-Adresse des Kunden.

## Was ist enthalten?

- Automatischer Versand von Rechnungen per E-Mail mit Anhang
- Konfigurierbare Absenderadresse in den Systemeinstellungen
- Optionaler dedizierter SMTP-Account für den Rechnungsversand (über Umgebungsvariablen)
- Aktivierung / Deaktivierung des automatischen Versands auf Kundenebene
- Neue Berechtigung `manage_send_invoice_email` für die Verwaltung der Einstellung pro Kunde
- `--dry-run`-Option zum Testen ohne tatsächlichen Versand
- Vollständig anpassbare E-Mail-Vorlagen über ein eigenes Plugin

## Systemvoraussetzungen

Sie benötigen die Möglichkeit, Cronjobs auf Ihrem Server auszuführen, entweder in Ihrer Hosting-Administrationsplattform oder manuell über `crontab -e`.
Dies ist erforderlich, um den Befehl `bin/console send-invoice-email:send` regelmäßig auszuführen.

## Einrichtungsschritte nach der Installation

### 1. Plugin konfigurieren

Öffnen Sie **System > Einstellungen > Invoice emails**, um den Absendernamen für Rechnungs-E-Mails festzulegen.

Standardmäßig verwendet das Plugin die `MAILER_URL`- und `MAILER_FROM`-Konfiguration von Kimai. Um Rechnungs-E-Mails über einen separaten SMTP-Account zu versenden, können Sie optional diese Umgebungsvariablen setzen:

```dotenv
SEND_INVOICE_EMAIL_MAILER_DSN=smtp://user:password@smtp.example.com:587
SEND_INVOICE_EMAIL_FROM=invoices@example.com
```

### 2. Automatischen Versand pro Kunde aktivieren

Aktivieren Sie im Bearbeitungsformular eines Kunden den Schalter **Automatischer Rechnungsversand** (erfordert die Berechtigung `manage_send_invoice_email`).

### 3. Cronjob einrichten

Damit Rechnungen automatisch versendet werden, richten Sie einen Cronjob ein.

Fügen Sie folgende Zeile in Ihre Crontab ein (alle 5 Minuten):

```bash
*/5 * * * * cd /path/to/kimai && bin/console send-invoice-email:send --env=prod >> var/log/send-invoice-email.log 2>&1
```

### 4. Befehl manuell ausführen

Sie können den Befehl auch manuell ausführen:

```bash
bin/console send-invoice-email:send
```

Mit der Option `--dry-run` testen Sie den Ablauf, ohne E-Mails zu versenden oder Daten zu speichern:

```bash
bin/console send-invoice-email:send --dry-run
```

Mit `--limit=N` verarbeiten Sie maximal N neue Rechnungen pro Ausführung:

```bash
bin/console send-invoice-email:send --limit=50
```

## Verhalten

Eine Rechnung erhält den Status `pending` erst, nachdem die E-Mail erfolgreich versendet wurde.

Folgende Fälle werden als Warnung protokolliert, die Rechnung bleibt im Status `new`:

- Der Kunde hat keine E-Mail-Adresse
- Die E-Mail-Adresse des Kunden ist ungültig

Wenn keine Rechnungsdatei gefunden wird, wird die E-Mail trotzdem versendet (ohne Anhang), mit einem entsprechenden Hinweis.

Bei einem SMTP-Fehler wird der Fehler protokolliert, die Rechnung bleibt im Status `new`, und der Befehl endet mit einem Fehlercode – so kann der Cronjob oder ein Monitoring-System den Fehler erkennen.

## E-Mail-Vorlagen anpassen

Die Standard-E-Mail-Vorlagen befinden sich in `Resources/views/emails/`:
- `invoice.html.twig` – Wird an den Kunden mit der Rechnung im Anhang gesendet.

> **Wichtig:** Passen Sie die Originaldateien des Plugins nicht direkt an, da Plugin-Updates Ihre Änderungen überschreiben würden.
> Erstellen Sie stattdessen ein eigenes Kimai-Plugin mit einem `EventSubscriber`, der auf das `ModifyTemplatedEmailEvent` reagiert.

Weitere Informationen zur Plugin-Entwicklung finden Sie in der [Kimai Plugin-Dokumentation](https://www.kimai.org/documentation/plugins.html).

## Berechtigungen

Dieses Plugin bringt eine neue Berechtigung mit:

- `manage_send_invoice_email` – Nur Benutzer mit dieser Berechtigung können den automatischen Rechnungsversand für einen Kunden aktivieren oder deaktivieren.

Standardmäßig wird diese Berechtigung jedem Benutzer mit der Rolle `ROLE_SUPER_ADMIN` zugewiesen.

## Übersetzung

Das Plugin wird in zwei Sprachen angeboten: Deutsch und Englisch.
Um das Plugin in Ihrer Sprache anzubieten, kontaktieren Sie mich bitte, dann werde ich die Beschriftungen entsprechend übersetzen.
{% else %}
## Automated invoice delivery by email

A Kimai plugin that automatically sends newly created invoices to customers by email — with the invoice attached.

No more manual sending: the plugin regularly checks for new invoices and delivers them to the customer's email address automatically.

## What's included?

- Automatic sending of invoices by email with the invoice attached
- Configurable sender name in the system settings
- Optional dedicated SMTP account for invoice emails (via environment variables)
- Enable / disable automatic sending per customer
- New permission `manage_send_invoice_email` to control who can toggle the setting per customer
- `--dry-run` option for testing without actually sending
- Fully customizable email templates via a custom plugin

## System Requirements

You need the ability to execute cronjobs on your server, either in your hosting administration platform or manually via `crontab -e`.
This is required for running the command `bin/console send-invoice-email:send` on a regular basis.

## Setup steps after Installation

### 1. Configure the plugin

Go to **System > Settings > Invoice emails** to set the sender name used for invoice emails.

By default, the plugin uses Kimai's `MAILER_URL` and `MAILER_FROM` configuration. To send invoice emails through a separate SMTP account, you can optionally set these environment variables:

```dotenv
SEND_INVOICE_EMAIL_MAILER_DSN=smtp://user:password@smtp.example.com:587
SEND_INVOICE_EMAIL_FROM=invoices@example.com
```

The two variables are independent — you can configure one without the other.

### 2. Enable automatic sending per customer

In a customer's edit form, activate the **Automatic invoice sending** toggle (requires the `manage_send_invoice_email` permission).

### 3. Set up the cron job

To send invoice emails automatically, add a cron job to your server.

Add the following line to your crontab (runs every 5 minutes):

```bash
*/5 * * * * cd /path/to/kimai && bin/console send-invoice-email:send --env=prod >> var/log/send-invoice-email.log 2>&1
```

### 4. Run the command manually

You can also run the command manually at any time:

```bash
bin/console send-invoice-email:send
```

Use the `--dry-run` option to test the process without sending any emails or writing to the database:

```bash
bin/console send-invoice-email:send --dry-run
```

Use `--limit=N` to process at most N new invoices per run:

```bash
bin/console send-invoice-email:send --limit=50
```

## Behavior

An invoice is only switched to `pending` status after its email was sent successfully.

The following cases are logged as warnings and the invoice stays at `new` status:

- The customer has no email address
- The customer's email address is invalid

If no invoice file is found, the email is still sent (without an attachment) and a warning is logged.

If the mail transport fails (e.g. the SMTP server is unreachable), the error is logged, the invoice stays at `new`, and the command exits with a non-zero status code so that cron or monitoring tools can detect the failure.

## Customizing email templates

The default email template is located in `Resources/views/emails/`:
- `invoice.html.twig` — Sent to the customer with the invoice attached.

> **Important:** Do not modify the original plugin templates directly, as any plugin update will overwrite your changes.
> Instead, customize the templates by creating your own Kimai plugin using an `EventSubscriber` that listens to `ModifyTemplatedEmailEvent`.

How to create a Kimai plugin is explained in the official [Kimai Plugin Documentation](https://www.kimai.org/documentation/plugins.html).

## Permissions

This plugin ships a new permission:

- `manage_send_invoice_email` — Only users with this permission can activate or deactivate automatic invoice sending for a customer.

By default, it is assigned to each user with the role `ROLE_SUPER_ADMIN`.

Read how to assign this permission to your user roles in the [permission documentation](https://www.kimai.org/documentation/permissions.html).

## Translation

The plugin is available in two languages: English and German.
To offer the plugin in your language, please contact me, and I will translate the labels accordingly.
{% endif %}
