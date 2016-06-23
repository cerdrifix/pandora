
DROP PROCEDURE IF EXISTS `matterhorn`.`SP_MATCHES_GETBYCOUNTRY_LEAGUE_SEASON_AND_ID`;

DELIMITER $$;

CREATE PROCEDURE `matterhorn`.`SP_MATCHES_GETBYCOUNTRY_LEAGUE_SEASON_AND_ID` (
	country 		VARCHAR(5),
	league_id 	BIGINT,
	season_id 	BIGINT,
	match_id 	BIGINT
)
BEGIN

	SELECT	due_date as dueDate,
				country,
            league_id,
            season_id,
            week,
            home_team_id as homeTeam,
            away_team_id as awayTeam
	FROM		MATCHES
	WHERE		country = country
	AND		league_id = league_id
   AND		season_id = season_id
   AND		match_id = match_id;
   
END