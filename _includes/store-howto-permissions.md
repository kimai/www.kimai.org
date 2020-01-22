
{% capture alert_note %}
Read how to assign these permission to your user roles in the [permission documentation]({% link _documentation/permissions.md %}).
{% endcapture %}
{% assign alert_note = alert_note|markdownify %}

{% include alert.html icon="fas fa-exclamation" type="warning" alert=alert_note %}
