-- create pysports_user and grant them all privileges to the pysports database
CREATE USER 'pysports_user"@localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat';
-- grant all priviliges to the pysports database to user pysports_user on localhost
GRANT ALL PRIVILEGES ON pysports.* TO'pysports_user'@'localhost';
-- drop test user if exists
DROP USER IF EXISTS 'pysports_user'@'localhost';
-- Create the team table
CREATE TABLE team (
	team_id 	INT				NOT NULL 			AUTO_INCREMENT,
    team_name	VARCHAR(75)		NOT NULL,
    mascot		VARCHAR(75)		NOT NULL,
    PRIMARY KEY(team_id)
);
-- create the player table and set the foreign key
CREATE TABLE player (
	player_id 	INT				NOT NULL 			AUTO_INCREMENT,
    first_name	VARCHAR(75)		NOT NULL,
    last_name	VARCHAR(75)		NOT NULL,
    team_id		INT 			NOT NULL,
    PRIMARY KEY(player_id),
    CONSTRAINT fk_team
    FOREIGN KEY(tem_id)
		REFERENCES team(team_id)
);
-- insert team records
INSERT INTO team(team_name, mascot)
	VALUES('Team Gandalf', 'White Wizards');
-- drop tables if they are present
DROP TABLE IF EXISTS player;
SELECT team_id FROM team WHERE team_name = 'Team Sauron'

SELECT player_id, first_name, last_name, team_name
FROM player
INNER JOIN team
	ON player.team_id = team.team_id;
SELECT player_id, first_name, last_name, team_name
FROM player
LEFT OUTER JOIN team
	ON player.team_id = team.team_id;
SELECT player_id, first_name, last_name, team_name
FROM player
RIGHT OUTER JOIN team
	ON player.team_id = team.team_id;
SELECT first_name, last_name
FROM player
WHERE player_id =3;

-- DISPLAYING PLAYER RECORDS --
Player ID: 1
First Name: Thorin
Last_Name: Oakenshield
Team Name: Team Gandalf

Player ID: 2
First Name: Bilbo
Last Name: Baggins
Team Name: Team Gandalf

Player ID: 3
First Name Frodo
Last Name: Baggins
Team Name: Team Gandalf

Player ID: 4
First Name: Saruman
Last Name: The White
Team Name: Team Sauron

Player ID: 5 
First Name: Angmar
Last Name: Witch-king
Team Name: Team Sauron

Player ID: 6
First Name: AZog
Last Name: The Defiler
Team Name: Team Suron

    

