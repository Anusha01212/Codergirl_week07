### Codergirl_week07 - In-class Assignment 

# Question-01
![Store ER diagram](https://user-images.githubusercontent.com/85424403/139478154-97448e39-85d1-4e63-a18e-b60cecef104c.png)

# Question-02
1, Weird dirty data which I found was having space in front of the column names. It is hard to remember that we have to include space while running the code        sometimes. 
Resolution – We can make an alias. if we found any space we can make alias instead of opening the file and editing.for example, there is a column which is  Airdate, we can run the code like   Airdate as Airdate. 

2, Other dirty data I found is duplicate rows and columns, it is hard to find the original data. 
Resolution – We can use unique() method and we also have for loop where we can write code using for loop and remove duplicates 

3, Other dirty data is not having all the rows filled, some data might contain empty space for a specific column and for a specific row. For example, data set of    students might not be fully filled, students might leave some columns empty which are not applicable to them. 
Resolution – We have drop method which is used to drop the empty columns.  

4, Dirty data is not having a proper format for the data. For example, all the CSV files should have comma to separate each column. It is hard to find where the column starts and end if there is no format for the data.  
Resolution – We can use lot of methods from python one of them is split() method which helps us to split the columns with delimiter. 

5, Other dirty data is not having a proper date format. Basic python date format is year-month-date.but some files might miss the date format which is becomes hard to pull the data. 
Resolution – In python we have datetime module which helps us to convert the date to basic format or it helps us to work with dates in any format. 

# Question-03
From the project API's i took financial/stock Api  
IEX stock/financial API- https://iexcloud.io/docs/api/
Quandl stock/financial API - https://www.quandl.com/tools/api
API i collected from google is covid API, it has covid data till may2021.
Covid API - https://api.covidtracking.com



# DATACAMP JOINING DATA 

<img width="932" alt="Joining Data" src="https://user-images.githubusercontent.com/85424403/140399735-de8eb805-1f4a-474b-a486-f955978afc54.png">

# Autoincrementing

AUTOINCREMENT keyword imposes extra CPU, memory, disk space, and disk overhead. it is said that it should be avoided if not strictly needed. It is usually not needed.
In SQL a column with type INTEGER PRIMARY KEY is an alias for the ROWID (except in WITHOUT ROWID tables) which is always a 64-bit signed integer.
On an INSERT, if the ROWID or INTEGER PRIMARY KEY column is not explicitly given a value, then it will be filled automatically with an unused integer, usually one more than the largest ROWID currently in use. This is true regardless of whether or not the AUTOINCREMENT keyword is used.
If the AUTOINCREMENT keyword appears after INTEGER PRIMARY KEY, that changes the automatic ROWID assignment algorithm to prevent the reuse of ROWIDs over the lifetime of the database. In other words, the purpose of AUTOINCREMENT is to prevent the reuse of ROWIDs from previously deleted rows.
# join and a subquery
Join adds the table to another table and we have various types of join menthos to join the table where as subquery is like writing a query within the query 
it helps us to perform various calculations. we can have join in the subquery but it is not possible to add subquery while joining the table. joining  helps us to add data and perform querys and it gives us the accurate data while writing the query. subquery is logical and helps us decrease the query size.

