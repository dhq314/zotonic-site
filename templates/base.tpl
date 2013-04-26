<!DOCTYPE html>
<html>
<head>

<!-- FUCK中国电信 -->
<style> html{display : none ; } </style>
<script>
   if( self == top ) {
       document.documentElement.style.display = 'block' ; 
   } else {
       top.location = self.location ; 
   }
</script>

<meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
<meta name="google-site-verification" content="5z5kozqxLp1xEWOAcS--mBbOw8AmVHvHcQ_gWGRFgrM" />

<title>{% block title %}{% endblock %} &mdash; {{ m.config.site.title.value }}</title>

<meta name="author" content="D.H.Q" />
<meta name="generator" content="zotonic {{ m.config.zotonic.version.value }}" />

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

			{% block content_area %}
			{% block chapeau %}{% endblock %}

            <div id="content" class="zp-70">
                <div class="padding">
                    {% block content %}
						<!-- The default content goes here. -->
                    {% endblock %}
                </div>
            </div>

            <section id="sidebar" class="zp-30 last">
                {% block sidebar %}
					{% include "_sidebar.tpl" %}
    	        {% endblock %}
            </section>

			{% endblock %}

        </section>

        <footer class="clearfix">
			<div class="powered_by">
				<p class="footer-blog-title">
					由 <a href="http://zotonic.com">Zotonic</a> 强力驱动
					&nbsp;|&nbsp;
					<a href="http://{{ m.config.site.hostalias.value }}/sitemap.html">站点地图</a>
				</p>
			</div>
		</footer>

    </section>

	{% include "_js_include_jquery.tpl" %}
    {% lib 
			"js/apps/zotonic-1.0.js" 
			"js/apps/z.widgetmanager.js" 
			"js/modules/livevalidation-1.3.js" 
			"js/modules/z.inputoverlay.js"
			"js/modules/jquery.loadmask.js"
            "js/z.superfish.js" 
	%}
	
	{% block _js_include_extra %}{% endblock %}

    <script type="text/javascript">
        $(function() { $.widgetManager(); });
    </script>

	{% stream %}
    {% script %}

    {% all include "_html_body.tpl" %}

</body>
</html>
