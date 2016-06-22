
DROP PROCEDURE IF EXISTS `matterhorn`.`SP_PLAYERS_GETBYMATCHANDTEAMID`;

DELIMITER $$;

CREATE PROCEDURE `matterhorn`.`SP_PLAYERS_GETBYMATCHANDTEAMID` (
	season_id BIGINT,
	match_id BIGINT,
    team_id BIGINT,
    ref_time TINYINT,
	d_riferimento DATETIME
)
BEGIN


	DECLARE 	season_length INT;
	DECLARE 	current_day INT;

	SET season_length = (18 * 7);
	SET current_day = 1;
    SET d_riferimento = COALESCE(d_riferimento, now());

	SELECT	MF.team_id,
			MF.position,
			P.id, 
			P.name, 
			P.surname,
			P.birth_day,
            concat(abs(round(P.birth_day / 126)),":",abs(P.birth_day % 126)) as age,
			P.country, 
			P.personality, 
			P.form, 
			P.experience, 
			P.month_salary,
			COALESCE(SKGK.value, 0) as 'goalKeeper',
			COALESCE(SKDE.value, 0) as 'defense',
			COALESCE(SKCR.value, 0) as 'cross',
			COALESCE(SKMF.value, 0) as 'midField',
			COALESCE(SKFW.value, 0) as 'forward',
			COALESCE(SKTK.value, 0) as 'technique',
			COALESCE(SPUNP.value, 0) as 'unpredictable',
			COALESCE(SPTECH.value, 0) as 'technic',
			COALESCE(SPQUICK.value, 0) as 'quick',
			COALESCE(SPPWR.value, 0) as 'powerful',
			COALESCE(SPPLMK.value, 0) as 'playmaking',
			COALESCE(SPHEAD.value, 0) as 'head',
			COALESCE(SPGLSNS.value, 0) as 'goalSense',
			COALESCE(SPFRKX.value, 0) as 'freeKicks',
			COALESCE(SPDRIB.value, 0) as 'dribbling',
			COALESCE(SPASST.value, 0) as 'assist'
	FROM	MATCHES_FORMATIONS MF			LEFT JOIN
			MATCHES_FORMATIONS MF2			on 	MF.team_id = MF2.team_id
												AND MF.match_id = MF2.match_id
												AND MF.position = MF2.position
												AND MF.match_time < MF2.match_time
												AND MF2.match_time <= ref_time 									LEFT JOIN
			TEAMS_PLAYERS TP				on	TP.team_id = MF.team_id 
												AND TP.player_id = MF.player_id 
                                                AND d_riferimento BETWEEN TP.dataInizio AND TP.dataFine 		INNER JOIN
            PLAYERS P 						on 	P.id = MF.player_id 											LEFT JOIN
			PLAYERS_SKILLS SKGK				on SKGK.player_id = P.id 		AND SKGK.skill_id = 'GK' 			LEFT JOIN
			PLAYERS_SKILLS SKDE 			on SKDE.player_id = P.id 		AND SKDE.skill_id = 'DE' 			LEFT JOIN
			PLAYERS_SKILLS SKCR 			on SKCR.player_id = P.id 		AND SKCR.skill_id = 'CR' 			LEFT JOIN
			PLAYERS_SKILLS SKMF 			on SKMF.player_id = P.id 		AND SKMF.skill_id = 'MF' 			LEFT JOIN
			PLAYERS_SKILLS SKFW 			on SKFW.player_id = P.id 		AND SKFW.skill_id = 'FW' 			LEFT JOIN
			PLAYERS_SKILLS SKTK 			on SKTK.player_id = P.id 		AND SKTK.skill_id = 'TK' 			LEFT JOIN
			PLAYERS_SPECIALTIES SPUNP		on SPUNP.player_id = P.id 		AND SPUNP.specialty_id = 'UNP' 		LEFT JOIN
			PLAYERS_SPECIALTIES SPTECH		on SPTECH.player_id = P.id 		AND SPTECH.specialty_id = 'TECH' 	LEFT JOIN
			PLAYERS_SPECIALTIES SPQUICK		on SPQUICK.player_id = P.id 	AND SPQUICK.specialty_id = 'QUICK' 	LEFT JOIN
			PLAYERS_SPECIALTIES SPPWR		on SPPWR.player_id = P.id 		AND SPPWR.specialty_id = 'PWR' 		LEFT JOIN
			PLAYERS_SPECIALTIES SPPLMK		on SPPLMK.player_id = P.id 		AND SPPLMK.specialty_id = 'PLMK' 	LEFT JOIN
			PLAYERS_SPECIALTIES SPHEAD		on SPHEAD.player_id = P.id 		AND SPHEAD.specialty_id = 'HEAD' 	LEFT JOIN
			PLAYERS_SPECIALTIES SPGLSNS		on SPGLSNS.player_id = P.id 	AND SPGLSNS.specialty_id = 'GLSNS' 	LEFT JOIN
			PLAYERS_SPECIALTIES SPFRKX		on SPFRKX.player_id = P.id 		AND SPFRKX.specialty_id = 'FRKX' 	LEFT JOIN
			PLAYERS_SPECIALTIES SPDRIB		on SPDRIB.player_id = P.id 		AND SPDRIB.specialty_id = 'DRIB' 	LEFT JOIN
			PLAYERS_SPECIALTIES SPASST		on SPASST.player_id = P.id 		AND SPASST.specialty_id = 'ASST'
	WHERE	MF.team_id = team_id
	AND 	MF.match_time <= ref_time
    AND		MF.match_id = match_id
    AND		MF2.player_id is null
    ORDER BY MF.position ASC;
   
END