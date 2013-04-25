{% extends "base.tpl" %}

{% block title %} {% if q.q %} {_ 搜索: _} {{ q.q }} {% endif %} {% endblock %}

{% block content %}

{% if q.q %}<h5 class="chapeau">{_ 搜索: _}  {{ q.q }}</h5>{% endif %}

<div id="cse-search-results">正在由 google 提供强力数据中...</div>
<script type="text/javascript">
  var googleSearchIframeName = "cse-search-results";
  var googleSearchFormName = "cse-search-box";
  var googleSearchFrameWidth = 400;
  var googleSearchDomain = "www.google.com";
  var googleSearchPath = "/cse";
</script>
<script type="text/javascript" src="http://www.google.com/afsonline/show_afs_search.js"></script>
<style type="text/css">
#cse-search-results iframe { width: 600px !important; margin-top: -30px !important; }
</style>

{% endblock %}

{% block sidebar %}
	{% include "_sidebar.tpl" show_cloud=1 %}
{% endblock %}
