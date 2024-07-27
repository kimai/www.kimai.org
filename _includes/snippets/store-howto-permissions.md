{% capture alert_note %}
Read how to assign these permissions to your user roles in the [permission documentation]({% link _documentation/permissions.md %}).
{% endcapture %}
{% assign alert_note = alert_note|markdownify %}
{% include alert.html type="info" icon="fas fa-exclamation" alert=alert_note %}
