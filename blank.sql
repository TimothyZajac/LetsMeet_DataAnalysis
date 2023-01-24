-- Step 1: Find Redundant Columns
DESCRIBE venue_;

SELECT 
    *
FROM
    venue_;
    
DESCRIBE grp;

SELECT 
    *
FROM
    grp;
    
DESCRIBE city;

SELECT 
    *
FROM
    city;

DESCRIBE event;

SELECT 
    *
FROM
    event;
    
DESCRIBE category;

SELECT 
    *
FROM
    category;
    
DESCRIBE grp_member;

SELECT 
    *
FROM
    grp_member;
    
/* In addition to generating the ERD, I ran the queries above to better understand 
each table and to evaluate the columns in each table for redundancy and whether the
information is relevant or provides value. */

-- Step 2: Eliminate Redundant Columns
ALTER TABLE venue_
DROP COLUMN address_2;
/* I'm removing the address_2 column because it is redundant and seems to be a duplicate
of the address_1 column. This column also appears to have no value. All values are 
"NULL" */

ALTER TABLE venue_
DROP COLUMN country;
/* I'm removing the country column because this column is also in the city table. Also, 
it isn't clear to me what purpose this column serves since LetsMeet operates in the US
only. */

ALTER TABLE venue_
DROP COLUMN localized_country_name;
/* I'm removing the localized_country_name column because this column is also in the city 
table. Also, it isn't clear to me what purpose this column serves since LetsMeet operates 
in the US only. */

ALTER TABLE venue_
DROP COLUMN distance;
/* I'm removing the distance column because it is redundant- it is also in the city table.
It also isn't clear to me what purpose this column serves in the table. It's not clear 
what distance refers to exactly. */

ALTER TABLE city
DROP COLUMN country;
/* I'm removing the country column because it isn't clear to me what purpose this column 
serves since LetsMeet operates in the US only. This column adds no value to the table. */

ALTER TABLE city
DROP COLUMN localized_country_name;
/* I'm removing the localized_country_name column because it isn't clear to me what purpose 
this column serves since LetsMeet operates in the US only. This column adds no value to the 
table. */

ALTER TABLE city
DROP COLUMN distance;
/* I'm removing the distance column because it isn't clear to me what purpose this column 
serves in the table. It's not clear what distance refers to exactly. */

ALTER TABLE event
DROP COLUMN headcount;
/* I'm removing the headcount column because it doesn't seem to have a purpose in the 
table. All values are "0" for this column. */

ALTER TABLE event
DROP COLUMN maybe_rsvp_count;
/* I'm removing the maybe_rsvp_count column because it doesn't seem to have a purpose in the 
table. All values are "0" for this column. */

ALTER TABLE event
DROP COLUMN utc_offset;
/* I'm removing the utc_offset column because it appears to be redundant. There is already a
column called event time in this table. UTC is Coordinated Universal Time and is the basis 
for all time zones. This column doesn't seem necessary since events should simply use the 
local time for the three cities that LetsMeet currently operates in and where events are 
held. */

ALTER TABLE event
DROP COLUMN why;
/* I'm removing the why column because it doesn't seem to have a purpose in the 
table. All values are "not-found" for this column. */

ALTER TABLE category
DROP COLUMN shortname;
/* I'm removing the shortname column because it is redundant. It's a simple variation of 
the category_name column, which should be sufficient. */

ALTER TABLE category
DROP COLUMN sort_name;
/* I'm removing the sort_name column because it is redundant. It's another simple variation 
of the category_name column, which should be sufficient. */

ALTER TABLE grp_member
DROP COLUMN country;
/* I'm removing the country column because it isn't clear to me what purpose this column 
serves since LetsMeet operates in the US only. This column adds no value to the table. */

-- Step 3: Split grp_member Table

-- A. Create group_sign_ups table
CREATE TABLE group_sign_ups
SELECT DISTINCT 
	group_id, 
	member_id, 
    joined 
FROM grp_member; 

SELECT 
    *
FROM
    group_sign_ups;
    
/* The CREATE TABLE query created the new group_sign_ups table from the 
existing grp_member table. This new table contains information on the groups 
that members are a part of. I used the SELECT * query to verify the table was 
created with the correct columns. */

-- B. Create members table
CREATE TABLE members
SELECT DISTINCT 
	member_id,
    member_name,
    city,
    hometown,
    member_status
FROM grp_member;

SELECT
	*
FROM members;

/* The CREATE TABLE query created the new members table from the 
existing grp_member table. This new table contains information on LetsMeet
members. I used the SELECT * query to verify the table was created with the 
correct columns. */

-- C. Add Primary Key to members table
ALTER TABLE members
ADD PRIMARY KEY (member_id);

DESCRIBE members;

/* This query modifies the new members table to add member_id as 
the Promary Key. I used the DESCRIBE command to verify that it was
added. */

-- D. Add Foreign Key to group_sign_ups table that references the members table
ALTER TABLE group_sign_ups
ADD FOREIGN KEY (member_id)
	REFERENCES members (member_id);

DESCRIBE group_sign_ups;

/* This query modifies the group_sign_ups table to add member_id as 
a Foreign Key that references member_id column in the members table. 
I used the DESCRIBE command to verify that it was added. */

-- D. Add Foreign Key to the group_sign_ups table that references the grp table
ALTER TABLE group_sign_ups
ADD FOREIGN KEY (group_id)
	REFERENCES grp (group_id);

DESCRIBE group_sign_ups;

/* This query modifies the group_sign_ups table to add group_id as 
a Foreign Key that references the group_id column in the grp table. 
I used the DESCRIBE command to verify that it was added. */

-- E. Drop the grp_member table
DROP TABLE grp_member;

/* This query dropped the grp_member now that its been split into two
new tables- members and group_sign_ups. */

