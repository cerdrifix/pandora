CREATE PROCEDURE SP_INSERT_PLAYER(
	OUT id SERIAL,
	IN name VARCHAR(45),
  IN surname VARCHAR(45),
  IN birth_season SMALLINT,
  IN birth_day SMALLINT,
  IN country VARCHAR(2),
  IN gk_skill DECIMAL(5,3),
  IN de_skill DECIMAL(5,3),
  IN mf_skill DECIMAL(5,3),
  IN cr_skill DECIMAL(5,3),
  IN tk_skill DECIMAL(5,3),
  IN fw_skill DECIMAL(5,3)
)
BEGIN
	
  DECLARE id SERIAL;
  
  INSERT INTO PLAYERS (
		`name`, 
    `surname`, 
    `birth_season`, 
    `birth_day`, 
    `country`, 
    `personality`, 
    `form`, 
    `experience`, 
    `month_salary` 
	)
  VALUES (
		name,
    surname,
    birth_season, 
    birth_day, 
    country, 
    1,
    1,
    1,
    1
	)
  
  
END;