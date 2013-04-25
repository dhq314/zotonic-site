{% extends "base_nobar.tpl" %}

{% block title %}{{ m.rsc[id].title }}{% endblock %}

{% block html_head_extra %}
<style type="text/css">
#es_section, #es_load {
	width: 100%;
	color: #AAAAAA;
    font: 14px/24px "Helvetica Neue",Helvetica,Arial,sans-serif;
}
#es_load {
	text-align: center;
	margin: 100px auto;
}
</style>
{% endblock %}

{% block content %}

	<div id="es_section">
		<div id="es_load">Init ErlShell...</div>
	</div>

{% endblock %}


{% block _js_include_extra %}
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
var Domain = "genfsm.herokuapp.com";
$(window).load(function() {
	//加载js     		
    $("#es_load").html("Loading ErlShell Javascript...");
    $.ajax({
        url : "http://genfsm.herokuapp.com/static/js/erlshell_jsonp.js",
        dataType : "script",
        success : function() {
            //加载css 		
            $("#es_load").html("Loading ErlShell CSS...");
            $('<link rel="stylesheet" type="text/css" href="http://genfsm.herokuapp.com/static/css/erlshell.css" />').appendTo("head");
            setTimeout(function() {
                var _html = [];
                _html.push('<div id="es_title">');
                _html.push('    a Erlang Web Shell host on Heroku');
                _html.push('</div>');
                _html.push('<div class="erlshell">');
                _html.push('    <div id="es_div"></div>');
                _html.push('    <button id="erlshell_action">Start</button>');
                _html.push('    <div id="erlshell_tips">');
                _html.push('        <ul>');
                _html.push('            <li>按 "Start" 启动，"Stop" 关闭</li>');
                _html.push('            <li>按回车（Enter）执行命令</li>');
                _html.push('            <li>按上/下方向键显示历史命令</li>');
                _html.push('        </ul>');
                _html.push('        <div id="erlshell_readmore">');
                _html.push('            <a href="http://dhq.me/deploy-erlang-web-shell-with-webmachine-erlydtl-on-heroku" title="在 heroku 上部署基于 webmachine + erlydtl 的 erlang web shell -- ErlShell" target="_blank">更多...</a>'); 
                _html.push('        </div>');
                _html.push('    </div>');
                _html.push('</div>');
                $("#es_section").html(_html.join(''));
                ErlShell.init("erlshell_action");	
            }, 1000);
        },
        error : function(XMLHttpRequest, textStatus, errorThrown) {
            $("#es_load").html('加载失败，请<a href="javascript:window.location.reload();" style="color: #00A9DA; text-decoration: underline;">刷新</a>重试！');
        }  
    });
});
</script>
{% endblock %}
