{% include "_sidebar.tpl" %}

{% with m.rsc[id].media|without_embedded_media:id as media %}
{% if media %}
<ul class="thumbnails">
	{% for medium in media %}
	<li>
		<a href="{{ medium.id.page_url }}" class="thumbnail">
			{% include "_body_media.tpl" width=300 align="block" id=medium %}
		</a>
	</li>
	{% endfor %}
</ul>
{% endif %}
{% endwith %}
