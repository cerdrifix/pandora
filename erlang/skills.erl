-module(skills).
-export([get/0, get/1, print/0]).
-include("records.hrl").

%% Used to manage skills definitions

get() ->
	Result = db:get(<<"SELECT id, description FROM SKILLS">>),
	Items = emysql:as_record(Result, skill, record_info(fields, skill)),
	Items.

get(Key) ->
	Result = db:get(<<"SELECT id, description FROM SKILLS WHERE id = ?">>, [Key]),
	Items = emysql:as_record(Result, skill, record_info(fields, skill)),
	Items.

print() ->
	Items = skills:get(),
	[begin
		io:format("skill: ~p, ~p~n", [Item#skill.id, Item#skill.description])
	end || Item <- Items],
	ok.