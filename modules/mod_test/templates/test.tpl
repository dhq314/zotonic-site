{% extends "base.tpl" %}

{% block content %}

	<h1>This is mod_test/templates/test.tpl</h1>
	
	<h2>Print m.list_links.page_home.body</h2>
	{% print m.list_links.page_home.body %}
	<h2>Print m.rsc.page_home.body|list_links</h2>
	{% print m.rsc.page_home.body|list_links %}
	
	
	{% with "<a alt='my alt caption' href='http://dhq.me/'>ASTEKK Blog</a> \
	foo bar <a href=\"http://dhq.me\" title=Awesome ness ref=\"Nevermind me\" >My blog</a> glarb." as text %}
	
		<h2>For loop for: "{{ text }}"|list_links</h2>
		<h3>m.list_links[text] would work just as well</h3>
		
		{% for link in text|list_links %}
		{#% for link in m.list_links[text] %#}
			<hr />
			Debug link value: {% print link %}
			
			Text: {{ link.text }}<br />
			Value: {{ link.value }}<br />
			Url: {{ link.href }}<br />
			
			<h3>Props loop</h3>
			{% for Prop, Value in link %}
				{{ Prop }} = {{ Value }}<br />
			{% endfor %}
		
		{% endfor %}
	
	{% endwith %}

{% endblock %}
