<section class="post clearfix">

	<a href="{{m.rsc[id].page_url }}" title="{{ m.rsc[id].title }}">
		{% image m.rsc[id].media[1] height=108 width=120 crop %}
	</a>
	<h1><a href="{{m.rsc[id].page_url }}">{{ m.rsc[id].title }}</a></h1>
	{% include "_article_meta.tpl" id=id %}
	<p class="summary">
		{{ id | read_more }}
	</p>
	<div class="post-continue"><a href="{{ m.rsc[id].page_url }}">{_ 继续阅读 _}&nbsp;&raquo;</a></div>
	
</section>
