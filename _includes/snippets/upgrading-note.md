{% capture upgrading_note %}
Important: Finally execute the version specific tasks from the [UPGRADING]({{ site.kimai_v2_file }}/UPGRADING.md) guide.
{% endcapture %}
{% assign upgrading_note = upgrading_note| markdownify %}
{% include alert.html icon="fas fa-exclamation" type="warning" alert=upgrading_note %}
