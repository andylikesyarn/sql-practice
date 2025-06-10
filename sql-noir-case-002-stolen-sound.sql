In the neon glow of 1980s Los Angeles, the West Hollywood Records store was rocked by a daring theft. A prized vinyl record, worth over $10,000, vanished during a busy evening, leaving the store owner desperate for answers. Vaguely recalling the details, you know the incident occurred on July 15, 1983, at this famous store. Your task is to track down the thief and bring them to justice.

--important setup notes: details:  1980s Los Angeles, West Hollywood Records store,  prized vinyl, July 15 1983
--1.Retrieve the crime scene report for the record theft using the known date and location.

SELECT *
FROM crime_scene
;

--checking colnames again

SELECT *
FROM crime_scene 
WHERE location LIKE 'West Hollywood%'
AND type = 'theft'
AND date = '19830715'

--returns record w/ description: 'A prized vinyl record was stolen from the store during a busy evening.'

--crime scene id = 65

--2.Retrieve witness records linked to that crime scene to obtain their clues.

SELECT * 
FROM witnesses
WHERE crime_scene_id = 65

--results indicate seeing a person w a red bandana and a gold watch

--3.Use the clues from the witnesses to find the suspect in the suspects table.

SELECT *
FROM suspects
WHERE accessory LIKE '%watch'
AND  bandana_color = 'red';

--three results: 35-Tony Ramirez , 44 - Mickey Rivera, 97-Rico Delgado
			
--4.Retrieve the suspect's interview transcript to confirm the confession.

SELECT name, interviews.transcript
FROM suspects
JOIN interviews
ON suspects.id = interviews.suspect_id
WHERE name='Tony Ramirez'
OR name='Mickey Rivera'
OR name='Rico Delgado';

--from results "Rico Delgado	I couldn't help it. I snapped and took the record."
--IT WAS RICO DELGADO


