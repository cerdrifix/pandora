-module(data).
-export([init/0, init_PSW/0, read/0, traverse_table_and_show/1, start/0, stop/0, getPrimarySkill/3]).

-include_lib("stdlib/include/qlc.hrl").
-include("include/data.hrl").

init() ->
	mnesia:create_schema([lx@cerdriNet]),
	data:start(),
	mnesia:create_table(primarySkillWeight, [
		{ attributes, record_info(fields, primarySkillWeight) },
		%{ disc_copies, [node()] },
		%{ ram_copies, [node()] },
		{ storage_properties, [
			{ dets, [ { auto_save, 5000 } ] }
			]},
		{ index, [#primarySkillWeight.formation, #primarySkillWeight.sector, #primarySkillWeight.position] }
	]).

init_PSW() ->
	PSW_Data = [
		#primarySkillWeight{ id=1, formation="352", sector=?LEFT_DEFENSE, position=1, value=0.00 },
		#primarySkillWeight{ id=2, formation="352", sector=?LEFT_DEFENSE, position=2, value=0.00 },
		#primarySkillWeight{ id=3, formation="352", sector=?LEFT_DEFENSE, position=3, value=0.30 },
		#primarySkillWeight{ id=4, formation="352", sector=?LEFT_DEFENSE, position=4, value=0.40 },
		#primarySkillWeight{ id=5, formation="352", sector=?LEFT_DEFENSE, position=5, value=0.10 },
		#primarySkillWeight{ id=6, formation="352", sector=?LEFT_DEFENSE, position=6, value=0.00 },
		#primarySkillWeight{ id=7, formation="352", sector=?LEFT_DEFENSE, position=7, value=0.50 },
		#primarySkillWeight{ id=8, formation="352", sector=?LEFT_DEFENSE, position=8, value=0.30 },
		#primarySkillWeight{ id=9, formation="352", sector=?LEFT_DEFENSE, position=9, value=0.00 },
		#primarySkillWeight{ id=10, formation="352", sector=?LEFT_DEFENSE, position=10, value=0.00 },
		#primarySkillWeight{ id=11, formation="352", sector=?LEFT_DEFENSE, position=11, value=0.00 },
		#primarySkillWeight{ id=12, formation="352", sector=?LEFT_DEFENSE, position=12, value=0.00 },
		#primarySkillWeight{ id=13, formation="352", sector=?LEFT_DEFENSE, position=13, value=0.00 },
		#primarySkillWeight{ id=14, formation="352", sector=?LEFT_DEFENSE, position=14, value=0.00 },
		#primarySkillWeight{ id=15, formation="352", sector=?LEFT_DEFENSE, position=15, value=0.00 },
		#primarySkillWeight{ id=16, formation="352", sector=?CENTRAL_DEFENSE, position=1, value=0.00 },
		#primarySkillWeight{ id=17, formation="352", sector=?CENTRAL_DEFENSE, position=2, value=0.00 },
		#primarySkillWeight{ id=18, formation="352", sector=?CENTRAL_DEFENSE, position=3, value=1.00 },
		#primarySkillWeight{ id=19, formation="352", sector=?CENTRAL_DEFENSE, position=4, value=1.00 },
		#primarySkillWeight{ id=20, formation="352", sector=?CENTRAL_DEFENSE, position=5, value=1.00 },
		#primarySkillWeight{ id=21, formation="352", sector=?CENTRAL_DEFENSE, position=6, value=0.00 },
		#primarySkillWeight{ id=22, formation="352", sector=?CENTRAL_DEFENSE, position=7, value=0.00 },
		#primarySkillWeight{ id=23, formation="352", sector=?CENTRAL_DEFENSE, position=8, value=0.30 },
		#primarySkillWeight{ id=24, formation="352", sector=?CENTRAL_DEFENSE, position=9, value=0.30 },
		#primarySkillWeight{ id=25, formation="352", sector=?CENTRAL_DEFENSE, position=10, value=0.30 },
		#primarySkillWeight{ id=26, formation="352", sector=?CENTRAL_DEFENSE, position=11, value=0.00 },
		#primarySkillWeight{ id=27, formation="352", sector=?CENTRAL_DEFENSE, position=12, value=0.00 },
		#primarySkillWeight{ id=28, formation="352", sector=?CENTRAL_DEFENSE, position=13, value=0.00 },
		#primarySkillWeight{ id=29, formation="352", sector=?CENTRAL_DEFENSE, position=14, value=0.00 },
		#primarySkillWeight{ id=30, formation="352", sector=?CENTRAL_DEFENSE, position=15, value=0.00 },
		#primarySkillWeight{ id=31, formation="352", sector=?RIGHT_DEFENSE, position=1, value=0.00 },
		#primarySkillWeight{ id=32, formation="352", sector=?RIGHT_DEFENSE, position=2, value=0.00 },
		#primarySkillWeight{ id=33, formation="352", sector=?RIGHT_DEFENSE, position=3, value=0.40 },
		#primarySkillWeight{ id=34, formation="352", sector=?RIGHT_DEFENSE, position=4, value=0.30 },
		#primarySkillWeight{ id=35, formation="352", sector=?RIGHT_DEFENSE, position=5, value=0.10 },
		#primarySkillWeight{ id=36, formation="352", sector=?RIGHT_DEFENSE, position=6, value=0.00 },
		#primarySkillWeight{ id=37, formation="352", sector=?RIGHT_DEFENSE, position=7, value=0.50 },
		#primarySkillWeight{ id=38, formation="352", sector=?RIGHT_DEFENSE, position=8, value=0.30 },
		#primarySkillWeight{ id=39, formation="352", sector=?RIGHT_DEFENSE, position=9, value=0.00 },
		#primarySkillWeight{ id=40, formation="352", sector=?RIGHT_DEFENSE, position=10, value=0.00 },
		#primarySkillWeight{ id=41, formation="352", sector=?RIGHT_DEFENSE, position=11, value=0.00 },
		#primarySkillWeight{ id=42, formation="352", sector=?RIGHT_DEFENSE, position=12, value=0.00 },
		#primarySkillWeight{ id=43, formation="352", sector=?RIGHT_DEFENSE, position=13, value=0.00 },
		#primarySkillWeight{ id=44, formation="352", sector=?RIGHT_DEFENSE, position=14, value=0.00 },
		#primarySkillWeight{ id=45, formation="352", sector=?RIGHT_DEFENSE, position=15, value=0.00 },
		#primarySkillWeight{ id=46, formation="352", sector=?MIDFIELD, position=1, value=0.00 },
		#primarySkillWeight{ id=47, formation="352", sector=?MIDFIELD, position=2, value=0.00 },
		#primarySkillWeight{ id=48, formation="352", sector=?MIDFIELD, position=3, value=0.00 },
		#primarySkillWeight{ id=49, formation="352", sector=?MIDFIELD, position=4, value=0.10 },
		#primarySkillWeight{ id=50, formation="352", sector=?MIDFIELD, position=5, value=0.00 },
		#primarySkillWeight{ id=51, formation="352", sector=?MIDFIELD, position=6, value=0.00 },
		#primarySkillWeight{ id=52, formation="352", sector=?MIDFIELD, position=7, value=0.20 },
		#primarySkillWeight{ id=53, formation="352", sector=?MIDFIELD, position=8, value=1.00 },
		#primarySkillWeight{ id=54, formation="352", sector=?MIDFIELD, position=9, value=1.00 },
		#primarySkillWeight{ id=55, formation="352", sector=?MIDFIELD, position=10, value=1.00 },
		#primarySkillWeight{ id=56, formation="352", sector=?MIDFIELD, position=11, value=0.20 },
		#primarySkillWeight{ id=57, formation="352", sector=?MIDFIELD, position=12, value=0.00 },
		#primarySkillWeight{ id=58, formation="352", sector=?MIDFIELD, position=13, value=0.00 },
		#primarySkillWeight{ id=59, formation="352", sector=?MIDFIELD, position=14, value=0.00 },
		#primarySkillWeight{ id=60, formation="352", sector=?MIDFIELD, position=15, value=0.00 },
		#primarySkillWeight{ id=61, formation="352", sector=?LEFT_FORWARD, position=1, value=0.00 },
		#primarySkillWeight{ id=62, formation="352", sector=?LEFT_FORWARD, position=2, value=0.00 },
		#primarySkillWeight{ id=63, formation="352", sector=?LEFT_FORWARD, position=3, value=0.00 },
		#primarySkillWeight{ id=64, formation="352", sector=?LEFT_FORWARD, position=4, value=0.00 },
		#primarySkillWeight{ id=65, formation="352", sector=?LEFT_FORWARD, position=5, value=0.00 },
		#primarySkillWeight{ id=66, formation="352", sector=?LEFT_FORWARD, position=6, value=0.00 },
		#primarySkillWeight{ id=67, formation="352", sector=?LEFT_FORWARD, position=7, value=0.00 },
		#primarySkillWeight{ id=68, formation="352", sector=?LEFT_FORWARD, position=8, value=0.00 },
		#primarySkillWeight{ id=69, formation="352", sector=?LEFT_FORWARD, position=9, value=0.00 },
		#primarySkillWeight{ id=70, formation="352", sector=?LEFT_FORWARD, position=10, value=0.00 },
		#primarySkillWeight{ id=71, formation="352", sector=?LEFT_FORWARD, position=11, value=0.90 },
		#primarySkillWeight{ id=72, formation="352", sector=?LEFT_FORWARD, position=12, value=0.00 },
		#primarySkillWeight{ id=73, formation="352", sector=?LEFT_FORWARD, position=13, value=0.00 },
		#primarySkillWeight{ id=74, formation="352", sector=?LEFT_FORWARD, position=14, value=0.00 },
		#primarySkillWeight{ id=75, formation="352", sector=?LEFT_FORWARD, position=15, value=0.50 },
		#primarySkillWeight{ id=76, formation="352", sector=?CENTRAL_FORWARD, position=1, value=0.00 },
		#primarySkillWeight{ id=77, formation="352", sector=?CENTRAL_FORWARD, position=2, value=0.00 },
		#primarySkillWeight{ id=78, formation="352", sector=?CENTRAL_FORWARD, position=3, value=0.00 },
		#primarySkillWeight{ id=79, formation="352", sector=?CENTRAL_FORWARD, position=4, value=0.00 },
		#primarySkillWeight{ id=80, formation="352", sector=?CENTRAL_FORWARD, position=5, value=0.00 },
		#primarySkillWeight{ id=81, formation="352", sector=?CENTRAL_FORWARD, position=6, value=0.00 },
		#primarySkillWeight{ id=82, formation="352", sector=?CENTRAL_FORWARD, position=7, value=0.00 },
		#primarySkillWeight{ id=83, formation="352", sector=?CENTRAL_FORWARD, position=8, value=0.20 },
		#primarySkillWeight{ id=84, formation="352", sector=?CENTRAL_FORWARD, position=9, value=0.20 },
		#primarySkillWeight{ id=85, formation="352", sector=?CENTRAL_FORWARD, position=10, value=0.20 },
		#primarySkillWeight{ id=86, formation="352", sector=?CENTRAL_FORWARD, position=11, value=0.00 },
		#primarySkillWeight{ id=87, formation="352", sector=?CENTRAL_FORWARD, position=12, value=0.00 },
		#primarySkillWeight{ id=88, formation="352", sector=?CENTRAL_FORWARD, position=13, value=1.00 },
		#primarySkillWeight{ id=89, formation="352", sector=?CENTRAL_FORWARD, position=14, value=0.00 },
		#primarySkillWeight{ id=90, formation="352", sector=?CENTRAL_FORWARD, position=15, value=1.00 },
		#primarySkillWeight{ id=91, formation="352", sector=?RIGHT_FORWARD, position=1, value=0.00 },
		#primarySkillWeight{ id=92, formation="352", sector=?RIGHT_FORWARD, position=2, value=0.00 },
		#primarySkillWeight{ id=93, formation="352", sector=?RIGHT_FORWARD, position=3, value=0.00 },
		#primarySkillWeight{ id=94, formation="352", sector=?RIGHT_FORWARD, position=4, value=0.00 },
		#primarySkillWeight{ id=95, formation="352", sector=?RIGHT_FORWARD, position=5, value=0.00 },
		#primarySkillWeight{ id=96, formation="352", sector=?RIGHT_FORWARD, position=6, value=0.00 },
		#primarySkillWeight{ id=97, formation="352", sector=?RIGHT_FORWARD, position=7, value=0.90 },
		#primarySkillWeight{ id=98, formation="352", sector=?RIGHT_FORWARD, position=8, value=0.00 },
		#primarySkillWeight{ id=99, formation="352", sector=?RIGHT_FORWARD, position=9, value=0.00 },
		#primarySkillWeight{ id=100, formation="352", sector=?RIGHT_FORWARD, position=10, value=0.00 },
		#primarySkillWeight{ id=101, formation="352", sector=?RIGHT_FORWARD, position=11, value=0.00 },
		#primarySkillWeight{ id=102, formation="352", sector=?RIGHT_FORWARD, position=12, value=0.00 },
		#primarySkillWeight{ id=103, formation="352", sector=?RIGHT_FORWARD, position=13, value=0.50 },
		#primarySkillWeight{ id=104, formation="352", sector=?RIGHT_FORWARD, position=14, value=0.00 },
		#primarySkillWeight{ id=105, formation="352", sector=?RIGHT_FORWARD, position=15, value=0.00 },
		#primarySkillWeight{ id=106, formation="442", sector=?LEFT_DEFENSE, position=1, value=0.00 },
		#primarySkillWeight{ id=107, formation="442", sector=?LEFT_DEFENSE, position=2, value=0.00 },
		#primarySkillWeight{ id=108, formation="442", sector=?LEFT_DEFENSE, position=3, value=0.00 },
		#primarySkillWeight{ id=109, formation="442", sector=?LEFT_DEFENSE, position=4, value=0.00 },
		#primarySkillWeight{ id=110, formation="442", sector=?LEFT_DEFENSE, position=5, value=0.20 },
		#primarySkillWeight{ id=111, formation="442", sector=?LEFT_DEFENSE, position=6, value=1.00 },
		#primarySkillWeight{ id=112, formation="442", sector=?LEFT_DEFENSE, position=7, value=0.00 },
		#primarySkillWeight{ id=113, formation="442", sector=?LEFT_DEFENSE, position=8, value=0.00 },
		#primarySkillWeight{ id=114, formation="442", sector=?LEFT_DEFENSE, position=9, value=0.00 },
		#primarySkillWeight{ id=115, formation="442", sector=?LEFT_DEFENSE, position=10, value=0.00 },
		#primarySkillWeight{ id=116, formation="442", sector=?LEFT_DEFENSE, position=11, value=0.50 },
		#primarySkillWeight{ id=117, formation="442", sector=?LEFT_DEFENSE, position=12, value=0.00 },
		#primarySkillWeight{ id=118, formation="442", sector=?LEFT_DEFENSE, position=13, value=0.00 },
		#primarySkillWeight{ id=119, formation="442", sector=?LEFT_DEFENSE, position=14, value=0.00 },
		#primarySkillWeight{ id=120, formation="442", sector=?LEFT_DEFENSE, position=15, value=0.00 },
		#primarySkillWeight{ id=121, formation="442", sector=?CENTRAL_DEFENSE, position=1, value=0.00 },
		#primarySkillWeight{ id=122, formation="442", sector=?CENTRAL_DEFENSE, position=2, value=0.50 },
		#primarySkillWeight{ id=123, formation="442", sector=?CENTRAL_DEFENSE, position=3, value=1.00 },
		#primarySkillWeight{ id=124, formation="442", sector=?CENTRAL_DEFENSE, position=4, value=0.00 },
		#primarySkillWeight{ id=125, formation="442", sector=?CENTRAL_DEFENSE, position=5, value=1.00 },
		#primarySkillWeight{ id=126, formation="442", sector=?CENTRAL_DEFENSE, position=6, value=0.50 },
		#primarySkillWeight{ id=127, formation="442", sector=?CENTRAL_DEFENSE, position=7, value=0.00 },
		#primarySkillWeight{ id=128, formation="442", sector=?CENTRAL_DEFENSE, position=8, value=0.10 },
		#primarySkillWeight{ id=129, formation="442", sector=?CENTRAL_DEFENSE, position=9, value=0.00 },
		#primarySkillWeight{ id=130, formation="442", sector=?CENTRAL_DEFENSE, position=10, value=0.10 },
		#primarySkillWeight{ id=131, formation="442", sector=?CENTRAL_DEFENSE, position=11, value=0.00 },
		#primarySkillWeight{ id=132, formation="442", sector=?CENTRAL_DEFENSE, position=12, value=0.00 },
		#primarySkillWeight{ id=133, formation="442", sector=?CENTRAL_DEFENSE, position=13, value=0.00 },
		#primarySkillWeight{ id=134, formation="442", sector=?CENTRAL_DEFENSE, position=14, value=0.00 },
		#primarySkillWeight{ id=135, formation="442", sector=?CENTRAL_DEFENSE, position=15, value=0.00 },
		#primarySkillWeight{ id=136, formation="442", sector=?RIGHT_DEFENSE, position=1, value=0.00 },
		#primarySkillWeight{ id=137, formation="442", sector=?RIGHT_DEFENSE, position=2, value=1.00 },
		#primarySkillWeight{ id=138, formation="442", sector=?RIGHT_DEFENSE, position=3, value=0.20 },
		#primarySkillWeight{ id=139, formation="442", sector=?RIGHT_DEFENSE, position=4, value=0.00 },
		#primarySkillWeight{ id=140, formation="442", sector=?RIGHT_DEFENSE, position=5, value=0.00 },
		#primarySkillWeight{ id=141, formation="442", sector=?RIGHT_DEFENSE, position=6, value=0.00 },
		#primarySkillWeight{ id=142, formation="442", sector=?RIGHT_DEFENSE, position=7, value=0.50 },
		#primarySkillWeight{ id=143, formation="442", sector=?RIGHT_DEFENSE, position=8, value=0.00 },
		#primarySkillWeight{ id=144, formation="442", sector=?RIGHT_DEFENSE, position=9, value=0.00 },
		#primarySkillWeight{ id=145, formation="442", sector=?RIGHT_DEFENSE, position=10, value=0.00 },
		#primarySkillWeight{ id=146, formation="442", sector=?RIGHT_DEFENSE, position=11, value=0.00 },
		#primarySkillWeight{ id=147, formation="442", sector=?RIGHT_DEFENSE, position=12, value=0.00 },
		#primarySkillWeight{ id=148, formation="442", sector=?RIGHT_DEFENSE, position=13, value=0.00 },
		#primarySkillWeight{ id=149, formation="442", sector=?RIGHT_DEFENSE, position=14, value=0.00 },
		#primarySkillWeight{ id=150, formation="442", sector=?RIGHT_DEFENSE, position=15, value=0.00 },
		#primarySkillWeight{ id=151, formation="442", sector=?MIDFIELD, position=1, value=0.00 },
		#primarySkillWeight{ id=152, formation="442", sector=?MIDFIELD, position=2, value=0.10 },
		#primarySkillWeight{ id=153, formation="442", sector=?MIDFIELD, position=3, value=0.20 },
		#primarySkillWeight{ id=154, formation="442", sector=?MIDFIELD, position=4, value=0.00 },
		#primarySkillWeight{ id=155, formation="442", sector=?MIDFIELD, position=5, value=0.20 },
		#primarySkillWeight{ id=156, formation="442", sector=?MIDFIELD, position=6, value=0.10 },
		#primarySkillWeight{ id=157, formation="442", sector=?MIDFIELD, position=7, value=0.70 },
		#primarySkillWeight{ id=158, formation="442", sector=?MIDFIELD, position=8, value=1.00 },
		#primarySkillWeight{ id=159, formation="442", sector=?MIDFIELD, position=9, value=0.00 },
		#primarySkillWeight{ id=160, formation="442", sector=?MIDFIELD, position=10, value=1.00 },
		#primarySkillWeight{ id=161, formation="442", sector=?MIDFIELD, position=11, value=0.70 },
		#primarySkillWeight{ id=162, formation="442", sector=?MIDFIELD, position=12, value=0.00 },
		#primarySkillWeight{ id=163, formation="442", sector=?MIDFIELD, position=13, value=0.00 },
		#primarySkillWeight{ id=164, formation="442", sector=?MIDFIELD, position=14, value=0.00 },
		#primarySkillWeight{ id=165, formation="442", sector=?MIDFIELD, position=15, value=0.00 },
		#primarySkillWeight{ id=166, formation="442", sector=?LEFT_FORWARD, position=1, value=0.00 },
		#primarySkillWeight{ id=167, formation="442", sector=?LEFT_FORWARD, position=2, value=0.00 },
		#primarySkillWeight{ id=168, formation="442", sector=?LEFT_FORWARD, position=3, value=0.00 },
		#primarySkillWeight{ id=169, formation="442", sector=?LEFT_FORWARD, position=4, value=0.00 },
		#primarySkillWeight{ id=170, formation="442", sector=?LEFT_FORWARD, position=5, value=0.00 },
		#primarySkillWeight{ id=171, formation="442", sector=?LEFT_FORWARD, position=6, value=0.40 },
		#primarySkillWeight{ id=172, formation="442", sector=?LEFT_FORWARD, position=7, value=0.00 },
		#primarySkillWeight{ id=173, formation="442", sector=?LEFT_FORWARD, position=8, value=0.00 },
		#primarySkillWeight{ id=174, formation="442", sector=?LEFT_FORWARD, position=9, value=1.00 },
		#primarySkillWeight{ id=175, formation="442", sector=?LEFT_FORWARD, position=10, value=0.00 },
		#primarySkillWeight{ id=176, formation="442", sector=?LEFT_FORWARD, position=11, value=0.00 },
		#primarySkillWeight{ id=177, formation="442", sector=?LEFT_FORWARD, position=12, value=0.00 },
		#primarySkillWeight{ id=178, formation="442", sector=?LEFT_FORWARD, position=13, value=0.00 },
		#primarySkillWeight{ id=179, formation="442", sector=?LEFT_FORWARD, position=14, value=0.00 },
		#primarySkillWeight{ id=180, formation="442", sector=?LEFT_FORWARD, position=15, value=0.50 },
		#primarySkillWeight{ id=181, formation="442", sector=?CENTRAL_FORWARD, position=1, value=0.00 },
		#primarySkillWeight{ id=182, formation="442", sector=?CENTRAL_FORWARD, position=2, value=0.00 },
		#primarySkillWeight{ id=183, formation="442", sector=?CENTRAL_FORWARD, position=3, value=0.00 },
		#primarySkillWeight{ id=184, formation="442", sector=?CENTRAL_FORWARD, position=4, value=0.00 },
		#primarySkillWeight{ id=185, formation="442", sector=?CENTRAL_FORWARD, position=5, value=0.00 },
		#primarySkillWeight{ id=186, formation="442", sector=?CENTRAL_FORWARD, position=6, value=0.00 },
		#primarySkillWeight{ id=187, formation="442", sector=?CENTRAL_FORWARD, position=7, value=0.00 },
		#primarySkillWeight{ id=188, formation="442", sector=?CENTRAL_FORWARD, position=8, value=0.20 },
		#primarySkillWeight{ id=189, formation="442", sector=?CENTRAL_FORWARD, position=9, value=0.00 },
		#primarySkillWeight{ id=190, formation="442", sector=?CENTRAL_FORWARD, position=10, value=0.20 },
		#primarySkillWeight{ id=191, formation="442", sector=?CENTRAL_FORWARD, position=11, value=0.00 },
		#primarySkillWeight{ id=192, formation="442", sector=?CENTRAL_FORWARD, position=12, value=0.00 },
		#primarySkillWeight{ id=193, formation="442", sector=?CENTRAL_FORWARD, position=13, value=1.00 },
		#primarySkillWeight{ id=194, formation="442", sector=?CENTRAL_FORWARD, position=14, value=0.00 },
		#primarySkillWeight{ id=195, formation="442", sector=?CENTRAL_FORWARD, position=15, value=1.00 },
		#primarySkillWeight{ id=196, formation="442", sector=?RIGHT_FORWARD, position=1, value=0.00 },
		#primarySkillWeight{ id=197, formation="442", sector=?RIGHT_FORWARD, position=2, value=0.40 },
		#primarySkillWeight{ id=198, formation="442", sector=?RIGHT_FORWARD, position=3, value=0.00 },
		#primarySkillWeight{ id=199, formation="442", sector=?RIGHT_FORWARD, position=4, value=0.00 },
		#primarySkillWeight{ id=200, formation="442", sector=?RIGHT_FORWARD, position=5, value=0.00 },
		#primarySkillWeight{ id=201, formation="442", sector=?RIGHT_FORWARD, position=6, value=0.00 },
		#primarySkillWeight{ id=202, formation="442", sector=?RIGHT_FORWARD, position=7, value=1.00 },
		#primarySkillWeight{ id=203, formation="442", sector=?RIGHT_FORWARD, position=8, value=0.00 },
		#primarySkillWeight{ id=204, formation="442", sector=?RIGHT_FORWARD, position=9, value=0.00 },
		#primarySkillWeight{ id=205, formation="442", sector=?RIGHT_FORWARD, position=10, value=0.00 },
		#primarySkillWeight{ id=206, formation="442", sector=?RIGHT_FORWARD, position=11, value=0.00 },
		#primarySkillWeight{ id=207, formation="442", sector=?RIGHT_FORWARD, position=12, value=0.50 },
		#primarySkillWeight{ id=208, formation="442", sector=?RIGHT_FORWARD, position=13, value=0.00 },
		#primarySkillWeight{ id=209, formation="442", sector=?RIGHT_FORWARD, position=14, value=0.00 },
		#primarySkillWeight{ id=210, formation="442", sector=?RIGHT_FORWARD, position=15, value=0.00 }
	],
	Fun = fun() ->
			[begin
				mnesia:write(Skill)
			end || Skill <- PSW_Data]
		end,
	mnesia:transaction(Fun).

start() ->
	mnesia:start().

stop() ->
	application:stop(mnesia).


read() ->
	Val = data:getPrimarySkill(<<"352">>, ?RIGHT_FORWARD, 13),
	io:format("~n~nValue: ~f~n~n", [Val]).


getPrimarySkill(Formation, Sector, Position) ->
	%io:format("Retrieving primary skill ~p value for position ~p in formation ~p: ", [Sector, Position, Formation]),
	F = fun() ->
		R = #primarySkillWeight{formation=Formation, sector=Sector, position=Position, value='$1', _='_'},
		[Value] = mnesia:select(primarySkillWeight, [{R, [], ['$1']}]),
		Value
	end,
	{atomic, Val} = mnesia:transaction(F),
	%io:format("~f~n", [Val]),
	Val.





%%%%%% Utils
traverse_table_and_show(Table_name)->
    Iterator =  fun(Rec,_)->
                    io:format("~p~n",[Rec]),
                    []
                end,
    case mnesia:is_transaction() of
        true -> mnesia:foldl(Iterator,[],Table_name);
        false -> 
            Exec = fun({Fun,Tab}) -> mnesia:foldl(Fun, [],Tab) end,
            mnesia:activity(transaction,Exec,[{Iterator,Table_name}],mnesia_frag)
    end.