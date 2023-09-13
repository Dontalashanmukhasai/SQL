create database company;
use company;
CREATE TABLE employee(
emp_id INT PRIMARY KEY,
first_name VARCHAR(20),
last_name VARCHAR(20),
birth_date DATE,
sex VARCHAR(1),
salary INT,
super_id INT,
branch_id INT);

CREATE TABLE branch(
branch_id INT PRIMARY KEY,
branch_name VARCHAR(40),
mgr_id INT ,
mgr_start_date DATE,
FOREIGN KEY(mgr_id) references employee(emp_id) ON DELETE SET NULL);

alter table employee
ADD FOREIGN KEY(branch_id)
references branch(branch_id) ON DELETE SET NULL;

alter table employee
ADD FOREIGN KEY(super_id)
references employee(emp_id) ON DELETE SET NULL;

create table client(
client_id INT PRIMARY KEY,
client_name VARCHAR(40),
branch_id int ,
foreign key(branch_id) references branch(branch_id) ON DELETE SET NULL);

create table works_with(
emp_id INT ,
client_id INT,
total_sales INT,
PRIMARY KEY(emp_id,client_id),
foreign key(emp_id) references employee(emp_id) ON DELETE  CASCADE,
foreign key(client_id) references client(client_id) ON DELETE CASCADE);

create table branch_supplier(
branch_id INT,
supplier_name VARCHAR(20),
supply_type VARCHAR(40),
PRIMARY KEY(branch_id,supplier_name),
foreign key(branch_id) references branch(branch_id) ON DELETE CASCADE);

INSERT INTO employee VALUES(100,'David','Wallace','1967-11-17','M',250000,NULL,NULL);
INSERT INTO branch VALUES(1,'Corporate',100,'2006-02-09');
UPDATE employee
set branch_id =1
where emp_id =100;
INSERT INTO employee VALUES(101,'Jan','Levison','1961-05-11','F',110000,100,1);
INSERT INTO employee VALUES(102,'Micheal','scott','1964-03-15','M',75000,NULL,NULL);
INSERT INTO branch VALUES(2,'Sronton',102,'1992-04-06');
UPDATE employee
set branch_id =2
where emp_id = 102;
INSERT INTO employee VALUES(103,'Angela','Martin','1971-06-25','F',63000,102,2);
INSERT INTO employee VALUES(104,'Jan','Levison','1980-02-05','F',55000,102,2);
update employee set first_name = 'Kelly'
where emp_id = 104;
update employee set last_name = 'Kapoor'
where emp_id = 104;
INSERT INTO employee VALUES(105,'Jan','Levison','1958-02-19','M',69000,102,2);
INSERT INTO employee VALUES(106,'Josh','Porter','1969-09-05','M',78000,NULL,NULL);
INSERT INTO branch VALUES(3,'Stanford',106,'1998-02-13');
UPDATE employee
set branch_id =3
where emp_id = 106;
UPDATE employee
set super_id =100
where emp_id = 106 and emp_id =102;
UPDATE employee
set super_id =100
where emp_id =102;
INSERT INTO employee VALUES(107,'Andy','Bernard','1973-07-22','M',65000,103,3);
update employee
set super_id = 106
where emp_id = 107;
INSERT INTO employee VALUES(108,'Jim','Halpert','1978-10-01','M',71000,106,3);
update employee
set super_id = 106
where emp_id = 108;
select * from employee;


INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');
select * from branch_supplier;


INSERT INTO client VALUES(400,'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'fedEx', 3);
INSERT INTO client values(403, 'John Daly Law, LEC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405,'Times Newspaper', 3);
INSERT INTO client value(406,'fedEx',2);
select * from client;

INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33800);
INSERT INTO works_with VALUES(107, 405, 26800);
INSERT INTO works_with VALUES(102, 406, 15000);
insert into works_with values(105,406,130000);
select * from works_with;


#basic queries:
select * from employee
order by salary;

#ordered by descending order:
select * from employee
order by salary desc;

#Find all employee ordered by sex and then name:
select * from employee
order by sex,first_name,last_name; 

#limit:
select * from employee
limit 5;

#find forenames and surnames of all employees from employee table:
select first_name as forename, last_name as surname 
from employee;
#find out all the genders of employees in the employee table:
select DISTINCT sex
from employee;