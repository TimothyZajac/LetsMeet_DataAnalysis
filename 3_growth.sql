-- Step 2
SELECT 
    year_joined, 
    COUNT(member_id)
FROM
    (SELECT 
        member_id, 
        YEAR(MIN(joined)) AS year_joined
    FROM
        grp_member
    GROUP BY member_id) AS member_info
GROUP BY year_joined
ORDER BY year_joined DESC;

/* 
This query shows the number of new LetsMeet memebers by the year they joined.
The results are ordered most recent year to oldest year. 

***NOTE on the subquery: the subquery in the FROM statement creates a results table called
member_info that shows the year that each member joined their first group. This is the basis for 
counting the members who joined each year and displaying them GROUPed by year in order from the 
most resent (2017) to the oldest (2003).

Initial observations:
1. The dataset is incomplete- there is no data from 2018-2022. The reason for this isn't 
immediately apparent.
2. Membership increases each year, but the amount of growth varies each year. Growth from the 2 most
reacent years 2016 into 2017 does seem low at just 363 new members, or 3.5%. 
*/

-- Step 3
SELECT 
    city, 
    COUNT(city)
FROM
    grp_member
GROUP BY city
ORDER BY COUNT(city) DESC;

/* 
This query showes the number of instances of all cities in the grp_member table.
I will be executing the UPDATE query for each city seperately instead to ensure that each UPDATE
achieves its intended result.
Run this after running the UPDATE on each city to ensure that each achieved the results intended. 
*/

SET SQL_SAFE_UPDATES = 0;

UPDATE grp_member
SET city = "Chicago"
WHERE city IN("East Chicago", "West Chicago", "North Chicago", "Chicago Heights", "Chicago Ridge");

SET SQL_SAFE_UPDATES = 1;

/* Used first query (SELECT city) to ensure that all were changed to Chicago */

SET SQL_SAFE_UPDATES = 0;

UPDATE grp_member
SET city = "San Francisco"
WHERE city = "South San Francisco";

SET SQL_SAFE_UPDATES = 1;

 /* Used first query (SELECT city) to ensure that all instances of South San Francisco 
 were changed to San Francisco. */
 
 SET SQL_SAFE_UPDATES = 0;

UPDATE grp_member
SET city = "New York"
WHERE city = "West New York";

SET SQL_SAFE_UPDATES = 1;

 /* Used first query (SELECT city) to ensure that all instances of West New York 
 were changed to New York. */
 
 -- Step 4
 SELECT 
    year_joined, 
    COUNT(member_id) AS New_York_Membership
FROM
    (SELECT 
        member_id, 
        YEAR(MIN(joined)) AS year_joined
    FROM
        grp_member
	WHERE city = "New York"
    GROUP BY member_id) AS member_info
GROUP BY year_joined
ORDER BY year_joined DESC;

/* 
This query shows the number of new LetsMeet memebers in the city of New York (and surrounding areas)
by the year they joined. 
*/

 SELECT 
    year_joined, 
    COUNT(member_id) AS Chicago_Membership
FROM
    (SELECT 
        member_id, 
        YEAR(MIN(joined)) AS year_joined
    FROM
        grp_member
	WHERE city = "Chicago"
    GROUP BY member_id) AS member_info
GROUP BY year_joined
ORDER BY year_joined DESC;

/* 
This query shows the number of new LetsMeet memebers in the city of Chicago (and surrounding areas)
by the year they joined. 
*/

 SELECT 
    year_joined, 
    COUNT(member_id) AS SF_Membership
FROM
    (SELECT 
        member_id, 
        YEAR(MIN(joined)) AS year_joined
    FROM
        grp_member
	WHERE city = "San Francisco"
    GROUP BY member_id) AS member_info
GROUP BY year_joined
ORDER BY year_joined DESC;

/* 
This query shows the number of new LetsMeet memebers in the city of San Francisco (and surrounding areas)
by the year they joined. 
*/

-- Step 5
SELECT 
    month_joined, 
    COUNT(member_id)
FROM
    (SELECT 
        member_id, 
        MONTH(MIN(joined)) AS month_joined
    FROM
        grp_member
	WHERE YEAR(joined) = 2017
    GROUP BY member_id) AS member_info
GROUP BY month_joined
ORDER BY month_joined ASC;

/* 
This query shows the number of new LetsMeet memebers in 2017 by the month they joined.
The results are ordered January (1) through December (12).

Observations:
1. The number of new LetsMeet members is generally around 1000 per month except for November 
and December where new members are 223 and 12 respectively. This is likely due to those months being
the "Holiday Season" (Thanksgiving, Christmas, New Years Day) where most peple are attending parties and events
with friends and family.
*/