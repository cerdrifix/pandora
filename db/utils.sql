SELECT * FROM `matterhorn`.`PLAYERS_SKILLS`;
SELECT * FROM `matterhorn`.`PLAYERS_SPECIALITIES`;
SELECT * FROM `matterhorn`.`PLAYERS`;
SELECT * FROM `matterhorn`.`SKILLS`;
SELECT * FROM `matterhorn`.`SPECIALITIES`;
SELECT * FROM `matterhorn`.`FORMATIONS`;

SELECT * FROM `matterhorn`.`USERS`;
SELECT * FROM `matterhorn`.`TEAMS`;


call SP_PLAYERS_GETBYID(10, null);

select abs(round(-18.3323))
