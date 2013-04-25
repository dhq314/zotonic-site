%% @author Joe Deng <dhq314@gmail.com>
%% @doc Customizing the Read More content, use like the wordpress more tag.

-module(filter_read_more).
-export([read_more/2, read_more/3]).


read_more(undefined, _Context) ->
    undefined;
read_more(RId, Context) ->
    read_more(RId, 200, Context).

read_more(undefined, _CutNum, _Context) ->
    undefined;
read_more(RId, CutNum, Context) ->
    case m_rsc:rid(RId, Context) of
        undefined ->
            undefined;
        Id ->
			case z_trans:lookup_fallback(m_rsc:p(Id, body, Context), Context) of
				undefined ->
					[];
				Content ->
					case re:run(Content, "<!--more(.*?)?-->", [{capture, first, list}]) of
			            {match, _} ->
							[Summary | _] = re:split(Content, "<!--more(.*?)?-->", [{return, list}]),
							z_string:trim(Summary);
			            _ ->
							get_summary_text(Content, Id, CutNum, Context)
			        end
			end
    end.


%% @doc 获取文章原来的摘要内容
get_summary_text(Content, Id, CutNum, Context) ->
	Summary =
		case m_rsc:p(Id, summary, Context) of
        	{trans, _} = T -> z_trans:lookup_fallback(T, Context);
        	Other -> Other
    	end,
    S1 = 
		case z_utils:is_empty(Summary) of
      		true -> z_html:strip(Content);
       		false -> Summary
   		end,
    z_string:trim(z_string:truncate(S1, z_convert:to_integer(CutNum))).
