
DROP PROCEDURE IF EXISTS `matterhorn`.`SP_MATCHES_GETBYID`;

DELIMITER $$;

CREATE PROCEDURE `matterhorn`.`SP_MATCHES_GETBYID` (
	id BIGINT,
	d_riferimento DATETIME
)
BEGIN

	SELECT	M.id,
			M.due_date as 'dueDate',
			M.country,
            M.league_id as leagueId,
            M.season_id as seasonId,
            M.week,
			M.home_team_id as 'homeTeamId',
			TH.description as 'homeTeamDescription',
            concat(UH.surname, " ", UH.name) as 'homeTeamOwner',
            FH.description as 'homeTeamFormation',
			M.away_team_id as 'awayTeamId',
			TA.description as 'awayTeamDescription',
            concat(UA.surname, " ", UA.name) as 'awayTeamOwner',
            FA.description as 'awayTeamFormation'
	FROM	MATCHES M INNER JOIN
			TEAMS TH on TH.id = M.home_team_id INNER JOIN
            FORMATIONS FH on FH.id = M.home_team_formation_id INNER JOIN
            TEAMS TA on TA.id = M.away_team_id INNER JOIN
			FORMATIONS FA on FA.id = M.away_team_formation_id INNER JOIN
			USERS UH on UH.id = TH.owner INNER JOIN
            USERS UA on UA.id = TA.owner
	WHERE	M.id = id;
   
END