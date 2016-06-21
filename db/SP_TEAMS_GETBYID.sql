
DROP PROCEDURE IF EXISTS `matterhorn`.`SP_TEAMS_GETBYID`;

DELIMITER $$;

CREATE PROCEDURE `matterhorn`.`SP_TEAMS_GETBYID` (
	id BIGINT,
	d_riferimento DATETIME
)
BEGIN

	SELECT	T.id,
			T.description,
            concat(U.surname, " ", U.name) as 'owner',
            T.country,
            T.active
	FROM	TEAMS T INNER JOIN
			USERS U on U.id = T.owner
	WHERE	T.id = id;
   
END