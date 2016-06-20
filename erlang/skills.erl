-module(skills).
-export([run/0, get/0, get/1, print/0]).
-include("include/records.hrl").

-define(FIELDS, ["id", "description"]).
-define(TABLE, "SKILLS").
-define(KEY, "id").

%% Used to manage skills definitions

run() ->
	skills:print().

get() ->
	Query = "SELECT " ++ string:join(?FIELDS, ", ") ++ " FROM " ++ ?TABLE,
	Result = db:get(Query),
	Items = emysql:as_record(Result, skill, record_info(fields, skill)),
	Items.

get(Key) ->
	Query = "SELECT " ++ string:join(?FIELDS, ", ") ++ " FROM " ++ ?TABLE ++ " WHERE " ++ ?KEY ++ " = ?",
	Result = db:get(Query, [Key]),
	Items = emysql:as_record(Result, skill, record_info(fields, skill)),
	Items.

print() ->
	Items = skills:get(),
	[begin
		io:format("skill: ~p, ~p~n", [Item#skill.id, Item#skill.description])
	end || Item <- Items],
	ok.