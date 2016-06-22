SELECT * FROM `matterhorn`.`PLAYERS_SKILLS`;
SELECT * FROM `matterhorn`.`PLAYERS_SPECIALITIES`;
SELECT * FROM `matterhorn`.`PLAYERS`;
SELECT * FROM `matterhorn`.`SKILLS`;
SELECT * FROM `matterhorn`.`SPECIALITIES`;
SELECT * FROM `matterhorn`.`FORMATIONS`;

SELECT * FROM `matterhorn`.`USERS`;
SELECT * FROM `matterhorn`.`TEAMS`;
SELECT * FROM `matterhorn`.`TEAMS_PLAYERS`;

SELECT * FROM `matterhorn`.`MATCHES`;
SELECT * FROM `matterhorn`.`MATCHES_FORMATIONS`;

call SP_PLAYERS_GETBYID(10, null);

call SP_PLAYERS_GETBYMATCHANDTEAMID(1,2,4,null);

select abs(round(-18.3323))
