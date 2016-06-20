INSERT INTO `matterhorn`.`USERS` (`username`, `name`, `surname`, `country`)
VALUES ( 'test01', '01', 'Test', 'IT');

SELECT @@identity INTO @user_id;

INSERT INTO `matterhorn`.`TEAMS` (`description`,`owner`,`creation_date`,`end_date`,`country`,`active`)
VALUES ('Alieni', @user_id, NOW(), '30000101', 'IT', 1);

SELECT @@identity INTO @team_id;

CALL `matterhorn`.`SP_INSERT_PLAYER`(@player_id, 'Silvio', 'Polenta', (-22 * 126) - 15, 'IT', 15.13, 8.97, 1.39, 1.18, 1.08, 1.85);
INSERT INTO `matterhorn`.`TEAMS_PLAYERS` (`team_id`,`player_id`,`dataInizio`,`dataFine`)
VALUES (@team_id, @player_id, NOW(), '30000101');

CALL `matterhorn`.`SP_INSERT_PLAYER`(@player_id, 'Luigi', 'Spezzadino', (-21 * 126) - 21, 'IT', 1.38, 18.00, 5.70, 5.59, 5.18, 2.22);
INSERT INTO `matterhorn`.`TEAMS_PLAYERS` (`team_id`,`player_id`,`dataInizio`,`dataFine`)
VALUES (@team_id, @player_id, NOW(), '30000101');

CALL `matterhorn`.`SP_INSERT_PLAYER`(@player_id, 'Fausto', 'Portata', (-20 * 126) - 25, 'IT', 1.61, 14.07, 10.55, 5.60, 5.93, 2.16);
INSERT INTO `matterhorn`.`TEAMS_PLAYERS` (`team_id`,`player_id`,`dataInizio`,`dataFine`)
VALUES (@team_id, @player_id, NOW(), '30000101');

CALL `matterhorn`.`SP_INSERT_PLAYER`(@player_id, 'Giuliano', 'Forchetta', (-20 * 126) - 52, 'IT', 1.93, 14.86, 11.97, 6.47, 5.48, 2.50);
INSERT INTO `matterhorn`.`TEAMS_PLAYERS` (`team_id`,`player_id`,`dataInizio`,`dataFine`)
VALUES (@team_id, @player_id, NOW(), '30000101');

CALL `matterhorn`.`SP_INSERT_PLAYER`(@player_id, 'Piero', 'Seduto', (-19 * 126) - 34, 'IT', 1.08, 14.53, 5.63, 5.70, 7.47, 5.43);
INSERT INTO `matterhorn`.`TEAMS_PLAYERS` (`team_id`,`player_id`,`dataInizio`,`dataFine`)
VALUES (@team_id, @player_id, NOW(), '30000101');

CALL `matterhorn`.`SP_INSERT_PLAYER`(@player_id, 'Cristiano', 'Ciucci', (-19 * 126) - 23, 'IT', 1.85, 3.19, 14.66, 6.21, 7.14, 4.04);
INSERT INTO `matterhorn`.`TEAMS_PLAYERS` (`team_id`,`player_id`,`dataInizio`,`dataFine`)
VALUES (@team_id, @player_id, NOW(), '30000101');

CALL `matterhorn`.`SP_INSERT_PLAYER`(@player_id, 'Salvatore', 'De Fonseca', (-18 * 126) - 102, 'IT', 1.83, 3.19, 14.71, 4.12, 8.51, 5.49);
INSERT INTO `matterhorn`.`TEAMS_PLAYERS` (`team_id`,`player_id`,`dataInizio`,`dataFine`)
VALUES (@team_id, @player_id, NOW(), '30000101');

CALL `matterhorn`.`SP_INSERT_PLAYER`(@player_id, 'Fausto', 'Bassorici', (-21 * 126) - 12, 'IT', 1.45, 4.71, 14.50, 15.93, 6.85, 7.58);
INSERT INTO `matterhorn`.`TEAMS_PLAYERS` (`team_id`,`player_id`,`dataInizio`,`dataFine`)
VALUES (@team_id, @player_id, NOW(), '30000101');

CALL `matterhorn`.`SP_INSERT_PLAYER`(@player_id, 'Giulio', 'Scarpacci', (-21 * 126) - 41, 'IT', 1.77, 5.69, 13.18, 14.71, 7.32, 5.08);
INSERT INTO `matterhorn`.`TEAMS_PLAYERS` (`team_id`,`player_id`,`dataInizio`,`dataFine`)
VALUES (@team_id, @player_id, NOW(), '30000101');

CALL `matterhorn`.`SP_INSERT_PLAYER`(@player_id, 'Cherubino', 'Spignoli', (-18 * 126) - 112, 'IT', 1.43, 3.79, 4.11, 6.66, 6.45, 14.10);
INSERT INTO `matterhorn`.`TEAMS_PLAYERS` (`team_id`,`player_id`,`dataInizio`,`dataFine`)
VALUES (@team_id, @player_id, NOW(), '30000101');

CALL `matterhorn`.`SP_INSERT_PLAYER`(@player_id, 'Lorenzo', 'Occhiofino', (-19 * 126) - 1, 'IT', 1.76, 4.42, 3.58, 6.86, 6.87, 14.50);
INSERT INTO `matterhorn`.`TEAMS_PLAYERS` (`team_id`,`player_id`,`dataInizio`,`dataFine`)
VALUES (@team_id, @player_id, NOW(), '30000101');

CALL `matterhorn`.`SP_INSERT_PLAYER`(@player_id, 'Pietro', 'Panzanella', (-20 * 126) - 66, 'IT', 1.70, 5.40, 14.66, 5.86, 6.03, 5.82);
INSERT INTO `matterhorn`.`TEAMS_PLAYERS` (`team_id`,`player_id`,`dataInizio`,`dataFine`)
VALUES (@team_id, @player_id, NOW(), '30000101');



INSERT INTO `matterhorn`.`USERS` (`username`, `name`, `surname`, `country`)
VALUES ( 'test02', '02', 'Test', 'IT');

SELECT @@identity INTO @user_id;

INSERT INTO `matterhorn`.`TEAMS` (`description`,`owner`,`creation_date`,`end_date`,`country`,`active`)
VALUES ('Terrestri', @user_id, NOW(), '30000101', 'IT', 1);

SELECT @@identity INTO @team_id;

CALL `matterhorn`.`SP_INSERT_PLAYER`(@player_id, 'Giuseppe', 'Oppino', (-22 * 126) - 15, 'IT', 15.73, 8.82, 1.74, 1.82, 1.80, 1.79);
INSERT INTO `matterhorn`.`TEAMS_PLAYERS` (`team_id`,`player_id`,`dataInizio`,`dataFine`)
VALUES (@team_id, @player_id, NOW(), '30000101');

CALL `matterhorn`.`SP_INSERT_PLAYER`(@player_id, 'Gino', 'Strozzagalli', (-21 * 126) - 21, 'IT', 1.47, 17.54, 5.24, 5.57, 5.91, 2.78);
INSERT INTO `matterhorn`.`TEAMS_PLAYERS` (`team_id`,`player_id`,`dataInizio`,`dataFine`)
VALUES (@team_id, @player_id, NOW(), '30000101');

CALL `matterhorn`.`SP_INSERT_PLAYER`(@player_id, 'Claudio', 'Bettillo', (-20 * 126) - 25, 'IT', 1.89, 14.45, 10.64, 5.85, 5.48, 2.49);
INSERT INTO `matterhorn`.`TEAMS_PLAYERS` (`team_id`,`player_id`,`dataInizio`,`dataFine`)
VALUES (@team_id, @player_id, NOW(), '30000101');

CALL `matterhorn`.`SP_INSERT_PLAYER`(@player_id, 'Pino', 'Rossi', (-20 * 126) - 52, 'IT', 1.94, 14.81, 11.15, 6.14, 5.31, 2.82);
INSERT INTO `matterhorn`.`TEAMS_PLAYERS` (`team_id`,`player_id`,`dataInizio`,`dataFine`)
VALUES (@team_id, @player_id, NOW(), '30000101');

CALL `matterhorn`.`SP_INSERT_PLAYER`(@player_id, 'Aristide', 'De Micelis', (-19 * 126) - 34, 'IT', 1.81, 5.77, 14.84, 5.29, 6.89, 5.97);
INSERT INTO `matterhorn`.`TEAMS_PLAYERS` (`team_id`,`player_id`,`dataInizio`,`dataFine`)
VALUES (@team_id, @player_id, NOW(), '30000101');

CALL `matterhorn`.`SP_INSERT_PLAYER`(@player_id, 'Paride', 'Cavallanti', (-19 * 126) - 23, 'IT', 1.56, 3.69, 14.95, 6.59, 7.56, 4.62);
INSERT INTO `matterhorn`.`TEAMS_PLAYERS` (`team_id`,`player_id`,`dataInizio`,`dataFine`)
VALUES (@team_id, @player_id, NOW(), '30000101');

CALL `matterhorn`.`SP_INSERT_PLAYER`(@player_id, 'Mario', 'Perrone', (-18 * 126) - 102, 'IT', 1.12, 3.44, 14.88, 4.15, 8.68, 5.28);
INSERT INTO `matterhorn`.`TEAMS_PLAYERS` (`team_id`,`player_id`,`dataInizio`,`dataFine`)
VALUES (@team_id, @player_id, NOW(), '30000101');

CALL `matterhorn`.`SP_INSERT_PLAYER`(@player_id, 'Marco', 'Della Rocca', (-21 * 126) - 12, 'IT', 1.94, 4.02, 14.81, 15.49, 6.55, 7.73);
INSERT INTO `matterhorn`.`TEAMS_PLAYERS` (`team_id`,`player_id`,`dataInizio`,`dataFine`)
VALUES (@team_id, @player_id, NOW(), '30000101');

CALL `matterhorn`.`SP_INSERT_PLAYER`(@player_id, 'Roberto', 'Silenzi', (-21 * 126) - 41, 'IT', 1.19, 5.66, 13.83, 14.24, 7.49, 5.15);
INSERT INTO `matterhorn`.`TEAMS_PLAYERS` (`team_id`,`player_id`,`dataInizio`,`dataFine`)
VALUES (@team_id, @player_id, NOW(), '30000101');

CALL `matterhorn`.`SP_INSERT_PLAYER`(@player_id, 'Roberto', 'Miglio', (-18 * 126) - 112, 'IT', 1.57, 3.49, 4.26, 6.86, 6.93, 14.50);
INSERT INTO `matterhorn`.`TEAMS_PLAYERS` (`team_id`,`player_id`,`dataInizio`,`dataFine`)
VALUES (@team_id, @player_id, NOW(), '30000101');

CALL `matterhorn`.`SP_INSERT_PLAYER`(@player_id, 'Eugenio', 'Vitalis', (-19 * 126) - 1, 'IT', 1.48, 4.69, 3.33, 6.31, 6.68, 14.72);
INSERT INTO `matterhorn`.`TEAMS_PLAYERS` (`team_id`,`player_id`,`dataInizio`,`dataFine`)
VALUES (@team_id, @player_id, NOW(), '30000101');

CALL `matterhorn`.`SP_INSERT_PLAYER`(@player_id, 'Antonio', 'Panchina', (-20 * 126) - 66, 'IT', 1.18, 4.73, 14.88, 5.23, 7.23, 5.12);
INSERT INTO `matterhorn`.`TEAMS_PLAYERS` (`team_id`,`player_id`,`dataInizio`,`dataFine`)
VALUES (@team_id, @player_id, NOW(), '30000101');
