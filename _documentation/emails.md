---
title: Emails
description: Configure email transport for Kimai
toc: true
redirect_from: 
- /documentation/email/
- /v1/email.html
- /documentation/2.0/emails.html
---

Kimai uses the [Symfony Mailer component](https://symfony.com/doc/current/mailer.html) for sending emails. 
Please read their documentation to find out more about possible connection details.

## Activating email

You have to adapt two settings in your `.env` [configuration file]({% link _documentation/local-yaml.md %}):

- `MAILER_URL` - the connection details for sending emails
- `MAILER_FROM` - an application wide "from" address for all emails

### MAILER_URL

The following list of providers are supported out-of-the-box by Kimai: 

- Deactivated: `null://null`
- SMTP: `smtp://localhost:25`

The following specialized transports (usually helper to simplify the connection string) can be installed manually:

| Service     | Install with                               | SMTP config example                            |
|-------------|--------------------------------------------|------------------------------------------------|
| Amazon SES  | composer require symfony/amazon-mailer     | `ses+smtp://USERNAME:PASSWORD@default`         |
| Gmail       | composer require symfony/google-mailer     | `gmail+smtp://USERNAME:PASSWORD@default`       |
| MailChimp   | composer require symfony/mailchimp-mailer  | `mandrill+smtp://USERNAME:PASSWORD@default`    |
| Mailgun     | composer require symfony/mailgun-mailer    | `mailgun+smtp://USERNAME:PASSWORD@default`     |
| Mailjet     | composer require symfony/mailjet-mailer    | `mailjet+smtp://ACCESS_KEY:SECRET_KEY@default` |
| Postmark    | composer require symfony/postmark-mailer   | `postmark+smtp://ID@default`                   |
| SendGrid    | composer require symfony/sendgrid-mailer   | `sendgrid+smtp://KEY@default`                  |
| Sendinblue  | composer require symfony/sendinblue-mailer | `sendinblue+smtp://USERNAME:PASSWORD@default`  |
| OhMySMTP    | composer require symfony/oh-my-smtp-mailer | `ohmysmtp+smtp://API_TOKEN@default`            |
{: .table }

Be aware that you can achieve the same in most cases (without installing composer packages) by rewriting the MAILER_URL, e.g.:

- Gmail: `smtps://{username}:{password}@smtp.gmail.com:465`
- Sendinblue: `smtps://{username}:{password}@smtp-relay.sendinblue.com:465`

Read more at [Symfony docs](https://symfony.com/doc/current/mailer.html)

## Troubleshooting

You can test your email configuration by registering a new account or using the password reset function.

During your initial tests, you might try to use the `password reset` function over and over again.
That will not work, as Kimai stores a timestamp when the last password reset was requested  and does not 
allow another request in a certain timespan.

To work around that waiting time, you can reset the timer by issuing the following command (replace the username with yours):
```bash
bin/console doctrine:query:dql "UPDATE App\Entity\User u SET u.passwordRequestedAt = null WHERE u.username = 'anna_admin'"
```

### MAILER_URL with special character 

If your SMTP credentials contain special character like `@` or other ones which are not URL-safe, then they need to be urlencoded. 
This can be done with one command, assuming your password is `mG0/d1@3aT.Z)s` then execute:

```bash
php -r "echo urlencode('mG0/d1@3aT.Z)s');"
mG0%2Fd1%403aT.Z%29s
```

Your `MAILER_URL` might look like this:
```
MAILER_URL="smtp://user:mG0%2Fd1%403aT.Z%29s@localhost:25"
```

### SMTP does not accept emails

If you have the following error in your logfile:
```
app.ERROR: Exception occurred while flushing email queue: Expected response code 354 but got code "503", with message "503-All RCPT commands were rejected with this error: 503-R1: HELO should be a FQDN or address literal (See RFC 2821 4.1.1.1) 503 Valid RCPT command must precede DATA " [] []
```
you might suffer from a wrong configuration (read the documentation linked above) and try a fully featured SMTP URL with a dedicated user account for authentication:  
```
MAILER_URL=smtp://username:password@mx.example.com:587
```
Password should not contain URL characters like '&@:', which can cause problems parsing the SMTP URL (see above). 
