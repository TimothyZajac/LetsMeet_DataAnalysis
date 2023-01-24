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
1. sales_insights - includes a set of six queries to answer a set of questions from the LetsMeet Sales Team.
2. 2_additional_insights - Ad hoc analysis that includes a series of twelve queries that uncovered insights in each of the six tables in this database.
3. blank - After generating an ERD of the database in MySQL Workbench, I analysed the ERD and used DESCRIBE and SELECT * FROM to look for redundant columns. I then used DDL to drop 14 columns from within the six tables that made up the database. Each of these 14 columns were redundant, had no usefull data, or served no purpose. Finally, I used DDL to split the grp_member table into 2 new tables: group_sign_ups and members. Each new table used columns from the group_member table. I added Primary and Foreign Keys and then dropped the group_member table after verifying that the 2 new tables were built correctly and had all their data present.
4.
5.
6.
7.



