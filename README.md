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
