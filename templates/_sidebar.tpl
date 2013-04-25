{# Cache the sidebar, depending on the stuff in the 'article' category #}
{% cache 3600 _sidebar cat='article' %}

	<form action="http://{{ m.site.hostname }}/search" id="cse-search-box">
	  	<div id="dhq_search">
	    	<input type="hidden" name="cx" value="003735940401219303672:4tswkohegxi" />
	    	<input type="hidden" name="cof" value="FORID:10" />
	    	<input type="hidden" name="ie" value="UTF-8" />
	    	<input id="s_text" type="text" name="q" size="31" />
	    	<input id="s_submit" type="submit" name="sa" value="搜 索" />
	  	</div>
	</form>

	<h2>{_ 文章归档 _}</h2>
	<ul class="simple-list">
		{% for year, months in m.search[{archive_year_month cat='article'}] %}
			<li><a class="caption" href="{% url archives_y year=year %}">{{ year }}</a>
				<ul>
					{% for row in months %}
					<li><a href="{% url archives_m year=year month=row.month %}">{{ row.month_as_date|date:"F" }} ({{ row.count }})</a></li>
					{% endfor %}
				</ul>
			</li>
		{% endfor %}
	</ul>

	<h2>{_ 标签云 _}</h2>
	<ul class="inline-list clearfix">
		{% for id, count in m.search[{keyword_cloud cat='article'}] %}
		<li><a href="{{ m.rsc[id].page_url }}">{{ m.rsc[id].title }} ({{ count }}){% if not forloop.last %},{% endif %}</a></li>
		{% endfor %}
	</ul>
	
	<h2>{_ 近期文章 _}</h2>
	<ul class="article_list clearfix">
		{% with m.site.hostname|default:"localhost" as hostname %}
		{% for id in m.search[{query cat="article" is_published='true' sort='-rsc.publication_start' pagelen=10}] %}
			{% if not m.rsc[id].seo_noindex %}
				{% with m.rsc[id].page_url as page_url %}
					{% ifnotequal page_url "/" %}
		<li><a href="http://{{ hostname }}{{ page_url|escapexml }}" title="{{ m.rsc[id].title }}">{{ m.rsc[id].title }}</a></li>
					{% endifnotequal %}
				{% endwith %}
			{% endif %}
		{% endfor %}
		{% endwith %}
	</ul>

{% endcache %}

{% if m.rsc[id].is_editable %}
	{% button text=_"编 辑" action={redirect dispatch="admin_edit_rsc" id=id} %}
{% endif %}
