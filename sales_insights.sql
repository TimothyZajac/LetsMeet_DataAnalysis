-- Answer the questions from the Sales team in this file..

-- Active Cities
SELECT DISTINCT
    city
FROM
    grp_member
WHERE
    member_status = 'active';

/* 1. What cities have active members?

There are 10 cities with active members. They include:
San Francisco
New York
Chicago
West New York
West Chicago
South San Francisco
North Chicago
Chicago Heights
East Chicago
Chicago Ridge

The member_status column is enumerated and limited to 2 values- 'active' and 'prereg'.
Running the same query with the member_status value changed from 'active' to 'prereg' shows 
members with that particular status limited to just 3 cities: Chicago, New York and San Francisco. 
There are no instances of 'prereg' in any of the other cities.
For future analysis, it may be worth exploring what 'prereg' means and the process for membership 
as it may indicate opportunities for future marketing efforts.
*/

SELECT DISTINCT
    city, 
    state
FROM
    city
WHERE
    city NOT IN (SELECT DISTINCT
            city
        FROM
            grp_member
        WHERE
            member_status = 'active');

/*  2. Are there any cities listed in the city table with no active members? 
If so, what state are those cities in?

There are 3 cities with no active members. The cities and states they are in include:
New York Mills, New York
New York Mills, Minnisota
Chicago Park, California

New York Mills, MN is nowhere near New York, San Francisco or Chicago and may be a mistake 
(i.e. may have erroniuosly entered MN or selected MN).
New York Mills, NY is approximately 250 miles from New York City and Chicago Park, CA is approximately
150 miles from San Francisco. These could indicate cities where there is interest in LetsMeet groups 
but are too far away from cities with established groups. This is something to explore further for 
potential future marketing efforts.
*/

-- Groups
SELECT 
    join_mode, 
    COUNT(join_mode)
FROM
    grp
GROUP BY join_mode;

/* How many groups are currently open, waiting for approval, and/or closed?

There are 3602 groups currently open.
There are 723 groups currently waiting for approval.
There are 15 groups currently closed.
The number of groups awaiting approval is interesting. If all 723 were to be approved, that would 
be a growth in the number of groups of approximately 20%. There may be opportunities for increased customer satisfaction
if the approval process could be made faster or more efficient.
For future analysis, it would be benificial to explore when the group was created and how long it takes 
for a group to become approved. A speedy approval process may lead to increased customer satisfaction.
Being new to the company, it would also be benificial to engage the Director of Sales, VP of Engineering 
and potentially the CEO to gain an understanding of the opportunities. 
*/

-- Categories
SELECT 
    category_name, 
    COUNT(group_id)
FROM
    grp
JOIN
    category ON grp.category_id = category.category_id
GROUP BY category_name
ORDER BY COUNT(group_id) DESC
LIMIT 5;

/* What are the five catagories that contain the most groups?

The five categories that contain the most groups are:
- Tech (911 groups)
- Career & Business	(790 groups)
- Socializing (320 groups)
- Health & Wellbeing (218 groups)
- Language & Ethnic Identity (166 groups)
The Technology and Career & Business categories seem to be popular based on the amount of groups. 
This could be misleading since we don't know how many members are in each group within each of these 
categories. 
This could also potentially indicate that LetsMeet may benifit from adjusting their marketing to place 
additional emphasis on the professional networking and skills aspects.
*/

SELECT 
    category_name, 
    COUNT(group_id)
FROM
    grp
JOIN
    category ON grp.category_id = category.category_id
GROUP BY category_name
ORDER BY COUNT(group_id) ASC
LIMIT 5;

/* What are the five catagories that contain the least groups?

The five catagories that contain the least groups include:
- Paranormal (4 groups)
- Cars & Motorcycles (15 groups)
- Sci-Fi & Fantasy (16 groups)
- Lifestyle (26 groups)
- Fashion & Beauty (32 groups)
At first glance, this indicates that these five catagories are the least popular. This could be 
misleading since we don't know how many members are in each group within these categories.
It would be helpful to engage the Director of Sales for additional details about what they are trying 
to gain from this question.
*/

-- Members
SELECT
    COUNT(DISTINCT (member_id))
FROM
    grp_member;

/* 1. How many members are there?

There are currently 39,980 members.
The notes for the grp_member table in the slide deck state that members in multiple groups will appear 
multiple times in the table.
Adding a COUNT(member_id) to the query above showed that there were 43,470 total member id's listed in 
that column. Subtracting the number of distinct member id's (39.980) from the total member id's (43,470) 
reveals that there are 3,490 instances where a member belongs to more than one group.
It would be interesting to explore this more during future analysis.
*/

SELECT 
    (SELECT 
            COUNT(DISTINCT (member_id))
        FROM
            grp_member
        WHERE
            city = 'Chicago')
            / 
	(SELECT 
            COUNT(DISTINCT(member_id))
        FROM
            grp_member);

/* 2. What percentage of members are in Chicago?

Currently, 21.19% of members are in Chicago.
A breakout of members in each city would be more informative.
This query does not include any memeber from any of the cities in the greater Chicago area. It is 
possible for members to live in a city like Chicago Heights, IL and be a member of a group in Chicago. 
A breakout of memebership in the major cities along with cities in the surrounding areas may be useful 
in future analysis. 
*/