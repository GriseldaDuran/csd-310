select query
-- DISPLAYING PLAYER RECORDS --
Player ID: 1
First Name: Thorin
Last_Name: Oakenshield
Team Name: Team Gandalf
Insert new record: 8

Player ID: 2
First Name: Bilbo
Last Name: Baggins
Team Name: Team Sauron

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

UPDATE player
SET team_id = 2
	first_name = 'Gollum'
    last_name = 'Ring Stealer'
WHERE first_name = 'Smeagol';
DETELE FROM player
WHERE first_name = 'Smeagol';
INSERT INTO player (first_name, last_name, team_id)
	VALUES( 'Smeagol', 'Shire FOLK', 1);