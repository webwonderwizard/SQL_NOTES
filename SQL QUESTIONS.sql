create database ORG;
show databases;
use ORG;

create table Worker (
	WORKER_ID int not null primary key auto_increment,
    FIRST_NAME varchar(25),
    LAST_NAME varchar(25),
    SALARY int(15),
    JOINING_DATE datetime,
    DEPARTMENT char(25)
);

INSERT INTO Worker
	(WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) values
		(001, 'Monika', 'Arora', 100000, '14-02-22 08.00.00', 'HR'),
        (002, 'Atharva', 'Kothekar', 80000, '14-02-22 08.00.00', 'IT'),
        (003, 'Prathmesh', 'Shukla', 90000, '14-02-22 08.00.00', 'IT'),
        (004, 'Pranav', 'Soni', 70000, '14-02-22 08.00.00', 'IT'),
        (005, 'Vishal', 'Singh', 100000, '14-02-22 08.00.00', 'Admin'),
        (006, 'Sujal', 'Vajire', 90000, '14-02-22 08.00.00', 'Account'),
        (007, 'Vedang', 'Gaur', 100000, '14-02-22 08.00.00', 'Account'),
        (008, 'Karan', 'Aggarwal', 600000, '14-02-22 08.00.00', 'Admin');
    
select * from worker;

create table Bonus (
WORKER_REF_ID INT,
BONUS_AMOUNT int(10),
BONUS_DATE datetime,
foreign key (WORKER_REF_ID)
	references Worker(WORKER_ID)
    ON DELETE CASCADE
);

insert into Bonus 
	(WORKER_REF_ID,BONUS_AMOUNT,BONUS_DATE) values
		(001, 5000, '16-02-23'),
        (002, 3000, '16-02-23'),
        (003, 4000, '16-02-23'),
        (001, 5500, '17-02-23'),
        (002, 7000, '17-02-23');
        
create table Title (
WORKER_REF_ID INT,
WORKER_TITLE char(25),
AFFECTED_FROM datetime,
foreign key (WORKER_REF_ID)
	references Worker(WORKER_ID)
    ON DELETE CASCADE
);

drop table Title;

insert into Title 
	(WORKER_REF_ID,WORKER_TITLE,AFFECTED_FROM) values
		(001, 'Manager', '16-02-23 00:00:00'),
        (002, 'Executive', '16-02-23 00:00:00'),
        (008, 'Executive', '16-02-23 00:00:00'),
        (005, 'Asst. Manager', '17-02-23 00:00:00'),
        (004, 'Executive', '17-02-23 00:00:00'),
        (007, 'Lead', '17-02-23 00:00:00'),
        (006, 'Lead', '17-02-23 00:00:00'),
        (003, 'Lead', '17-02-23 00:00:00');
        
-- Questions

-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
select FIRST_NAME as WORKER_NAME from worker ;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select ucase(first_name) from worker;
select upper(first_name) from worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct department from worker;
select department from worker group by department;

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
select substr(first_name, 1, 3)  from worker;

-- Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Sujal’ from Worker table.
select instr(first_name, 'a') from worker where FIRST_NAME = "Sujal";
select position('a' in first_name) from worker where FIRST_NAME = "Sujal";

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
select rtrim(first_name) from worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
select ltrim(first_name) from worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
-- select department, count(DEPARTMENT) as length from worker group by department;
select department, length(department) from worker; 

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
select replace(first_name, 'a', 'A') from worker;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.
select concat(first_name,' ',last_name) COMPLETE_NAME from worker; 

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from worker order by FIRST_NAME;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.
select * from worker order by FIRST_NAME, DEPARTMENT desc;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select * from worker where first_name = "Sujal" or first_name= "Vedang";
select  * from worker where first_name in ("Sujal", "Vedang");

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select  * from worker where first_name not in ("Sujal", "Vedang");

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
select * from worker where department like "Admin%";

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from worker where first_name like "%a%";

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from worker where first_name like "%a";

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘l’ and contains 5 alphabets.
select * from worker where first_name like "____l";

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from worker where salary between 100000 and 500000;


-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
select * from worker where year(joining_date) = 2014 and month(joining_date) = 02;


-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select department, count(department) from worker where department = "Admin";


-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
select concat(first_name,' ',last_name) Full_name, SALARY from worker where salary between 50000 AND 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT 	department, count(*) from worker group by department order by count(*) desc;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
select * from worker as w
Inner join title as t
on w.worker_id = t.worker_ref_id where worker_title = "Manager";

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
select worker_title, count(*) from title group by worker_title having count(*) > 1;


-- Q-26. Write an SQL query to show only odd rows from a table.
select * from worker where mod(worker_id, 2) != 0;
 
-- Q-27. Write an SQL query to show only even rows from a table. 
select * from worker where mod(worker_id, 2) = 0;

-- Q-28. Write an SQL query to clone a new table from another table.
create table worker_clone like worker;
insert into worker_clone select * from worker;

-- Q-29. Write an SQL query to fetch intersecting records of two tables.
select * from worker inner join worker_clone using(worker_id);


-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- MINUS
select * from worker left join worker_clone using(worker_id) where worker_clone.worker_id is null;


-- Q-31. Write an SQL query to show the current date and time.
-- DUAL
select curdate();
select now();

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
select * from worker order by salary desc limit 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select * from worker order by salary desc limit 4,1;


-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
select * from worker w1
where 5 = (
	select count(distinct (w2.salary)) from worker w2 where w2.salary >= w1.salary
);

 
-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
select w1.* from worker w1, worker w2 where w1.salary = w2.salary and w1.worker_id != w2.worker_id;

-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
select max(salary) from worker
where salary not in (select max(salary) from worker);

-- Q-37. Write an SQL query to show one row twice in results from a table.
select * from worker
UNION ALL
select * from worker order by worker_id;

-- Q-38. Write an SQL query to list worker_id who does not get bonus.
select * from worker w left join bonus b on w.worker_id = b.worker_ref_id where  b.worker_ref_id is null;
select * from worker where worker_id not in (select worker_ref_id from bonus);

-- Q-39. Write an SQL query to fetch the first 50% records from a table.
select * from worker where worker_id <= (select count(worker_id)/2 from worker);
select * from worker group by worker_id having worker_id <= 4; -- DOUBT

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
select department from worker group by department having count(department) < 4;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.
select department, count(department) from worker group by department;

-- Q-42. Write an SQL query to show the last record from a table.
select * from worker where worker_id = (select max(worker_id) from worker);

-- Q-43. Write an SQL query to fetch the first row of a table.
select * from worker where worker_id = (select min(worker_id) from worker);

-- Q-44. Write an SQL query to fetch the last five records from a table.
(select * from worker order by worker_id desc limit 5) order by worker_id;

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
select w.first_name, w.department, w.salary from
(select max(salary) as maxsal, department from worker group by department) temp 
inner join worker w
on temp.department = w.department and temp.maxsal = w.salary;


-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery
select distinct salary from worker w1
where 3 >= (
	Select count(distinct(salary)) from worker w2 where w1.salary <= w2.salary
) order by w1.salary desc;
select distinct salary from worker order by salary desc limit 3;

-- DRY RUN AFTER REVISING THE CORELATED SUBQUERY CONCEPT FROM LEC-9.


-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery
select distinct salary from worker w1
where 3 >= (
	select count(distinct(salary)) from worker w2 where w1.salary >= w2.salary
) order by w1.salary;

-- Q-48. Write an SQL query to fetch nth max salaries from a table.
select distinct salary from worker w1
where n >= (
	Select count(distinct(salary)) from worker w2 where w1.salary <= w2.salary
) order by w1.salary desc;


-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
select department, sum(salary) as deptSal from worker group by department;

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
select first_name, salary from worker where salary = (select max(salary) from worker);











