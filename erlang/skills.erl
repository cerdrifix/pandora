-module(skills).
-export([getAll/0]).
-record(skill, {id, description}).

getAll() ->

	application:start(sasl),
	crypto:start(),
	application:start(emysql),
	emysql:add_pool(mth_pool, [
		{ size,		1 },
		{ user,		"root" },
		{ password,	"bill2kill" },
		{ host, 	"localhost" },
		{ port, 	3306 },
		{ database,	"matterhorn" },
		{ encoding,	utf8 }
	]),
	Record = emysql:execute(mth_pool, <<"SELECT id, description FROM SKILLS">>),
	Skills = emysql:as_record(Result, skill, record_info(fields, skill)),
	[begin
		io:format("skill: ~p, ~p~n", [Skill#skill.id, Skill#skill.description])
	end || Skill <- Skills].

	%% ------------------------------------------------------------------- 

	io:format("~n~s~n", [string:chars($-,72)]),
	io:format("Rows: ~p~n", [rows]),

    ok.