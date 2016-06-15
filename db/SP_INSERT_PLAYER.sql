

DROP PROCEDURE IF EXISTS `matterhorn`.`SP_INSERT_PLAYER`;

DELIMITER $$;

CREATE PROCEDURE `matterhorn`.`SP_INSERT_PLAYER`(
	OUT	_id 					BIGINT,
	IN 	_name 				VARCHAR(45),
  IN 	_surname 			VARCHAR(45),
  IN 	_birth_season SMALLINT,
  IN 	_birth_day 		SMALLINT,
  IN 	_country 			VARCHAR(2),
  IN 	_gk_skill 		DECIMAL(5,3),
  IN 	_de_skill 		DECIMAL(5,3),
  IN 	_mf_skill 		DECIMAL(5,3),
  IN 	_cr_skill 		DECIMAL(5,3),
  IN 	_tk_skill 		DECIMAL(5,3),
  IN 	_fw_skill 		DECIMAL(5,3)
)
BEGIN
	
	DECLARE exit handler for sqlexception
		BEGIN
			-- ERROR
		ROLLBACK;
	END;
  
  START TRANSACTION;
  
		INSERT INTO `matterhorn`.`PLAYERS` (
			`name`, 
			`surname`, 
			`birth_season`, 
			`birth_day`, 
			`country`, 
			`personality`, 
			`form`, 
			`experience`, 
			`month_salary` 
		) VALUES (
			_name,
			_surname,
			_birth_season, 
			_birth_day, 
			_country, 
			1,
			1,
			1,
			1
		);
		
		SELECT @@identity into _id;
		
		INSERT INTO `matterhorn`.`PLAYERS_SKILLS` (`player_id`,`skill_id`,`value`) VALUES (_id, 'GK', _gk_skill);
		INSERT INTO `matterhorn`.`PLAYERS_SKILLS` (`player_id`,`skill_id`,`value`) VALUES (_id, 'DE', _de_skill);
		INSERT INTO `matterhorn`.`PLAYERS_SKILLS` (`player_id`,`skill_id`,`value`) VALUES (_id, 'MF', _mf_skill);
		INSERT INTO `matterhorn`.`PLAYERS_SKILLS` (`player_id`,`skill_id`,`value`) VALUES (_id, 'CR', _cr_skill);
		INSERT INTO `matterhorn`.`PLAYERS_SKILLS` (`player_id`,`skill_id`,`value`) VALUES (_id, 'TK', _tk_skill);
		INSERT INTO `matterhorn`.`PLAYERS_SKILLS` (`player_id`,`skill_id`,`value`) VALUES (_id, 'FW', _fw_skill);
	
	COMMIT;
	
END