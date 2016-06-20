
DROP PROCEDURE IF EXISTS `matterhorn`.`SP_PLAYERS_GETBYID`;

DELIMITER $$;

CREATE PROCEDURE `matterhorn`.`SP_PLAYERS_GETBYID` (
	id BIGINT,
   d_riferimento DATETIME
)
BEGIN

	DECLARE 	season_length INT;
	DECLARE 	current_day INT;

	SET season_length = (18 * 7);
   SET current_day = 1;

	SELECT	P.id, 
				P.name, 
				P.surname,
				P.birth_day,
            concat(abs(round(P.birth_day / 126)),":",abs(P.birth_day % 126)) as age,
				P.country, 
				P.personality, 
				P.form, 
				P.experience, 
				P.month_salary,
				SKGK.value as 'goalKeeper',
				SKDE.value as 'defense',
				SKCR.value as 'cross',
				SKMF.value as 'midField',
				SKFW.value as 'forward',
				SKTK.value as 'technique',
				SPUNP.value as 'unpredictable',
				SPTECH.value as 'technic',
				SPQUICK.value as 'quick',
				SPPWR.value as 'powerful',
				SPPLMK.value as 'playmaking',
				SPHEAD.value as 'head',
				SPGLSNS.value as 'goalSense',
				SPFRKX.value as 'freeKicks',
				SPDRIB.value as 'dribbling',
				SPASST.value as 'assist'
	FROM		PLAYERS P 																																											LEFT JOIN
				PLAYERS_SKILLS SKGK 					on SKGK.player_id = P.id 			AND SKGK.skill_id = 'GK' 				LEFT JOIN
				PLAYERS_SKILLS SKDE 					on SKDE.player_id = P.id 			AND SKDE.skill_id = 'DE' 				LEFT JOIN
				PLAYERS_SKILLS SKCR 					on SKCR.player_id = P.id 			AND SKCR.skill_id = 'CR' 				LEFT JOIN
				PLAYERS_SKILLS SKMF 					on SKMF.player_id = P.id 			AND SKMF.skill_id = 'MF' 				LEFT JOIN
				PLAYERS_SKILLS SKFW 					on SKFW.player_id = P.id 			AND SKFW.skill_id = 'FW' 				LEFT JOIN
				PLAYERS_SKILLS SKTK 					on SKTK.player_id = P.id 			AND SKTK.skill_id = 'TK' 				LEFT JOIN
				PLAYERS_SPECIALTIES SPUNP			on SPUNP.player_id = P.id 			AND SPUNP.specialty_id = 'UNP' 		LEFT JOIN
				PLAYERS_SPECIALTIES SPTECH			on SPTECH.player_id = P.id 		AND SPTECH.specialty_id = 'TECH' 	LEFT JOIN
				PLAYERS_SPECIALTIES SPQUICK		on SPQUICK.player_id = P.id 		AND SPQUICK.specialty_id = 'QUICK' 	LEFT JOIN
				PLAYERS_SPECIALTIES SPPWR			on SPPWR.player_id = P.id 			AND SPPWR.specialty_id = 'PWR' 		LEFT JOIN
				PLAYERS_SPECIALTIES SPPLMK			on SPPLMK.player_id = P.id 		AND SPPLMK.specialty_id = 'PLMK' 	LEFT JOIN
				PLAYERS_SPECIALTIES SPHEAD			on SPHEAD.player_id = P.id 		AND SPHEAD.specialty_id = 'HEAD' 	LEFT JOIN
				PLAYERS_SPECIALTIES SPGLSNS		on SPGLSNS.player_id = P.id 		AND SPGLSNS.specialty_id = 'GLSNS' 	LEFT JOIN
				PLAYERS_SPECIALTIES SPFRKX			on SPFRKX.player_id = P.id 		AND SPFRKX.specialty_id = 'FRKX' 	LEFT JOIN
				PLAYERS_SPECIALTIES SPDRIB			on SPDRIB.player_id = P.id 		AND SPDRIB.specialty_id = 'DRIB' 	LEFT JOIN
				PLAYERS_SPECIALTIES SPASST			on SPASST.player_id = P.id 		AND SPASST.specialty_id = 'ASST'
	WHERE		P.id = id;
   
END