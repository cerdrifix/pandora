-define(LEFT_DEFENSE, 16#00).
-define(CENTRAL_DEFENSE, 16#01).
-define(RIGHT_DEFENSE, 16#02).
-define(MIDFIELD, 16#03).
-define(LEFT_FORWARD, 16#04).
-define(CENTRAL_FORWARD, 16#05).
-define(RIGHT_FORWARD, 16#06).

-record(primarySkillWeight, {
	id,
	formation,
	sector,
	position,
	value
}).

