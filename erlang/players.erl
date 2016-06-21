-module(players).
-export([run/0, get/1, getByTeam/1, print/1, toString/1]).
-include("include/records.hrl").

%% Used to manage players definitions

run() ->
	players:getByTeam(1).

get(Key) ->
	Query = "call SP_PLAYERS_GETBYID(?, null)",
	Result = db:get(Query, [Key]),
	Fields = record_info(fields, player),
	utils:as_record(Result, player, Fields).

getByTeam(TeamId) ->
	Query = "call SP_PLAYERS_GETBYTEAMID(?, null)",
	Result = db:get(Query, [TeamId]),
	Fields = record_info(fields, player),
	Players = utils:as_record(Result, player, Fields),
	[begin
		players:toString(Player)
	end || Player <- Players],
	Players.

print(Key) ->
	Items = players:get(Key),
	[begin
		players:toString(Item)
	end || Item <- Items],
	ok.

toString(Player) ->
	Age = string:tokens(bitstring_to_list(Player#player.age), ":"),
	Years = lists:nth(1, Age),
	Days = lists:nth(2, Age),
	io:format("Player: ~s ~s (~s years and ~s days)~n  country: ~s~n  goalKeeper: ~f~n  defense: ~f~n  cross: ~f~n  midField: ~f~n  forward: ~f~n  technique: ~f~n~n", [Player#player.name, Player#player.surname, Years, Days, Player#player.country, Player#player.goalKeeper, Player#player.defense, Player#player.cross, Player#player.midField, Player#player.forward, Player#player.technique ]).