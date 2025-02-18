---
title: Emails
description: Configure email transport for Kimai
---

Kimai uses the [Symfony Mailer component](https://symfony.com/doc/current/mailer.html) for sending emails. 
Please read their documentation to find out more about possible connection details.

## Activating email

You have to adapt two settings in your `.env` [configuration file]({% link _documentation/local-yaml.md %}):

- `MAILER_URL` - the connection details for sending emails
- `MAILER_FROM` - an application wide "from" address for all emails

### MAILER_URL

These are some examples to configure your SMTP for sending emails: 

- Deactivated: `null://null`
- SMTP: `smtp://localhost:25`
- Sendmail: `sendmail://default`
- Gmail: `smtps://{username}:{password}@smtp.gmail.com:465`
- Brevo: `smtps://{username}:{password}@smtp-relay.brevo.com:465`
- Sendgrid: `smtps://{username}:{password}@smtp.sendgrid.net:465`

More explanation can be found int the [Symfony mailer documentation](https://symfony.com/doc/current/mailer.html).

Some more examples for the SMTP transport:

- SMTP with authentication: `smtp://user:password@smtp.example.com:25`
- With email as username: `smtp://info@example.com:password@smtp.example.com:25`
- With SSL encryption: `smtp://info@example.com:password@smtp.example.com:443?encryption=ssl`
- With TLS encryption: `smtp://user:password@smtp.example.com:587?encryption=tls`

You get all the above settings from your email provider. Ports and encryption can vary. 

## Testing emails

You can run `bin/console kimai:mail:test recipient@example.com` to verify if the connection string is working.

You have to replace:
- `admin@example.com` with your own email address to receive the test email 
- `test@example.com` with the value you have configured for `MAILER_FROM`

## Troubleshooting

You cannot try to  test the `password reset` for sending emails, as it has a security feature which prevents recurring usage. 
Kimai stores a timestamp when the last password reset was requested and does not allow another request in a certain timespan.

To work around that waiting time, you can reset the timer by issuing the following command (replace the username with yours):
```bash
bin/console doctrine:query:dql "UPDATE App\Entity\User u SET u.passwordRequestedAt = null WHERE u.username = 'anna_admin'"
```

### Error 500 when sending emails 

Some commonly used password characters can cause problems, which lead to a 500 error when trying to send an email. 
Those could be for example: `@`, `+`, `:` or `#` - but other ones might be affected as well!

You need to encode them, so they can be safely used in the connection URL. 
This can be done with one PHP command, assuming your password is `mG0/d1@3aT#Z+s1` then execute:

```bash
php -r "echo urlencode('mG0/d1@3aT#Z+s1');"
mG0%2Fd1%403aT%23Z%2Bs1%
```

Your `MAILER_URL` would look like this:
```
MAILER_URL="smtp://user:mG0%2Fd1%403aT%23Z%2Bs1%@smtp.example.com:443?encryption=ssl"
```

### SMTP does not accept emails

If you have the following error in your logfile:
```
app.ERROR: Exception occurred while flushing email queue: Expected response code 354 but got code "503", with message "503-All RCPT commands were rejected with this error: 503-R1: HELO should be a FQDN or address literal (See RFC 2821 4.1.1.1) 503 Valid RCPT command must precede DATA " [] []
```
you might suffer from a wrong configuration (read the documentation linked above) and try a fully featured SMTP URL with a dedicated user account for authentication:  
```
MAILER_URL=smtps://username:password@mx.example.com:587
```
Password should not contain URL characters like '&@:', which can cause problems parsing the SMTP URL (see above). 
