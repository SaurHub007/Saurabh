show databases;
create database a325;
show databases;
use a325;
create table student_info(
roll_no tinyint,
attendance bit,
pocket_money smallint);
show tables;
describe student_info;
/* RDBMS is a data management tool. In RDBMS, the data is organized and stored in tables, which we call relations. 
   These tables are linked together to define relationships through primary and foreign keys. 
   The primary key uniquely identifies each record in a table, 
   while the foreign key in one table references a primary key in another table,creating a link between them. 
   The ACID properties of Atomicity, 
Consistency, Isolation, and Durability guarantee the reliability and integrity of DB transactions. 
These properties ensure that DB operations are processed accurately, consistently, and without interference, even in the face of errors and failures.
1)Atomacity : ensures that a transaction is completed in full or not at all, meaning all changes are committed or none are, 
              maintaining database integrity
2)Consistency: ensures that a transaction takes the database from one valid state to another, 
			   maintaining all predefined rules, constraints, and data integrity.
3)Isolation :  ensures that transactions are executed independently of each other. 
               Even if multiple transactions are happening simultaneously, each transaction is isolated from others until it is completed, 
               preventing interference or data inconsistency.
4)Durability : ensures that once a transaction is committed, its changes are permanent, even in the event of a system crash or failure. 
			  The data will not be lost and will persist in the database after the transaction has been completed.  
	
SQL Commands
DDL : DDL (Data Definition Language) is a set of SQL commands used to define, modify, and manage database structures, such as tables, schemas, and indexes. Examples include
      Create:Used to create a new database object, like a table or view.
      Drop:Used to delete a database object, like a table, view, or index
      Alter:Used to modify an existing database object, such as adding, deleting, or modifying columns in a table.
      truncate:Used to remove all records from a table, but keeps the structure intact. Unlike DELETE, it cannot be rolled back.
      rename:Used to change the name of a database object, like a table.
DML : DML (Data Manipulation Language) is used to manage and manipulate data within database tables, including commands like
      insert: Used to add new records (rows) into a table.
      update: Used to modify existing records in a table.
      delete:Used to remove records from a table.
DQL : DQL (Data Query Language) is used to query and retrieve data from a database, with the primary command being 
      SELECT:Used to retrieve data from one or more tables in the database. 
			It allows you to specify columns and apply filters (using WHERE) to get specific results.
		 
*/
insert into student_info value(1,1,1000);
select * from student_info;
insert into student_info value(255,2,32767),
(256,2,32768),
(123456,222222234567,76543223456);



CREATE TABLE Product (
    id INT,
    Phone_number BIGINT,
    Price DECIMAL(10, 2)
);
show tables;
describe product;
INSERT INTO Product (id, Phone_number, Price)
VALUES (1, 9823442245, 199.99),
       (2, 9823442246, 299.99),
       (3, 9823442247, 399.99);
describe product;
select * from product;

CREATE TABLE fp (
    id float,
    re real);
INSERT INTO fp (id, re)
VALUES (1.23, 4.56),
       (7.89, 10.11),
       (12.34, 56.78);
select * from fp;



/*16-04-2025*/
show tables;
CREATE TABLE Employee1 (
    ID INT ,
    Salary INT ,
    Work_hours DECIMAL(2, 1)
);
show tables;

INSERT INTO Employee1 (ID, Salary, Work_hours) VALUES
(1, 20000, 2.9),
(2, 60000, 4.6),
(3, 50000, 7.8),
(4, 30000, 3.2);
select * from Employee1;

create table dt(
dt date,
ti time,
dt_ti datetime);
insert into dt (dt , ti , dt_ti) values
('2025,04,16',
'09-48:48',
'2025-04-16 09:48:48');
select * from dt;
 
 CREATE TABLE student_demo (
    roll INT,
    subject VARCHAR(20),
    address VARCHAR(20),
    marks INT
);
INSERT INTO student_demo (roll, subject, address, marks) VALUES
(1, 'python', 'Pune', 56),
(2, 'Java', 'Mumbai', 95),
(3, 'HTML', 'Nashik', 85),
(4, 'C', 'Pune', 56),
(5, 'Django', 'Andheri', 99),
(6,'JS','Banglore',85),
(8, NULL, 'Pune', NULL);
select * from student_demo;
insert into student_demo(roll,address) value (9,'delhi'),(10,'mumbai');
select*from student_demo;
INSERT INTO student_demo (roll, subject, address, marks) VALUES
(11,'Django','Andheri', 78),
(12,'js','Banglore',45),
(13,'Python','Andheri',16),
(14,'Python','Pune',96);
select roll,address from student_demo;
select * from student_demo where roll=5;
select subject,marks from student_demo where roll=6;
select roll,marks from student_demo where marks<90;


/*17-04-2025*/
SELECT * FROM student_demo
WHERE marks BETWEEN 50 AND 90;
select roll,marks from student_demo where marks<=90 and marks>=50;

#case
select roll,
case  when marks>=75 and marks<=100 then "Very good"
      when marks>=60 and marks<=74 then " good" 	
      when marks>=35 and marks<=59 then " ok"
	else"fail"
end Result #aliasing
from student_demo;

SELECT * FROM student_demo
WHERE roll = 1 or roll = 2;
SELECT * FROM student_demo
where roll not in (1,2);
SELECT * FROM student_demo
WHERE roll <> 1 AND roll <> 2;
select distinct address from student_demo;

SELECT DISTINCT address
FROM student_demo
WHERE address LIKE '%i';

select distinct address from student_demo where address like "%i";
select distinct address from student_demo where address like "_u%";
select distinct address from student_demo where address like "m%";
select distinct address from student_demo where address like "____i";
select distinct address from student_demo where address not like "____i";
SELECT roll ,marks FROM student_demo;
SELECT roll, marks FROM student_demo
ORDER BY marks DESC LIMIT 5;

SELECT roll, marks FROM student_demo
where marks is null ;
SELECT roll, marks FROM student_demo
where marks is not null ;
SELECT roll, marks FROM student_demo
order by marks desc limit 1,2;
/* Constraints SQL mein rules hote hain jo table ke columns par lagaye jaate hain, taaki data sahi, valid aur consistent rahe.
NOT NULL:Column me NULL value allowed nahi hoti.
Ex. Name VARCHAR(100) NOT NULL

UNIQUE :Column ke saare values unique (alag) hone chahiye.
ex. Email VARCHAR(100) UNIQUE

PRIMARY KEY:Row ko uniquely identify karta hai. Ek table me sirf 1 primary key hoti hai.
ex.ID INT PRIMARY KEY

FOREIGN KEY:Ek table ke column ko dusre table ke primary key se link karta hai.Referential integrity maintain karta hai.
ex. UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(ID)
    
CHECK:Column me jo data aaye, us par condition lagata hai.    
ex. CHECK (Age >= 18)
    
DEFAULT:Agar koi value insert nahi ki gayi to default value assign hoti hai.
ex. CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP

 Bonus: 
 Constraints add/remove kaise karte hain?
 ALTER TABLE Students ADD CONSTRAINT chk_age CHECK (Age >= 18);

❌ Remove constraint
ALTER TABLE Students DROP CONSTRAINT chk_age;
*/
