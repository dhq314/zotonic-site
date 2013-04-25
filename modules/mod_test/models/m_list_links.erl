%% file: mod_test/models/m_list_links.erl

-module(m_list_links).
-author("Joe Deng <dhq314@gmail.com>").

-behaviour(gen_model).
-include_lib("zotonic.hrl").
-export([
	 m_find_value/3, 
	 m_to_list/2, 
	 m_value/2
	]).


m_find_value(S, #m{value=undefined}, Context) when is_list(S) orelse is_binary(S) ->
    filter_list_links:list_links(S, Context);
m_find_value(Id, #m{value=undefined} = M, Context) ->
    m_rsc:m_find_value(Id, M, Context);
m_find_value(Key, #m{value=Id} = M, Context) when is_integer(Id) ->
    case m_rsc:m_find_value(Key, M, Context) of
	undefined ->
	    undefined;
	S ->
	    filter_list_links:list_links(?__(S, Context), Context)
    end;

m_find_value(value, #m{}=M, Context) -> 
    m_value(M, Context);
m_find_value(text, #m{value=Link}, _Context) ->
    {match, [M]} = re:run(Link, ">(.*)</.>", [{capture, all_but_first, binary}]),
    M;
m_find_value(Prop, #m{} = M, Context) ->
    proplists:get_value(atom_to_list(Prop), m_to_list(M, Context)).


m_to_list(#m{value=V}, _Context) ->
    case re:run(V, "(\\w+)=(['\"]?)(.*?)\\2(\\s|>)", [global, {capture, [1,3], list}]) of
	nomatch -> [];
	{match, M} -> [ {Prop, Val} || [Prop, Val] <- M ]
    end.


m_value(#m{value=V}, _Context) ->
    V.

