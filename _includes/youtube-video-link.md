{%- if include.id -%}
{%- assign video = site.data.videos[include.id] -%}
[{{ video.title }}](https://www.youtube.com/watch?v={{ video.id }})
{%- endif -%}
