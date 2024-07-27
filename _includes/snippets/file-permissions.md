{% note "Adjust file permission" %}
You have to allow PHP (your webserver process) to write to `var/` and it subdirectories.

Here is an example for Debian/Ubuntu, to be executed inside the Kimai directory:

```plaintext
chown -R :www-data .
chmod -R g+r .
chmod -R g+rw var/
```

You might not need these commands in a shared-hosting environment.
And you probably need to prefix them with `sudo` and/or the group might be called different from `www-data`.
{% endnote %}
