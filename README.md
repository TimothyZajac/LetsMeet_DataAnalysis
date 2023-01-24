# LetsMeet_DataAnalysis
This is a collection of the SQL Queries that I developed for a Data Analysis project for LetsMeet, an online network for professionals and enthusiasts to meet up in real life with groups that share common interests.

File Summary:
1. sales_insights - includes a set of six queries to answer a set of questions from the LetsMeet Sales Team.
2. 2_additional_insights - Ad hoc analysis that includes a series of twelve queries that uncovered insights in each of the six tables in this database.
3. blank.sql - After generating an ERD of the database in MySQL Workbench, I analysed the ERD and used DESCRIBE and SELECT * to look for redundant columns. I then used DDL to drop 14 columns from within the six tables that made up the database. Each of these 14 columns were redundant, had no usefull data, or served no purpose. Finally, I used DDL to split the grp-member table into 2 new tables: group_sign_ups and members. Each new table used columns from the group_member table. I added Primary and Foreighn Keys and then dropped the group_member table after verifying that the 2 new tables were built correctly and had all their data present. 
