-- Step 2
SELECT 
    CASE
        WHEN rating < 1 THEN '0'
        WHEN rating BETWEEN 1 AND 1.99 THEN '1'
        WHEN rating BETWEEN 2 AND 2.99 THEN '2'
        WHEN rating BETWEEN 3 AND 3.99 THEN '3'
        WHEN rating BETWEEN 4 AND 4.99 THEN '4'
        ELSE '5'
    END AS Simple_Rating,
    COUNT(group_name) AS group_count
FROM
    grp
GROUP BY Simple_Rating
ORDER BY Simple_Rating DESC;

/*
This query transforms the rating for each group into a simple rating of 5 star, 4 star, 3 star, 2 star, 
1 star or 0 (if no rating), then provides a count of the number of groups in each simple rating.
Results are:
5- 745
4- 1964
3- 61
2- 10
1- 12
0- 1548

Is this a reliable measure of group popularity?
- There are 4340 total groups on LetsMeet
- 36% (1548) of the total groups (4340) have no rating (approximately 1/3rd)
- 2792 of the 4340 groups were rated
- Of the 2792 groups that were rated, 745 were rated as 5 star (approximately 27%)
Based on this, I would say that the rating is a good indicator of group popularity. 
*/

SELECT 
    COUNT(*)
FROM
    grp;
/*  
This query was used to detemine the total number of groups on LetsMeet.
There are 4340 total groups.  
*/

-- Step 2 (listed twice in project instructions)
SELECT 
    group_name, 
    rating, 
    members
FROM
    grp
WHERE
    rating = 5
ORDER BY members DESC;

/*
This query selects all groups with a rating of 5 and includes the members, then puts them
in order from those with the most members to least members.
All 745 goups with a rating of 5 are rank ordered by the number of members from highest to 
lowest. 
*/

-- Step 3
SELECT 
    city,
    group_name, 
    rating, 
    members
FROM
    grp
JOIN city ON grp.city_id = city.city_id
WHERE
    rating = 5
ORDER BY members DESC;

/* This query adds the city for each group.
The city and grp tables are JOINed to accomplish this.
All 745 goups with a rating of 5 are still rank ordered by the number of members from highest to 
lowest.
*/

SELECT 
    city,
    group_name,
    category_name,
    rating, 
    members
FROM
    grp
JOIN city ON grp.city_id = city.city_id
JOIN category ON grp.category_id = category.category_id
WHERE
    rating = 5
ORDER BY members DESC;

/* This query adds the category and city for each group.
2 JOINs are needed: The city and grp tables and the category and grp tables.
All 745 goups with a rating of 5 are still rank ordered by the number of members from highest to 
lowest, but now provide the city and category information to help make a recommendation that meets
the conditions given.
*/