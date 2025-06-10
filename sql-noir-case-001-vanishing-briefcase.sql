-- Record your SQL detective process here!  Write down: 
--first thought: I feel we could have some dang instructions, SQL Noir. 

-- tables are: crime_scene, suspects, and interviers. 

SELECT * FROM
crime_scene;

SELECT * FROM
suspects;

SELECT * FROM
interviews;

--goal here is to see what data we're working with 


--Set in the gritty 1980s, a valuable briefcase has disappeared from the Blue Note Lounge. A witness reported that a man in a trench coat was seen fleeing the scene. Investigate the crime scene, review the list of suspects, and examine interview transcripts to reveal the culprit.

--important notes: MAN in TRENCH COAT 

--looking at larger dataset, it seems we have a few observations w/ theft or a briefcase (WHERE type = theft AND location = 'blue note lounge'

SELECT description 
FROM crime_scene 
WHERE type='theft'
AND location='Blue Note Lounge';

--we get the a description adding the detail that trenchcoat guy has a scar on his cheek

SELECT name 
FROM suspects
WHERE attire = 'trench coat' 
AND scar LIKE '%cheek'

--the output here has 3 options, so let me look again at the description output. 

SELECT description 
FROM crime_scene 
WHERE type='theft'
AND location='Blue Note Lounge';


--"A briefcase containing sensitive documents vanished. A witness reported a man in a trench coat with a scar on his left cheek fleeing the scene."

SELECT name 
FROM suspects
WHERE attire = 'trench coat' 
AND scar = 'left cheek'

--we get Frankie Lombardi and Vincent Malone. 
--now I need to match them up 2 the interviews

SELECT *
FROM suspects
JOIN interviews
ON suspects.is = interviews.suspect_id
WHERE name='Frankie Lombardi'
OR name='Vincent Malone';

--output gives Malone's statement as 'I wasn’t going to steal it, but I did.'

--VINCENT MALONE DID IT

  -- 3. Your final conclusion: who did it?
