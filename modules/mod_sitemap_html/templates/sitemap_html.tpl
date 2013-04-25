{% cache 3600 sitemap_html cat="article" %}
	{% with m.search[{query cat="article" is_published='true' sort='-rsc.publication_start'}] as result %}
		{% include "_sitemap_html.tpl" %}
	{% endwith %}
{% endcache %}