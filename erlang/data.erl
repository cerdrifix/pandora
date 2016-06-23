-module(data).
-export([init/0, init_PSW/0]).

-include_lib("stdlib/include/qlc.hrl").
-include("include/data.hrl").

init() ->
	data:init_PSW().

init_PSW() ->
	Result = mnesia:create_table(primarySkillWeight, [
		{ attributes, record_info(fields, primarySkillWeight) }
	]),
	PSW_Data = [
		#primarySkillWeight{ formation=352, sector=?LEFT_DEFENSE, position=1, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?LEFT_DEFENSE, position=3, value=0.10 },
		#primarySkillWeight{ formation=352, sector=?LEFT_DEFENSE, position=4, value=0.30 },
		#primarySkillWeight{ formation=352, sector=?LEFT_DEFENSE, position=5, value=0.40 },
		#primarySkillWeight{ formation=352, sector=?LEFT_DEFENSE, position=8, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?LEFT_DEFENSE, position=9, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?LEFT_DEFENSE, position=10, value=0.30 },
		#primarySkillWeight{ formation=352, sector=?LEFT_DEFENSE, position=7, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?LEFT_DEFENSE, position=11, value=0.50 },
		#primarySkillWeight{ formation=352, sector=?LEFT_DEFENSE, position=13, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?LEFT_DEFENSE, position=15, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?CENTRAL_DEFENSE, position=1, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?CENTRAL_DEFENSE, position=3, value=1.00 },
		#primarySkillWeight{ formation=352, sector=?CENTRAL_DEFENSE, position=4, value=1.00 },
		#primarySkillWeight{ formation=352, sector=?CENTRAL_DEFENSE, position=5, value=1.00 },
		#primarySkillWeight{ formation=352, sector=?CENTRAL_DEFENSE, position=8, value=0.30 },
		#primarySkillWeight{ formation=352, sector=?CENTRAL_DEFENSE, position=9, value=0.30 },
		#primarySkillWeight{ formation=352, sector=?CENTRAL_DEFENSE, position=10, value=0.30 },
		#primarySkillWeight{ formation=352, sector=?CENTRAL_DEFENSE, position=7, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?CENTRAL_DEFENSE, position=11, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?CENTRAL_DEFENSE, position=13, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?CENTRAL_DEFENSE, position=15, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?RIGHT_DEFENSE, position=1, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?RIGHT_DEFENSE, position=3, value=0.40 },
		#primarySkillWeight{ formation=352, sector=?RIGHT_DEFENSE, position=4, value=0.30 },
		#primarySkillWeight{ formation=352, sector=?RIGHT_DEFENSE, position=5, value=0.10 },
		#primarySkillWeight{ formation=352, sector=?RIGHT_DEFENSE, position=8, value=0.30 },
		#primarySkillWeight{ formation=352, sector=?RIGHT_DEFENSE, position=9, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?RIGHT_DEFENSE, position=10, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?RIGHT_DEFENSE, position=7, value=0.50 },
		#primarySkillWeight{ formation=352, sector=?RIGHT_DEFENSE, position=11, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?RIGHT_DEFENSE, position=13, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?RIGHT_DEFENSE, position=15, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?MIDFIELD, position=1, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?MIDFIELD, position=3, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?MIDFIELD, position=4, value=0.10 },
		#primarySkillWeight{ formation=352, sector=?MIDFIELD, position=5, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?MIDFIELD, position=8, value=1.00 },
		#primarySkillWeight{ formation=352, sector=?MIDFIELD, position=9, value=1.00 },
		#primarySkillWeight{ formation=352, sector=?MIDFIELD, position=10, value=1.00 },
		#primarySkillWeight{ formation=352, sector=?MIDFIELD, position=7, value=0.20 },
		#primarySkillWeight{ formation=352, sector=?MIDFIELD, position=11, value=0.20 },
		#primarySkillWeight{ formation=352, sector=?MIDFIELD, position=13, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?MIDFIELD, position=15, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?LEFT_FORWARD, position=1, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?LEFT_FORWARD, position=3, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?LEFT_FORWARD, position=4, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?LEFT_FORWARD, position=5, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?LEFT_FORWARD, position=8, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?LEFT_FORWARD, position=9, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?LEFT_FORWARD, position=10, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?LEFT_FORWARD, position=7, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?LEFT_FORWARD, position=11, value=0.90 },
		#primarySkillWeight{ formation=352, sector=?LEFT_FORWARD, position=13, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?LEFT_FORWARD, position=15, value=0.50 },
		#primarySkillWeight{ formation=352, sector=?CENTRAL_FORWARD, position=1, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?CENTRAL_FORWARD, position=3, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?CENTRAL_FORWARD, position=4, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?CENTRAL_FORWARD, position=5, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?CENTRAL_FORWARD, position=8, value=0.20 },
		#primarySkillWeight{ formation=352, sector=?CENTRAL_FORWARD, position=9, value=0.20 },
		#primarySkillWeight{ formation=352, sector=?CENTRAL_FORWARD, position=10, value=0.20 },
		#primarySkillWeight{ formation=352, sector=?CENTRAL_FORWARD, position=7, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?CENTRAL_FORWARD, position=11, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?CENTRAL_FORWARD, position=13, value=1.00 },
		#primarySkillWeight{ formation=352, sector=?CENTRAL_FORWARD, position=15, value=1.00 },
		#primarySkillWeight{ formation=352, sector=?RIGHT_FORWARD, position=1, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?RIGHT_FORWARD, position=3, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?RIGHT_FORWARD, position=4, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?RIGHT_FORWARD, position=5, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?RIGHT_FORWARD, position=8, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?RIGHT_FORWARD, position=9, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?RIGHT_FORWARD, position=10, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?RIGHT_FORWARD, position=7, value=0.90 },
		#primarySkillWeight{ formation=352, sector=?RIGHT_FORWARD, position=11, value=0.00 },
		#primarySkillWeight{ formation=352, sector=?RIGHT_FORWARD, position=13, value=0.50 },
		#primarySkillWeight{ formation=352, sector=?RIGHT_FORWARD, position=15, value=0.00 }
	],
	Fun = fun() ->
			[begin
				mnesia:write(Skill)
			end || Skill <- PSW_Data]
		end,
	mnesia:transaction(Fun).