#######################################################################
## 							Creazione DB 							 				##
#######################################################################

## Schema
CREATE DATABASE IF NOT EXISTS `matterhorn` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

DROP TABLE IF EXISTS `matterhorn`.`TEAMS_PLAYERS`;
DROP TABLE IF EXISTS `matterhorn`.`PLAYERS_SKILLS`;
DROP TABLE IF EXISTS `matterhorn`.`PLAYERS_SPECIALITIES`;
DROP TABLE IF EXISTS `matterhorn`.`PLAYERS`;
DROP TABLE IF EXISTS `matterhorn`.`SKILLS`;
DROP TABLE IF EXISTS `matterhorn`.`SPECIALITIES`;
DROP TABLE IF EXISTS `matterhorn`.`FORMATIONS`;
DROP TABLE IF EXISTS `matterhorn`.`TEAMS`;
DROP TABLE IF EXISTS `matterhorn`.`USERS`;


## Tabella "Specialities"
CREATE TABLE `matterhorn`.`SPECIALITIES` (
  `id` TINYINT UNSIGNED NOT NULL UNIQUE,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `matterhorn`.`SPECIALITIES` VALUES ( 1, 'Colpo di testa' );
INSERT INTO `matterhorn`.`SPECIALITIES` VALUES ( 2, 'Rapido' );
INSERT INTO `matterhorn`.`SPECIALITIES` VALUES ( 3, 'Fisico' );
INSERT INTO `matterhorn`.`SPECIALITIES` VALUES ( 4, 'Visione di gioco' );
INSERT INTO `matterhorn`.`SPECIALITIES` VALUES ( 5, 'Estro' );
INSERT INTO `matterhorn`.`SPECIALITIES` VALUES ( 6, 'Tecnico' );
INSERT INTO `matterhorn`.`SPECIALITIES` VALUES ( 7, 'Senso del gol' );
INSERT INTO `matterhorn`.`SPECIALITIES` VALUES ( 8, 'Assist' );
INSERT INTO `matterhorn`.`SPECIALITIES` VALUES ( 9, 'Dribbling' );
INSERT INTO `matterhorn`.`SPECIALITIES` VALUES ( 10, 'Calci di punizione' );
COMMIT;

## Tabella Skills
CREATE TABLE `matterhorn`.`SKILLS` (
	`id` CHAR(2) NOT NULL UNIQUE,
	`description` VARCHAR(45) NOT NULL,
	PRIMARY KEY (`id`)
);

INSERT INTO `matterhorn`.`SKILLS` VALUES ('GK', 'Parate');
INSERT INTO `matterhorn`.`SKILLS` VALUES ('DE', 'Difesa');
INSERT INTO `matterhorn`.`SKILLS` VALUES ('MF', 'Centrocampo');
INSERT INTO `matterhorn`.`SKILLS` VALUES ('CR', 'Cross');
INSERT INTO `matterhorn`.`SKILLS` VALUES ('TK', 'Tecnica');
INSERT INTO `matterhorn`.`SKILLS` VALUES ('FW', 'Attacco');
COMMIT;

## Tabella players
CREATE TABLE `matterhorn`.`PLAYERS` (
	`id` SERIAL,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `birth_season` SMALLINT SIGNED NOT NULL,
  `birth_day` SMALLINT UNSIGNED NOT NULL,
  `country` varchar(2) NOT NULL,
  `personality` SMALLINT SIGNED NOT NULL,
  `form` MEDIUMINT UNSIGNED NOT NULL,
  `experience` MEDIUMINT UNSIGNED NOT NULL,
  `month_salary` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
);

## Tabella players_skills
CREATE TABLE `matterhorn`.`PLAYERS_SKILLS` (
	`player_id` BIGINT UNSIGNED NOT NULL,
	`skill_id` CHAR(2) NOT NULL,
	`value` DECIMAL(5,3) UNSIGNED NOT NULL,
  PRIMARY KEY (`player_id`, `skill_id` )
);
ALTER TABLE `matterhorn`.`PLAYERS_SKILLS` ADD INDEX `PS_SKILLS_FK_idx` (`skill_id` ASC);
ALTER TABLE `matterhorn`.`PLAYERS_SKILLS` ADD INDEX `PS_PLAYERS_FK_idx` (`player_id` ASC);

ALTER TABLE `matterhorn`.`PLAYERS_SKILLS` 
ADD CONSTRAINT `PS_PLAYERS_FK`
  FOREIGN KEY (`player_id`) REFERENCES `matterhorn`.`PLAYERS` (`id`),
ADD CONSTRAINT `PS_SKILLS_FK`
  FOREIGN KEY (`skill_id`) REFERENCES `matterhorn`.`SKILLS` (`id`);

## Tabella players_specialities
CREATE TABLE `matterhorn`.`PLAYERS_SPECIALITIES` (
	`player_id` SERIAL,
  `speciality_id` TINYINT UNSIGNED NOT NULL,
  `value` DECIMAL (5,3) UNSIGNED NOT NULL,
  PRIMARY KEY (`player_id`, `speciality_id`)
);

ALTER TABLE `matterhorn`.`PLAYERS_SPECIALITIES` 
ADD INDEX `PL_SPEC_PLAYERS_FK_idx` (`player_id` ASC);
ALTER TABLE `matterhorn`.`PLAYERS_SPECIALITIES` 
ADD INDEX `PL_SPEC_SPECIALITIES_FK_idx` (`speciality_id` ASC);

ALTER TABLE `matterhorn`.`PLAYERS_SPECIALITIES` 
ADD CONSTRAINT `PL_SPEC_PLAYERS_FK`
  FOREIGN KEY (`player_id`) REFERENCES `matterhorn`.`PLAYERS` (`id`),
ADD CONSTRAINT `PL_SPEC_SPECIALITIES_FK`
  FOREIGN KEY (`speciality_id`) REFERENCES `matterhorn`.`SPECIALITIES` (`id`);
  
  
## Tabella Utenti
CREATE TABLE `matterhorn`.`USERS` (
	`id` SERIAL,
  `username` VARCHAR(50) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `surname` VARCHAR(50) NOT NULL,
  `country` VARCHAR(3) NOT NULL,
  PRIMARY KEY ( `id` )
);


## Tabella Teams
CREATE TABLE `matterhorn`.`TEAMS` (
	`id` SERIAL,
  `description` VARCHAR(50) NOT NULL,
  `owner` BIGINT UNSIGNED NOT NULL,
  `creation_date` DATETIME NOT NULL,
  `end_date` DATETIME NOT NULL,
  `country` VARCHAR(3) NOT NULL,
  `active` BOOLEAN DEFAULT true,
  PRIMARY KEY ( `id` )
);
ALTER TABLE `matterhorn`.`TEAMS` 
ADD INDEX `TEAMS_USERS_FK_idx` (`owner` ASC);
ALTER TABLE `matterhorn`.`TEAMS` 
ADD CONSTRAINT `TEAMS_USERS_FK`
  FOREIGN KEY (`owner`) REFERENCES `matterhorn`.`USERS` (`id`);
  

## Tabella associazione Team e players
CREATE TABLE `matterhorn`.`TEAMS_PLAYERS` (
	`team_id` BIGINT UNSIGNED NOT NULL,
	`player_id` BIGINT UNSIGNED NOT NULL,
  `dataInizio` DATETIME NOT NULL,
  `dataFine` DATETIME NOT NULL,
  PRIMARY KEY (`player_id`, `team_id` )
);
ALTER TABLE `matterhorn`.`TEAMS_PLAYERS` ADD INDEX `TS_TEAMS_FK_idx` (`team_id` ASC);
ALTER TABLE `matterhorn`.`TEAMS_PLAYERS` ADD INDEX `TS_PLAYERS_FK_idx` (`player_id` ASC);

ALTER TABLE `matterhorn`.`TEAMS_PLAYERS` 
ADD CONSTRAINT `TS_PLAYERS_FK`
  FOREIGN KEY (`player_id`) REFERENCES `matterhorn`.`PLAYERS` (`id`),
ADD CONSTRAINT `TS_SKILLS_FK`
  FOREIGN KEY (`team_id`) REFERENCES `matterhorn`.`TEAMS` (`id`);

  
## Tabella formazioni di gioco
CREATE TABLE `matterhorn`.`FORMATIONS` (
	`id` VARCHAR(5) NOT NULL UNIQUE,
  `description` VARCHAR(20) NOT NULL,
  PRIMARY KEY ( `id` )
);
INSERT INTO `matterhorn`.`FORMATIONS` VALUES ('442', '4-4-2');
INSERT INTO `matterhorn`.`FORMATIONS` VALUES ('433', '4-3-3');
INSERT INTO `matterhorn`.`FORMATIONS` VALUES ('352', '3-5-2');
