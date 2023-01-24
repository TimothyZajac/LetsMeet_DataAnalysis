-- Step 2
SELECT 
    event_name
FROM
    event
WHERE
    event_name LIKE ('%oastmaster%');

/* 
The purpose of this query is to find all events that include the word Toastmaster. 
The wildcard (%) on front character helps bring back all results with "oastmaster" in it
regardless if the the first character is a T or t. 
It's a building block for the queries to answer Evelyn's questions.
*/

-- Step 3
SELECT 
    event_name,
    city
FROM
    event
JOIN grp ON event.group_id = grp.group_id
JOIN city ON grp.city_id = city.city_id
WHERE
    event_name LIKE ('%oastmaster%');
    
/*
This query builds on the query in Step 2. It shows the Taostmaster events along with the cities
that they're held in. 2 JOINs were required to produce these results- first was to JOIN the event 
and grp tables; second was to JOIN the grp and city tables.
This will be used a the vasis to obtain counts of events by city.
*/

-- 4
SELECT 
    city, 
    COUNT(event_name) AS Events
FROM
    event
JOIN grp ON event.group_id = grp.group_id
JOIN city ON grp.city_id = city.city_id
WHERE
    event_name LIKE ('%oastmaster%')
GROUP BY city
ORDER BY Events DESC;

/*
This query builds on Step 3. It shows the number of Toastmaster events in each city.
We have the information needed to answer Evelyn's questions.
Breakout of the number of Toastmaster event:
Chicago- 986 events
New York- 124 event
San Francisco- 7 events
TOTAL- 1,117
*/
