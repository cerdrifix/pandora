-module(matches).
-export([run/0, get/1, start/1, print/1, toString/1]).
-include("include/records.hrl").

run() ->
	start(1).

get(MatchId) ->
	Query = "call SP_MATCHES_GETBYID(?, null)",
	Result = db:get(Query, [MatchId]),
	Fields = record_info(fields, match),
	[Match | _] = utils:as_record(Result, match, Fields),
	Match.
	

start(MatchId) ->
	Match = matches:get(MatchId),
	matches:toString(Match),
	HomePlayers = players:getByMatchAndTeam(Match#match.seasonId, Match#match.id, Match#match.homeTeamId, 0),
	io:format("~n~nHome team players~n",[]),
	[begin
		players:toString(Player)
	end || Player <- HomePlayers],
	PlayersAway = players:getByMatchAndTeam(Match#match.seasonId, Match#match.id, Match#match.awayTeamId, 0),
	io:format("~n~nAway team players~n",[]),
	[begin
		players:toString(Player)
	end || Player <- PlayersAway],
	ok.


print(MatchId) ->
	Match = matches:get(MatchId),
	matches:toString(Match).

toString(Match = #match{}) ->
	io:format("~nDate: ~s~nCountry: ~s~nLeague: ~b~nSeason: ~b~nWeek: ~b~nMatch ~s (~s) vs. ~s (~s)~n", [
		[begin
			{_, DueDate} =  Match#match.dueDate,
			utils:date_format(DueDate)
		end],
		Match#match.country,
		Match#match.leagueId,
		Match#match.seasonId,
		Match#match.week,
		Match#match.homeTeamDescription,
		Match#match.homeTeamFormation,
		Match#match.awayTeamDescription,
		Match#match.awayTeamFormation
	]).