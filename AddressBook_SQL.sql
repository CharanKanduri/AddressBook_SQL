------ UC 1: Create Database ------
create database Address_Book_Service_DB
use Address_Book_Service_DB

create table Address_Book_Table
(FirstName varchar(100),
SecondName varchar(100),
Address varchar(250),
City varchar(100),
State varchar(100),
zip BigInt,
PhoneNumber BigInt,
Email varchar(200)
);

------ UC 3: Insert Values to Table ------
Insert into Address_Book_Table(FirstName,SecondName,Address,City,State,zip,PhoneNumber,Email) 
values('Harsha','Vargheese','645 Catherine Street','Bangalore','Karnataka',243001,9842905050,'harsha@gmail.com'),
('Rujula','Mathialagan','836 Heritage Rd','Chennai','Tamil Nadu',134002,98402000,'Rujula@gmail.com'),
('Anita','Yadav','19 Augusta Avenue','Lucknow','Uttar Pradesh',113201,87210505053,'anita@gmail.com'),
('Pramela','Satesh','356 Newburgh','Bangalore','Karnataka',243001,9842905050,'Pramela@gmail.com');
select * from Address_Book_Table

------ UC 4: Ability to Edit Contact Person Based on their Name ------
--Edit Email based on Name--
Update Address_Book_Table
set Email='AnitaYadav@gmail.com'
where FirstName='Anita'

EXEC Sp_rename 'Address_Book_Table.SecondName', 'LastName', 'COLUMN'
Update Address_Book_Table
set Address='836 Heritage Road'
where FirstName='Rujula' and LastName='Mathialagan';

delete 
from Address_Book_Table
where FirstName='Rujula' and LastName='Mathialagan';

select * from Address_Book_Table;

select * 
from Address_Book_Table
where City='Bangalore' or State='Karnataka'

------ UC 7: Ability to Retrieve Count of Person belonging to a City or State ------

select Count(*) as count ,state,City
from Address_Book_Table
Group by state,City

------ UC 8: Ability to retrieve entries sorted alphabetically ------

select *
from Address_Book_Table
where City='Bangalore'
order by(FirstName)
