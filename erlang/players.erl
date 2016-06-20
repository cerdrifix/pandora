-module(players).
-export([run/0, get/1, print/1]).
-include("include/records.hrl").
-include("include/emysql.hrl").

-define(TABLE, "PLAYERS").
-define(KEY, "id").
-define(FIELDS, ["id, name, surname,  birth_day, age, country, personality, form, experience, month_salary, goalKeeper, defense, cross, midField, forward, technique, unpredictable, technic, quick, powerful, playmaking, head, goalSense, freeKicks, dribbling, assist"]).

%% Used to manage players definitions

run() ->
	players:print(10).

get(Key) ->
	Query = "call SP_PLAYERS_GETBYID(?, null)",
	[begin io:format("query: ~p~n", [Query]) end],
	%Result = db:get(Query, [Key]),
	Result = db:get(Query, [Key]),
	%[{_, _, Columns, Rows, _}, _] = Result,
	%[begin io:format("Result: ~p~n~n~n~n~n~n~n~n", [Result]) end],
	%[begin io:format("Columns: ~p~n~n~n~n~n~n~n~n", [Columns]) end],

	%S = lists:seq(1, length(Columns)),
    %P = lists:zip([ binary_to_atom(C1#field.name, utf8) || C1 <- Columns ], S),
	%{_, _, Fields, _, _} = Result
	%[begin io:format("P: ~p~n~n~n~n~n~n~n~n", [P]) end]
	%[begin io:format("~n~n~nColumns: ~p~n~n~n~n", [Fields]) end].
	Items = emysql:as_record(Result, player, record_info(fields, player)),
	Items.

print(Key) ->
	Items = players:get(Key),
	[begin
		%io:format("player: ~p, ~p ~p~n   Age: ~p~n   Country: ~p~n", [Item#player.id, Item#player.surname, Item#player.name, Item#player.age, Item#player.country])
		io:format("player: ~p~n~n~n", [Item])
	end || Item <- Items],
	ok.