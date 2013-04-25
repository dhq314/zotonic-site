{% extends "page.tpl" %}

{% block title %}{{ m.rsc[id].title }}{% endblock %}

{% block chapeau %}

	{% include "_article_chapeau.tpl" %}

{% endblock %}

{% block content %}

    <h1 class="ht">{{ m.rsc[id].title }}</h1>

    {{ m.rsc[id].body|show_media }}

	{% include "_article_keywords.tpl" %}
	
	{% include "_article_prevnext.tpl" id=id %}

	
	<section id="comments">
		<div id="disqus_thread"></div>
	    <script type="text/javascript">
	        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
	        var disqus_shortname = 'dhqme'; // required: replace example with your forum shortname
	
	        /* * * DON'T EDIT BELOW THIS LINE * * */
	        (function() {
	            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
	            dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
	            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
	        })();
	    </script>
	    <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
	    <a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>
	</section>
	

{% endblock %}

{% block sidebar %}
	{% include "_article_sidebar.tpl" %}
{% endblock %}
