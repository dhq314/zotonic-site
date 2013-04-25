{% extends "base.tpl" %}

{% block title %}{_ Articles for _} "{{ m.rsc[q.id].title }}"{% endblock %}

{% block content %}

	<h5 class="chapeau">{_ Articles about _}: {{ m.rsc[q.id].title }}</h5>

	{% with m.search.paged[{referrers id=q.id page=q.page pagelen=m.config.site.pagelen.value}] as result %}

		{% for id, predicate in result %}
			{% include "_article_summary.tpl" id=id %}
		{% endfor %}

		{% pager result=result dispatch='keyword' id=id slug=m.rsc[id].slug %}

	{% endwith %}

{% endblock %}

{% block sidebar %}
	{% include "_sidebar.tpl" show_cloud=1 %}
{% endblock %}
