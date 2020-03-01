---
title: Emails
description: Configure email transport for Kimai
toc: true
---

Kimai uses the [Symfony Mailer component](https://symfony.com/doc/current/components/mailer.html) for sending emails. 
Please read their documentation to find out more about possible connection details.

## Activating email

You have to adapt two settings in your `.env` [configuration file]({% link _documentation/configurations.md %}):

- `MAILER_URL` - the connection details for sending emails
- `MAILER_FROM` - an application wide "from" address for all emails

## Troubleshooting

You can test your email configuration by registering a new account or using the password reset function.

### MAILER_URL with special character 

If your SMTP credentials contain special character like `@` or other ones which are not URL-safe, then they need to be urlencoded. 
This can be done with one command, assuming your password is `mG0/d1@3aT.Z)s` then execute:

```bash
php -r "echo urlencode('mG0/d1@3aT.Z)s');"
mG0%2Fd1%403aT.Z%29s
```

Your `MAILER_URL` might look like this:
```
MAILER_URL="smtp://user:mG0%2Fd1%403aT.Z%29s@localhost:25?encryption=&auth_mode="
```

### SMTP does not accept emails

If you have the following error in your logfile:
```
app.ERROR: Exception occurred while flushing email queue: Expected response code 354 but got code "503", with message "503-All RCPT commands were rejected with this error: 503-R1: HELO should be a FQDN or address literal (See RFC 2821 4.1.1.1) 503 Valid RCPT command must precede DATA " [] []
```
you might suffer from a wrong configuration (read the documentation linked above) and try a full featured SMTP URL with a dedicated user account for authentication:  
```
MAILER_URL=smtp://username:password@mx.example.com:587?encryption=tls&auth_mode=plain
```
Password should not contain URL characters like '&@:', which can cause problems parsing the SMTP URL (see above). 
