--At Miami’s prestigious Fontainebleau Hotel charity gala, the famous “Heart of Atlantis” diamond necklace suddenly disappeared from its display.

--Fontainebleau hotel
--theft
--diamond
--heart of atlantis

--cool so i'm gonna look at the datasets and try to filter for anything interesting

SELECT * FROM
attire_registry;


SELECT * FROM
attire_registry
WHERE note LIKE '%iamond necklace%';

--only one person seen in a diamond necklace

SELECT * FROM
guest
JOIN attire_registry
ON guest.id = attire_registry.guest_id
WHERE note LIKE '%iamond necklace%';

--ig this is a red herring

--ok let's look at interviews and confessions next

SELECT * FROM
final_interviews;

--nearly all have 'kill' and are past tense, so let's maybe put in 'stole' or 'took' to see if that works?


SELECT * FROM
final_interviews
WHERE confession LIKE '%took%'
OR confession LIKE '%stole%'

--only 1 result w/ id 105

SELECT * FROM guest
WHERE id=105;

--MIKE MAIN

--ok, hilariously I did NOT do this how the game said to but it still worked.
