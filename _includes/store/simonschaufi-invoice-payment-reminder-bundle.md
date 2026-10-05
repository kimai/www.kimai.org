{% if page.lang == 'de' %}
## Automatisierte Zahlungserinnerungen per E-Mail

Ein Kimai-Plugin, das automatisch Zahlungserinnerungen für überfällige Rechnungen versendet – an den Kunden mit der Rechnung im Anhang und intern an die zuständigen Mitarbeitenden.

Schluss mit manuellem Nachfassen: Das Plugin prüft täglich offene Rechnungen und sendet abgestufte Mahnungen passend zum Zahlungsverzug.

## Was ist enthalten?

- Tägliche Prüfung auf überfällige Rechnungen mit Status „Ausstehend"
- E-Mail-Erinnerungen an den Kunden (optional mit Rechnungsanhang)
- Interne Benachrichtigungen an die Rechnungsersteller und/oder ausgewählte Mitarbeitende
- 3 Mahnstufen:
  - Stufe 1: 1 Tag nach Fälligkeit
  - Stufe 2: 8 Tage nach Fälligkeit
  - Stufe 3: 15 Tage nach Fälligkeit
- Konfigurierbare Erinnerungsintervalle
- Meta-Felder an Rechnungen zur Verfolgung des Mahnstatus
- Vollständig anpassbare E-Mail-Vorlagen

## Systemvoraussetzungen

Sie benötigen die Möglichkeit, Cronjobs auf Ihrem Server auszuführen, entweder in Ihrer Hosting-Administrationsplattform oder manuell über `crontab -e`.
Dies ist erforderlich, um den Befehl `bin/console invoice-payment-reminder:send` täglich auszuführen.

## Einrichtungsschritte nach der Installation

### 1. Plugin konfigurieren

Öffnen Sie **System > Einstellungen > Invoice Payment Reminder**, um das Plugin zu konfigurieren:

Es gibt zwei Blöcke, um das Plugin zu konfigurieren: "Zahlungserinnerungen an Kimai Benutzer" und "Zahlungserinnerungen an Kunden"

- **Benachrichtigungsart**: Legen Sie fest, wer interne Benachrichtigungen erhält:
  - *Nur Rechnungsersteller*: Nur die Person, die die Rechnung erstellt hat.
  - *Nur ausgewählte Benutzer*: Nur die in der Konfiguration ausgewählten Benutzer.
  - *Rechnungsersteller und ausgewählte Benutzer*: Beide Gruppen erhalten Benachrichtigungen.
- **Benutzer benachrichtigen**: Wählen Sie die Benutzer aus, die Benachrichtigungen erhalten sollen.
- **Rechnung anhängen**: Aktivieren oder deaktivieren Sie den Rechnungsanhang in der Kunden-E-Mail.
- **Zahlungseingang prüfen**: Sendet beim Erreichen der Fälligkeit eine E-Mail, um an die Prüfung des Zahlungseingangs zu erinnern.
- **Erinnerungsintervalle**: Konfigurieren Sie die Anzahl der Tage nach Fälligkeit für jede Mahnstufe.

### 2. Cronjob einrichten

Damit Erinnerungen täglich automatisch versendet werden, richten Sie einen Cronjob ein.

Fügen Sie folgende Zeile in Ihre Crontab ein (täglich um 8:00 Uhr morgens):

```bash
0 8 * * * cd /path/to/kimai && bin/console invoice-payment-reminder:send --env=prod >> var/log/invoice-reminder.log 2>&1
```

### 3. Befehl manuell ausführen

Sie können den Befehl auch manuell ausführen:

```bash
bin/console invoice-payment-reminder:send
```

Mit der Option `--dry-run` testen Sie den Ablauf, ohne E-Mails zu versenden oder Daten zu speichern:

```bash
bin/console invoice-payment-reminder:send --dry-run
```

## E-Mail-Vorlagen anpassen

Die Standard-E-Mail-Vorlagen befinden sich in `Resources/views/emails/`:
- `customer_reminder.html.twig` – Wird an den Kunden gesendet.
- `user_check_payment_received.html.twig` – Wird an Mitarbeitende gesendet, wenn eine Rechnung fällig ist.
- `user_notification.html.twig` – Wird an Mitarbeitende gesendet, wenn eine Kundenerinnerung verschickt wurde.

> **Wichtig:** Passen Sie die Originaldateien des Plugins nicht direkt an, da Plugin-Updates Ihre Änderungen überschreiben würden. Erstellen Sie stattdessen ein eigenes Kimai-Plugin mit einem `EventSubscriber`, der auf das `ModifyTemplatedEmailEvent` reagiert.

Weitere Informationen zur Plugin-Entwicklung finden Sie in der [Kimai Plugin-Dokumentation](https://www.kimai.org/documentation/plugins.html).

## Übersetzung

Das Plugin wird in zwei Sprachen angeboten: Deutsch und Englisch.
Um das Plugin in Ihrer Sprache anzubieten, kontaktieren Sie mich bitte, dann werde ich die Beschriftungen entsprechend übersetzen.
{% else %}
## Automated payment reminders by email

A Kimai plugin that automatically sends payment reminders for overdue invoices — to the customer with the invoice attached and internally to the responsible team members.

No more manual follow-ups: the plugin checks daily for open invoices and sends tiered reminders based on how long the payment is overdue.

## What's included?

- Daily check for overdue invoices with status "Pending"
- Email reminders to the customer (optionally with the invoice attached)
- Internal notifications to invoice creators and/or selected users
- 3 reminder levels:
  - Level 1: 1 day after due date
  - Level 2: 8 days after due date
  - Level 3: 15 days after due date
- Configurable reminder intervals
- Custom meta fields on invoices to track reminder status
- Fully customizable email templates

## System Requirements

You need the ability to execute cronjobs on your server, either in your hosting administration platform or manually via `crontab -e`.
This is required for running the command `bin/console invoice-payment-reminder:send` on a daily basis.

## Setup steps after Installation

### 1. Configure the plugin

Go to **System > Settings > Invoice Payment Reminder** to configure the plugin:

There are two sections for configuring the plugin: “Payment Reminders for Kimai Users” and “Payment Reminders for Customers”

- **Notification Strategy**: Choose who receives internal notifications:
  - *Invoice creator only*: Only the user who created the invoice.
  - *Selected users only*: Only specific users selected in the configuration.
  - *Invoice creator and selected users*: Both groups receive notifications.
- **Notify Users**: Select the users who should receive notifications (multiselect).
- **Attach Invoice**: Enable or disable attaching the invoice PDF to the customer reminder email.
- **Check Bank Account**: When enabled, sends an email to internal users when an invoice becomes due, reminding them to check for payment receipt.
- **Reminder Intervals**: Configure the number of days after the due date for each reminder level.

### 2. Set up the cron job

To send reminders automatically every day, add a cron job to your server.

Add the following line to your crontab (runs daily at 8:00 AM):

```bash
0 8 * * * cd /path/to/kimai && bin/console invoice-payment-reminder:send --env=prod >> var/log/invoice-reminder.log 2>&1
```

### 3. Run the command manually

You can also run the command manually at any time:

```bash
bin/console invoice-payment-reminder:send
```

Use the `--dry-run` option to test the process without sending any emails or writing to the database:

```bash
bin/console invoice-payment-reminder:send --dry-run
```

## Customizing email templates

The default email templates are located in `Resources/views/emails/`:
- `customer_reminder.html.twig` — Sent to the customer.
- `user_check_payment_received.html.twig` — Sent to internal users when an invoice is due to prompt them to check for payment receipt.
- `user_notification.html.twig` — Sent to internal users when a customer reminder has been dispatched.

> **Important:** Do not modify the original plugin templates directly, as any plugin update will overwrite your changes.
> Instead, customize the templates by creating your own Kimai plugin using an `EventSubscriber` that listens to `ModifyTemplatedEmailEvent`.

How to create a Kimai plugin is explained in the official [Kimai Plugin Documentation](https://www.kimai.org/documentation/plugins.html).

## Translation

The plugin is available in two languages: English and German.
To offer the plugin in your language, please contact me, and I will translate the labels accordingly.
{% endif %}
