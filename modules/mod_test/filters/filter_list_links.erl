%% file: mod_test/filters/filter_list_links.erl

-module(filter_list_links).
-author("Joe Deng <dhq314@gmail.com>").
-include_lib("zotonic.hrl").
-export([list_links/2]).


list_links(In, _Context) ->
	io:format("~p~n", [_Context]),
	case In of
		undefined -> [];
		_ ->
			case re:run(In, "<[aA][^>]*>[^<]*</[aA]>", [global, {capture, first, binary}]) of
				nomatch -> [];
				{match, M} -> [#m{model=m_list_links, value=V} || [V] <- M]
			end 
	end.