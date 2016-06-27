-module(teams).
-export([run/0, get/1, getPlayers/1, print/1]).

-include("include/records.hrl").

%% Used to manage teams definitions

run() ->
	teams:getPlayers(1).

get(Key) ->
	Query = "call SP_TEAMS_GETBYID(?, null)",
	Result = db:get(Query, [Key]),
	Fields = record_info(fields, team),
	utils:as_record(Result, team, Fields).

getPlayers(Id) ->
	players:getByTeam(Id).


print(Key) ->
	Items = teams:get(Key),
	[begin
		io:format("Team: ~p~n~n", [Item])
	end || Item <- Items],
	ok.