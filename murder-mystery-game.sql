-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

--code from instructions:
SELECT name 
  FROM sqlite_master
 where type = 'table';

--lists all table names

SELECT sql 
  FROM sqlite_master
 where name = 'crime_scene_report';
--selects table w/ specified name


  --TAKING A look at the crime scene table
SELECT * FROM crime_scene_report;

--adding in details from instructions

SELECT * FROM crime_scene_report
WHERE type = 'murder'
AND date = '20180115'
AND city = 'SQL City';

--returns a single observation with this descriotion: Security footage shows that there were 2 witnesses. 
--The first witness lives at the last house on "Northwestern Dr". 
--The second witness, named Annabel, lives somewhere on "Franklin Ave".

              
SELECT * FROM person
WHERE name LIKE 'Annabel %'
--16371	Annabel Miller	490173	103	Franklin Ave	318771143

  
SELECT MAX(address_number), id, name FROM person
WHERE address_street_name = 'Northwestern Dr';
--4919	14887	Morty Schapiro


--14887	I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. 
--The membership number on the bag started with "48Z". 
--Only gold members have those bags. The man got into a car with a plate that included "H42W".
              
SELECT * FROM interview
WHERE (person_id=14887 
	   OR person_id = 16371);

--16371	I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

--51739	Tushar Chandra	664760	312	Phi St	137882671	664760	21	71	black	black	male	4H42WR	Nissan	Altima
--67318	Jeremy Bowers	423327	530	Washington Pl, Apt 3A	871539279	423327	30	70	brown	brown	male	0H42W2	Chevrolet	Spark LS
SELECT *
FROM person
JOIN drivers_license
  ON person.license_id = drivers_license.id
JOIN get_fit_now_member
  ON person.id = get_fit_now_member.person_id
WHERE plate_number LIKE '%H42W%'
  AND gender = 'male'
  AND membership_status = 'gold'

-- now only returns Jeremy Bowers

--now querying for the challenge
SELECT transcript FROM person
JOIN interview 
ON person.id = interview.person_id
WHERE person.name = 'Jeremy Bowers';
--I was hired by a woman with a lot of money. 
--I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
--She has red hair and she drives a Tesla Model S. 
--SELECT * FROM person 
JOIN drivers_license
ON person.license_id = drivers_license.id
JOIN facebook_event_checkin
ON person.id = facebook_event_checkin.person_id
WHERE hair_color = 'red'
AND car_make = 'Tesla'
AND car_model = 'Model S'
AND gender = 'female'
AND height BETWEEN 64 AND 68

--returns only miranda priestly

