-module(matches).
-export([run/0, get/1, start/1, calculateMidField/2, print/1, toString/1]).
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
	io:format("~n~nHome team players~n",[]),
	matches:calculateMidField(Match#match.homeTeamFormation, HomePlayers),
	% [begin
	% 	players:toString(Player)
	% end || Player <- HomePlayers],
	% AwayPlayers = players:getByMatchAndTeam(Match#match.seasonId, Match#match.id, Match#match.awayTeamId, 0),
	% io:format("~n~nAway team players~n",[]),
	% [begin
	% 	players:toString(Player)
	% end || Player <- AwayPlayers],
	ok.

calculateMidField(Formation, Players) ->
	MF = 0.00,
	[begin
		Position = Player#player.position,
		Val = data:getPrimarySkill(binary_to_list(Formation), ?MIDFIELD, Position),
		players:toString(Player),
		PMF = Val * Player#player.midField,
		io:format("  Midfield ratio: ~f~n           calc: ~f~n~n", [Val, PMF]),
		MF = MF + PMF
	end || Player <- Players],
	io:format("~n~nMidfield calculation: ~p~n~n", [MF]).

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