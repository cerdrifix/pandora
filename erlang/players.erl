-module(players).
-export([run/0, get/1, print/1]).
-include("records.hrl").

%% Used to manage skills definitions

-define(TABLE, "PLAYERS").
-define(KEY, "id").
-define(FIELDS, ["id, name, surname,  birth_day, age, country, personality, form, experience, month_salary, goalKeeper, defense, cross, midField, forward, technique, unpredictable, technic, quick, powerful, playmaking, head, goalSense, freeKicks, dribbling, assist"]).

%% Used to manage players definitions

run() ->
	players:print(10).

get(Key) ->
	Query = "call SP_PLAYERS_GETBYID(?, null)",
	[begin io:format("query: ~p~n", [Query]) end],
	Result = db:get(Query, [Key]),
	{Cols, _} = Result,
	[begin io:format("~n~n~nColumns: ~p~n~n~n~n", [Cols]) end],
	[begin io:format("Result: ~p~n~n~n~n~n~n~n~n", [Result]) end].
	%Items = emysql:as_record(Result, player, record_info(fields, player)),
	%Items.

print(Key) ->
	Items = players:get(Key),
	[begin
		io:format("player: ~p, ~p ~p~n   Age: ~p~n   Country: ~p~n", [Item#player.id, Item#player.surname, Item#player.name, Item#player.age, Item#player.country])
	end || Item <- Items],
	ok.