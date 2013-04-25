<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>SiteMap - {{ m.config.site.title.value }}</title>
<meta name="keywords" content="SiteMap,{{ m.config.site.title.value }}" />
<link rel="profile" href="http://gmpg.org/xfn/11" />
<style type="text/css">
body {
	margin: 0;
	font-family: Verdana;
	font-size: 12px;
}
a, a:visited {
	color: #333333;
}
li {
	margin-top: 8px;
}
#nav, #content, #footer {
	padding: 8px; 
	border: 1px solid #EEEEEE; 
	clear: both; 
	width: 95%; 
	margin: auto; 
	margin-top: 10px;
}
</style>
</head>
<body>

{% with m.site.hostname|default:"localhost" as hostname %}

<h2 style="text-align: center; margin-top: 20px">{{ m.config.site.title.value }}'s SiteMap </h2>
<div id="nav">
	<a href="http://{{ hostname }}"><strong>{{ m.config.site.title.value }}</strong></a>  &raquo; <a href="http://{{ hostname }}/sitemap.html">SiteMap</a>
</div>
<div id="content">
<h3>文章列表</h3>
<ul>

	{% for id in result %}
		{% if not m.rsc[id].seo_noindex %}
			{% with m.rsc[id].page_url as page_url %}
				{% ifnotequal page_url "/" %}
	<li><a href="http://{{ hostname }}{{ page_url|escapexml }}" title="{{ m.rsc[id].title }}" target="_blank">{{ m.rsc[id].title }}</a></li>
				{% endifnotequal %}
			{% endwith %}
		{% endif %}
	{% endfor %}

</ul>
</div>

<center>
<br />
<br />
<div style="text-algin: center; font-size: 11px">
	<strong><a href="http://{{ hostname }}/sitemap.xml" target="_blank">SiteMap</a></strong>
</div>
<br />
<br />
</center>

{% endwith %}
</body>
</html>