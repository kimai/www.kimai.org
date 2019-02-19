---
title: Emails
description: Configure email transport for Kimai
toc: true
---

Kimai uses the [Swift MailerBundle](https://symfony.com/doc/current/email.html) for sending emails. 
Please read their documentation, there are a lot of possible [configuration settings](https://symfony.com/doc/current/reference/configuration/swiftmailer.html) that you might want to adapt to your needs.

If not otherwise noted, all emails will be sent instantly (unless spooling is activated in [swiftmailer.yaml]({{ site.kimai_v2_file }}/config/packages/swiftmailer.yaml)).

## Activating email

You have to adapt two settings in your `.env` [configuration file]({% link _documentation/configurations.md %}):

- `MAILER_URL` - your smtp connection details for sending emails
- `MAILER_FROM` - an application wide "from" address for all emails

## All existing emails

The following emails will be sent by Kimai:

### Security related emails

If you want to change the content of the emails, please have a look at the [FOSUserBundle config]({{ site.kimai_v2_file }}/config/packages/fos_user.yaml) 
and its [documentation](https://symfony.com/doc/current/bundles/FOSUserBundle/emails.html).

- Password reset 
- Account approval (only if activated, see [User docu]({% link _documentation/users.md %}))

## Troubleshooting

You can test your email configuration with the command `bin/console -vv swiftmailer:email:send`, which will ask you for all required fields:
- `to`
- `from`
- `subject`
- `body`

The email will be sent using the transport from your configured `MAILER_URL`.

### SMTP does not accept emails

If you have the following error in your logfile:
```
app.ERROR: Exception occurred while flushing email queue: Expected response code 354 but got code "503", with message "503-All RCPT commands were rejected with this error: 503-R1: HELO should be a FQDN or address literal (See RFC 2821 4.1.1.1) 503 Valid RCPT command must precede DATA " [] []
```
you might suffer from a wrong configuration (read the documentation linked above) and try a full featured SMTP URL with a dedicated user account for authentication:  
```
MAILER_URL=smtp://username:password@mx.example.com:587?encryption=tls&auth_mode=plain
```
Password should not contain URL characters like '&@:', which can cause problems parsing the SMTP URL. 
If you have to use one of these characters, you can:
- try to adjust the swiftmailer configuration at [swiftmailer.yaml]({{ site.kimai_v2_file }}/config/packages/swiftmailer.yaml)
- urlencode the password with `$ php -r "echo urlencode('your@password');"` 

If that still doesn't help, try to set a `local_domain` in the [local.yaml]({% link _documentation/configurations.md %}) config file:
```yaml
swiftmailer:
    local_domain: 'kimai.local' 
```
This `local_domain` will be used for the `HELO` command when SwiftMailer contacts your SMTP.
