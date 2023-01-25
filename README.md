# LetsMeet_DataAnalysis
This is a collection of the SQL Queries that I developed while filling the role of a Data Analyst at LetsMeet, an online network for professionals and enthusiasts to meet up in real life with groups that share common interests. LetsMeet is growing rapidly and I'm the company's first data analyst serving on the Tech Team and reporting to the VP of Engineering. 

The database that I've been tasked to analyse includes the following tables:
1. grp - The core part of LetsMeet are the groups. The grp table contains information about the groups that use LetsMeet to network. The groups cover a huge range of topics such as animal rights, backgammon, kayaking, and dachshund.
2. grp_member - The grp_member table contains data on individual members. Each row lists one member and one group, so members in multiple groups appear multiple times. Most members are in the New york, Chicago, and San Francisco areas, but they come from all over the world.
3. event - Events are what the members gather for. This table contains the most columns. Included are text descriptions, waitlist information, RSVP information, URLs and more.
4. venue - This table contains data on the venues that host LetsMeet events. Standard information like latitude and longitude, along with addresses are provided. LetsMeet often gets requests about venues from group organizers.
5. category - This table contains the different categories of groups.
6. city - This table contains information about the cities where LetsMeet groups and members gather.

In this role, I was tasked to perform ad hoc analysis, provide useful insights, and write reports to questions from a variety of stakeholders within LetsMeet including the CEO, Sales, and Engineering teams. I was also tasked with improving the database structure.

The work that I've accomplished are in the following files:
sales_insights - This file includes a set of queries that I developed to answer questions from the LetsMeet Sales Team. They were interested in learning:
  - What cities have active members?
  - Are there any cities listed in the city table with no active members? If so, what states are those cities in?
  - How many groups are open, waiting for approval, and/or closed?
  - What are the 5 categories that contain the most groups?
  - What are the 5 categories that contain the least groups?
  - How many total members are there?
  - What percentage of members are located in Chicago?
  
2_additional_insights - Ad hoc analysis that includes a series of queries that uncovered insights. Queries helped determine:
  - There were no venues outside of the U.S.
  - The city with the most venues was New York. Chicago and San Francisco were 2nd and 3rd respectively.
  - The top 2 specific zip codes with the most venues were both in New York.
  - Explored the who column in the grp table and found the values provided no useful information. I made a note to discuss eliminating this column in the future.
  - Determined the Top 5 longest running groups. All started in October, 2002 and 3 of the 5 were in New York.
  - Determined the 5 members with the longest membership. The member with the olderst active membership started in April, 2003. 4 of the 5 started in 2003.
  - Determined the members who belong to the most groups. 7 members belong to 7 groups each.
  - There were no venues outside of the U.S. 
  - The rank column in the city table provides no useful information. I made a note to discuss eliminating this column.
  - Determined the number of events with the total headcount and average headcount at each event. The headcount values were 0 and didn't provide useful information. This is anothe candidate for elimination.
  - Determined the most popular venue is The Ainsworth in New York City.
  - Determined the Top 5 most popular categories.
  
blank - This file contains the code that that I developed to improve the database structure.
  - After generating an ERD of the database in MySQL Workbench, I analysed the ERD and used DESCRIBE and SELECT * FROM to look for redundant columns. 
  - Developed DDL statements to drop 14 columns from within the 6 tables that made up the database. Each of these 14 columns were redundant, had no usefull data, or served no purpose. 
  - Developed DDL statements to split the grp_member table into 2 new tables: group_sign_ups and members. Each new table used columns from the group_member table. I added Primary and Foreign Keys and then dropped the group_member table after verifying that the 2 new tables were built correctly and had all their data present.

2_toastmaster - This file contains the queries that I developed to help answer a question from the LetsMeet CEO. She wanted the total number of Toastmaster events om LetsMeet alond with a breakout of the number of Toastmaster events in each city.

3_growth - This file contains 9 queries that I developed that provide isnights into membership. I developed SQL queries to:
  - Determined the number of LetsMeet members by the year they joined. Found that the dataset is incomplete- it doesn't include data from 2018-2022. Also found that membership generally increased each year but dropped significantly during the 2 most recent years (2016 nad 2017).
  - Developed a query to determine the number of instances of each city name in the grp_member table.
  - Developed SQL statements to update cities in the surrounding area of each of the 3 major cities where LetMeet is present (New York, Chicago, San Francisco) so the value reflects the city's metropolitan area.
  - Develpoed seperate queries to determine the number of new LetsMeet members in the New York City, Chicago, and San Francisco metropolitan areas by year joined.
  - Determined the number of new LetsMeet members in 2017 by the month they joined. Discovered that he number of new members is around 1000 per month from January to October. The number of new members decline significantly in November and December, most likely due to it being the holiday season where people are spending time with family and holiday events.   

4_feature_groups - This file contains queries focused on deriving insights into LetsMeet groups:
  - Developed queries that transformed the rating values to a simple system of 5 star to 1 star (with 5 star being the highest) and a 0 in isntances where no rating was given. Also included the number of groups within each rating. Discovered that the total number of groups in LetsMeet is 4340. Of these, 1548 (36%) have no rating. Of the 2792 groups with a rating, 745 groups had a 5 star rating.
  - Developed queries that displayed all groups with a 5 start rating by the number of members in each from highest to lowest.
  - Further developed that query to include the city and category information with each in order to help the Sales Team develop a targeted marketing plan to drive increased membership.

summary_report - 
