Give your team a familiar organisation sign-in for Kimai.

OIDC Authentication for Kimai connects a self-hosted Kimai installation to a compatible HTTPS OpenID Connect provider. Administrators configure the connection in Kimai, choose who can sign in and map provider groups to Kimai roles.

## Features

- OpenID Connect Authorization Code Flow with S256 PKCE.
- Provider discovery, state and nonce checks, token signature and claim validation.
- Optional automatic creation of new Kimai accounts.
- Optional verified-email requirement and profile synchronisation.
- Access restrictions based on provider groups.
- Group-to-role mapping with optional synchronisation at sign-in.
- Explicit linking of an existing Kimai account to an OIDC identity.
- Persistent identity links based on issuer and subject.
- Configurable sign-in button label.
- Local emergency sign-in remains available.
- Optional provider logout through the dedicated OIDC logout flow, where supported.

## Requirements

Self-hosted Kimai 2.67 or newer, a PHP version supported by both Kimai and the plugin, and a compatible HTTPS OpenID Connect provider. The plugin documents PHP 8.2–8.5. An Authelia configuration guide is included. Provider-specific claims and settings may require configuration; compatibility with every provider is not guaranteed.

## Existing accounts

Matching email addresses never automatically link an existing account. Users link their provider identity while signed in to their existing Kimai account.

## Purchase

One-time purchase of EUR 79 (excluding VAT; applicable VAT is calculated at checkout). It includes the official distribution package, version 1.x updates when released, and 12 months of email support for one designated production installation and its staging environment. The plugin ZIP is sent by email after payment, normally within one business day. A 14-day money-back guarantee applies.

The software is licensed under AGPL-3.0-or-later; the support scope does not restrict the rights granted by that licence. There is no licence key and no online activation.

## Documentation and support

- Setup guide: [oidc.princic.net/customer-guide.html](https://oidc.princic.net/customer-guide.html)
- Product details and terms: [oidc.princic.net](https://oidc.princic.net/)
- Support: [support@princic.net](mailto:support@princic.net)

This is an independent third-party plugin. It is not affiliated with or endorsed by Kimai or Kevin Papst.
