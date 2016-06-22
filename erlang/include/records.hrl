
% Record definition for a Skill
-record(skill, {id, description}).

% Record definition for a Specialty
-record(speciality, {id, description}).

% Record definition for a Player
-record(player, {
	id, 
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
	assist,
	position
}).

% Record definition for a Team
-record(team, {
	id,
	description,
	owner,
	country,
	active
}).

% Record definition for a Single Match
-record(match, {
	dueDate,
	country,
	leagueId,
	seasonId,
	week,
	homeTeam,
	awayTeam
}).