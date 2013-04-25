<!DOCTYPE html>
<html>
<head>
	<title>{% block title %}{% endblock %} &mdash; {{ m.config.site.title.value }}</title>

	<meta http-equiv="Content-type" content="text/html;charset=UTF-8" />

	{% all include "_html_head.tpl" %}

	{% lib "bootstrap/css/bootstrap.min.css" %}
	{% lib "bootstrap/css/bootstrap-responsive.min.css" %}
	{% lib 
		"css/jquery.loadmask.css"
		"css/zp-project.css" 
		"css/zp-menu.css" 
	%}
	{% block html_head_extra %}{% endblock %}
	
</head>
<body class="{% block page_class %}page{% endblock %}">
	<section class="zp-wrapper">

        <header class="clearfix">
		<h1>
			<a href="/">
				{{ m.config.site.title.value }}
			</a>
		</h1>
		{% if m.config.site.subtitle.value %}<h2>{{ m.config.site.subtitle.value }}</h2>{% endif %}
        </header>
        <nav class="clearfix">
            {% menu id=id %}
        </nav>

        <section class="clearfix">

         	{% block content %}
				<!-- The default content goes here. -->
         	{% endblock %}

        </section>

        <footer class="clearfix">
			<div class="powered_by">
				<p class="footer-blog-title">
					由 <a href="http://zotonic.com">Zotonic</a> 强力驱动
					&nbsp;|&nbsp;
					<a href="http://{{ m.config.site.hostname.value }}/sitemap.html">站点地图</a>
				</p>
			</div>
		</footer>

    </section>
    
	{% block _js_include_extra %}{% endblock %}

</body>
</html>
