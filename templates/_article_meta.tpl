<p class="article-meta">
	{_ Posted on _} {{ m.rsc[id].publication_start | date:"Y-m-d H:i:s"}}
	{% if m.rsc[id].author.id %}{_ by _} {{ m.rsc[id].author.title }}{% endif %}
</p>
