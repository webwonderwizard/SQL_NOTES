-- Q) Difference between SUBSTRING and substr
-- SUBSTR : This function returns a portion of a string from a given start point to an end point. 
-- If a substring length is not given, then SUBSTR returns all the characters till the end of string (from the starting position specified).

-- SUBSTRING function accepts three-parameter like String, start, length

-- ASG - RANK SQL
use company;
Create table employee(
name varchar(255),
salary int
);

Create table employee1(
id int,
salary int
);

insert into employee values ("A",30000),("B",30000),("C",25000);
insert into employee1 values (1,30000),(2,30000),(3,25000);
insert into employee1 values (4,10000),(5,10000),(6,10000);
insert into employee1 values (7,8000),(8,8000),(9,7000),(10,8000);
select e1.id, e1.salary from employee1 e join employee1 e1 on e.salary=e1.salary;
select e1.salary from employee1 e join employee1 e1 on e.salary=e1.salary where( e.id<e1.id and abs(e.id-e1.id)=1); = 
(select e1.salary from employee1 e join employee1 e1 on e.id=e1.id where e.salary=e.salary and abs(e.id-e1.id)>1);
select e1.id from employee1 e join employee1 e1 on e.id=e1.id where e.salary=e1.salary and abs(e.id-e1.id)=1;

select * from employee1 order by id;


select e1.salary from employee1 e join employee1 e1 on e.id = e1.id + 1 and e.salary = e1.salary join employee1 e3 on e.id = e3.id + 2 and e.salary = e3.salary;

-- TASK TO APPLY to find 4 consecutive salary entries.
insert into employee1 values (11,8999),(12,8999),(13,8999),(14,8999);
select e1.salary from employee1 e join employee1 e1 on e.id = e1.id + 1 and e.salary = e1.salary 
join employee1 e2 on e.id = e2.id + 2 and e.salary = e2.salary
join employee1 e3 on e.id = e3.id + 3 and e.salary = e3.salary;

use temp;
CREATE TABLE rank_demo (  
    first_name VARCHAR(60),  
    last_name VARCHAR(40),  
    city VARCHAR(30)  
);

INSERT INTO rank_demo (first_name, last_name, city)         
VALUES ('Luisa', 'Evans', 'Texas'),         
('Paul', 'Ward', 'Alaska'),         
('Peter', 'Bennett', 'California'),      
('Carlos', 'Patterson', 'New York'),         
('Rose', 'Huges', 'Florida'),    
('Marielia', 'Simmons', 'Texas'),  
('Antonio', 'Butler', 'New York'),         
('Diego', 'Cox', 'California');

SELECT first_name, last_name, city,   
RANK () OVER (ORDER BY city) AS Rank_No   
FROM rank_demo;    

SELECT first_name, last_name, city,   
RANK () OVER (PARTITION BY city ORDER BY first_name) AS Rank_No   
FROM rank_demo; -- 1,2,2,4

SELECT first_name, last_name, city,   
ROW_NUMBER() OVER(ORDER BY city) AS my_rank   
FROM rank_demo;  -- 1,2,3,4

SELECT first_name, last_name, city,   
DENSE_RANK() OVER(ORDER BY city) AS my_rank   
FROM rank_demo;     -- 1,2,2,3

create table EmpDup(empid int,name varchar(20));
insert into EmpDup values(1,'Tushar'),
     (1,'Tushar'),
    (2,'Chris'),
    (3,'Bill'),
    (3,'Bill'),
    (3,'Bill');
    
alter table EmpDup add sno int unique not null auto_increment;
select *,
    RANK() OVER ( PARTITION BY empid,name ORDER BY sno ) as ranking
    From EmpDup;
select * from (select *,
    RANK() OVER ( PARTITION BY empid,name ORDER BY sno ) as ranking
    From EmpDup) as a where ranking > 1;

select * from EmpDup E 
inner join (select *,
    RANK() OVER ( PARTITION BY empid,name ORDER BY sno ) as ranking
    From EmpDup) as a on E.sno = a.sno
    where a.ranking > 1;
    
delete E from EmpDup E 
inner join (select *,
    RANK() OVER ( PARTITION BY empid,name ORDER BY sno ) as ranking
    From EmpDup) as a on E.sno = a.sno
    where a.ranking > 1;
    
select * from EmpDup;

alter table EmpDup 
drop  column sno;