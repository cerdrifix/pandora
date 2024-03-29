-module(players).
-export([run/0, get/1, getByTeam/1, getByMatchAndTeam/4, print/1, toString/1]).
-include("include/records.hrl").

%% Used to manage players definitions

run() ->
	%players:getByTeam(1).
	players:getByMatchAndTeam(1, 1, 1, 0).

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

getByMatchAndTeam(SeasonId, MatchId, TeamId, MatchMinute) ->
	Query = "call SP_PLAYERS_GETBYMATCHANDTEAMID(?, ?, ?, ?, null)",
	Result = db:get(Query, [SeasonId, MatchId, TeamId, MatchMinute]),
	Fields = record_info(fields, player),
	utils:as_record(Result, player, Fields).

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
	io:format("~nPlayer: ~s ~s (~s years and ~s days)~n  country: ~s~n  goalKeeper: ~f~n  defense: ~f~n  cross: ~f~n  midField: ~f~n  forward: ~f~n  technique: ~f~n  position: ~b~n", [
		Player#player.name, 
		Player#player.surname, 
		Years, 
		Days, 
		Player#player.country, 
		Player#player.goalKeeper, 
		Player#player.defense, 
		Player#player.cross, 
		Player#player.midField, 
		Player#player.forward, 
		Player#player.technique,
		Player#player.position
	]).