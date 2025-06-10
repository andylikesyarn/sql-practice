Case #003: The Miami Marina Murder
A body was found floating near the docks of Coral Bay Marina in the early hours of August 14, 1986. Your job detective is to find the murderer and bring them to justice. This case might require the use of JOINs, wildcard searches, and logical deduction. Get to work, detective.

--details: near the docks of Coral Bay Marina in the early hours of August 14, 1986, murder

SELECT * 
FROM crime_scenes
WHERE location LIKE 'Coral Bay%'
AND type = 'murder'
AND date = '19860814';

--descripton from the results: The body of an unidentified man was found near the docks. Two people were seen nearby: one who lives on 300ish "Ocean Drive" and another whose first name ends with "ul" and his last name ends with "ez".

SELECT *
FROM person
WHERE name LIKE '%ul%ez'
OR address LIKE '3%Ocean Drive'

--From this, I get 4 results, with only 2 seeming to be relevant:
--101 Raul Gutierrez	The Cobra	Nightclub Owner	45 Sunset Ave
--102 Carlos Mendez	Los Ojos	Fisherman	369 Ocean Drive




SELECT *
FROM person
JOIN interviews
ON person.id = interviews.person_id
WHERE name='Raul Gutierrez'
OR name='Carlos Mendez';

--the results:
-- I saw someone check into a hotel on August 13. The guy looked nervous.
-- I heard someone checked into a hotel with "Sunset" in the name.

SELECT * 
FROM person
JOIN hotel_checkins
WHERE hotel_name LIKE '%Sunset%'
AND check_in_date= '19860813'

--This gives a HUGE number of answers. 


SELECT * FROM hotel_checkins hc
JOIN surveillance_records sr ON hc.person_id = sr.person_id
WHERE (suspicious_activity LIKE '%3 AM%'
OR suspicious_activity LIKE '%arguing%')
AND check_in_date = 19860813
AND hotel_name LIKE '%Sunset%';

--I get 2 results: person_id of 7 and 8

SELECT * FROM person
WHERE id = 7
OR id = 8;


--just looked at names, now let's see if I can get confessions

SELECT * 
FROM person
JOIN confessions
ON person.id = confessions.person_id
WHERE person.id = 7
OR person.id = 8;

--This returns 2 descriptions, in 1 of them Thomas admits to doing the crime. 


