-module(matches).
%-export([run/0, get/1, start/1, calculateMidField/3, calculateMidField/3, print/1, toString/1]).
-compile(export_all).
-include("include/records.hrl").
-include("include/data.hrl").

run() ->
	matches:start(1).

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
	AwayPlayers = players:getByMatchAndTeam(Match#match.seasonId, Match#match.id, Match#match.awayTeamId, 0),
	%io:format("~n~nHome team players~n",[]),
	HomeMidfieldValue = matches:calculateMidField(Match#match.homeTeamFormation, HomePlayers),
	io:format("~nHome team midField: ~f~n~n", [HomeMidfieldValue]),
	AwayMidfieldValue = matches:calculateMidField(Match#match.awayTeamFormation, AwayPlayers),
	io:format("~nAway team midField: ~f~n~n", [AwayMidfieldValue]),
	ok.


calculateMidField(Formation, Players) -> calculateMidField(Formation, Players, 0, 0).

calculateMidField(_, [], RatioSum, TotalSum) -> TotalSum/RatioSum;
calculateMidField(Formation, [Player|Players], RatioSum, TotalSum) ->
	Ratio = data:getPrimarySkill(binary_to_list(Formation), ?MIDFIELD, Player#player.position),
	%players:toString(Player),
	PMF = Ratio * Player#player.midField,
	%io:format("  Midfield ratio: ~f~n           calc: ~f~n~n", [Ratio, PMF]),
	calculateMidField(Formation, Players, Ratio + RatioSum, PMF + TotalSum).

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