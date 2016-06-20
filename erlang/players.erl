-module(players).
-export([get/0, get/1, print/0]).
-include("records.hrl").

%% Used to manage skills definitions

-define(FIELDS, ["id, 
	name, 
	surname,  
	birth_day,
	age, 
	country, 
	personality, 
	form, 
	experience, 
	month_salary,
	goalKeeper,
	defense,
	cross,
	midField,
	forward,
	technique,
	unpredictable,
	technic,
	quick,
	powerful,
	playmaking,
	head,
	goalSense,
	freeKicks,
	dribbling,
	assist"]).

get() ->
	Result = db:get(string.concat("SELECT", string:join(?FIELDS, ", "), " FROM SKILLS")),
	Items = emysql:as_record(Result, skill, record_info(fields, skill)),
	Items.

get(Id) ->
	Result = db:get(<<"SELECT id, description FROM SKILLS WHERE id = ?">>, [Id]),
	Items = emysql:as_record(Result, skill, record_info(fields, skill)),
	Items.

print() ->
	Items = skills:get(),
	[begin
		io:format("skill: ~p, ~p~n", [Item#skill.id, Item#skill.description])
	end || Item <- Items],
	ok.