-- venue_
SELECT
*
FROM venue_
WHERE country <> "us";

/* 
I've noticed that LetsMeet members have hometowns that are from cities all over the world.
While exploring the table, I noticed that there was a column to specify a country for a venue.
The purpose of this query was to check if there were any venues outside of the United States.
There are currently no venues outside of the US. 
*/

SELECT 
    city, 
    COUNT(venue_id)
FROM
    venue_
GROUP BY city
ORDER BY COUNT(venue_id) DESC;

/*
The purpose of this query is to view the cities with the most number of venues, in order from highest 
to lowest.
New York is the city with the most venues at 518. That is substantially higher than either 
Chicago (287 venues) and San Francisco (202 venues) which were the second and third respectively.
The top 3 cities are all major cities. There is only 1 city with a venues from the surrounding area 
of one of these larger cities.
Finally, New York, Chicago, and San Francisco are all listed multiple times with the table, just 
with different values (ex. New York, New York City, New York,NY etc). This will have to be cleaned up 
during future analysis.
*/

SELECT 
    zip, 
    COUNT(venue_id)
FROM
    venue_
GROUP BY zip
ORDER BY COUNT(venue_id) DESC;

/*
Large cities like New York and Chicago have multiple zip codes.
The purpose in this query is view the zip codes with most venues, rank ordered from those with 
the highest number of venues to lowest.
This would provide a more granular look into the number of venues within each of the large cities.
The zip code with the greatest number of venues is actually a invalid zip code with a value of "-1".
The zip code with the second highest number of venues is also an invalid zip code with a value of "1".
The top 7 valid zip codes are all from New York, confirming what we see in the previous query where 
New York is the city with the largest number of venues.
This column will need attention to clean up.
*/

-- grp
SELECT 
    who, 
    COUNT(who)
FROM
    grp
GROUP BY who
ORDER BY COUNT(who) DESC;

/*
The who column appears to be a name for an organization. This is likely the organization who is 
running the group on the LetsMeet platform.
The value that comes up most often is "Members", a very generic value. The next 4 that come up most 
frequently are also generic values- Friends, Veg Friends, Developers, and Entrepreneurs.
*/

SELECT 
    group_name, 
    created
FROM
    grp
WHERE
    join_mode = 'open'
ORDER BY created ASC
LIMIT 5;

/*
This query shows the top 5 longest running groups on LetsMeet.
They are:
1. New York City Poker Group
2. NYC Dining + Cooking
3. SF PHP Community
4. Events for Wine Lovers
5. The NYC Bookcrossing Meetup
All 5 were created in October, 2002.
Also, 3 of the top 5 longest running groups are from New York City. This alligns with previous 
findings that have New York City as the city with the most number of venues and has the top 7 zip 
codes with the most venues.
*/

-- grp_member
SELECT 
    member_name, 
    member_status, 
    joined
FROM
    grp_member
WHERE
    member_status = 'active'
ORDER BY joined ASC
LIMIT 5;

/*
The first LetsMeet member that is still active is Christine, who joined April 14, 2003.
This query shows the 5 members of LetsMeet with the longest membership who are still active. 
4 of 5 have been members of LetsMeet since 2003.
*/

SELECT 
    member_id, 
    member_name, 
    COUNT(group_id)
FROM
    grp_member
WHERE
    member_status = 'active'
GROUP BY member_id
ORDER BY COUNT(group_id) DESC;

/*
This quesry is to find the member who is a part of the most groups.
There is actually a tie among 7 members for who is a member of the most groups.
Each of the following members are members of 7 groups:
Sam 
Steve 
Lucy 
Kaushik 
Nitin 
Ana
Huang
*/

-- city
SELECT 
    city
FROM
    city
WHERE
    country <> 'us';

/*
This query is a follow up to the query I used to check if there are any venues outside of the U.S.
This check is interesting because there are memebers with hometowns listed outside the U.S.
There are no cities listed outside of the U.S where LetsMeet groups and members gather.
LetsMeet seems to be able to capture that data in the event that LetsMeet expanded internationally.  
*/

SELECT 
    *
FROM
    city
ORDER BY ranking ASC;

/*  
This query was intended to try to make sense of the ranking column.
Without a data dictionary, the purpose of this column is not clear to me.
I assumed that a value of 1 was best and ordered the table accordingly in the query. 
2 of the 3 largest cities (New York and Chicago), as well as South San Francisco all have a value of 0. 
It is not clear to me if this is a mistake or not.
Also, there are 13 cities listed and the city with the highest value in the rank column is Chicago Ridge, 
IL with a rank value of 178. This is also not clear what this value represents.
I conclude that this column provides no useful information at this time.   
*/

-- event
SELECT 
    COUNT(event_id), 
    SUM(headcount), 
    AVG(headcount)
FROM
    event;

/*
This query shows the number of events along with the total headcount for all events and the average
headcount at each event.
There are 5807 events listed with LetsMeet.
The headcount column seems to be a problem. The values all seem to be 0 so the the total headcount and 
average headcount are all 0 as a result.
The headcount column does not provide any useful information for analysis.
*/

SELECT 
    venue_name, 
    city, 
    COUNT(event.venue_id)
FROM
    event
JOIN
    venue_ ON event.venue_id = venue_.venue_id
GROUP BY venue_name
ORDER BY COUNT(venue_id) DESC
LIMIT 1;

/*
This query shows the most popular venue using the event and venue_ tables.
The most popular venue is The Ainsworth in New York City with 370 events.
This reinforces the popularity of LetsMeet in New York city.
*/

-- category
SELECT 
    category_name, 
    COUNT(group_id)
FROM
    category
JOIN
    grp ON category.category_id = grp.category_id
GROUP BY category_name
ORDER BY COUNT(group_id) DESC
LIMIT 5;

/*
This quesry uses the category and grp tables to determine the 5 most popular categories. 
This is measured by the number of groups associated with each category.
The 5 most popular categories include:
1. Tech (911 groups)
2. Career & Business (790 groups)
3. Socializing (320 groups)
4. Health & Wellbeing (218 groups)
5. Language & Ethnic Identity (166 groups)
This information may be helpful for the Sales team to help grow and expand LetsMeet.
Adjusting this query to show the least popular groups may also be informative. 
*/
