{% with id.o.subject as tags %}
{% if tags %}
<div class="post-tags keywords">
	{_ 发表于: _}&nbsp;&nbsp;<span>{{ m.rsc[id].publication_start | date:"Y-m-d H:i:s"}}</span>
	&nbsp;&nbsp;
	{_ 标签: _}
	{% for id in tags %}
	<a href="{{ m.rsc[id].page_url }}">{{ m.rsc[id].title }} </a>
	{% endfor %}
</div>
{% endif %}
{% endwith %}
