# Aggregation Functions:
use company;
#find the number of employees in the company:

# BY USING COUNT FUNCTION:
select count(emp_id) from employee;

#find the  female employee born after 1970:
select * from employee
where sex ='F' and birth_date>1970;

# find  average of all employees salaries:
#AVERAGE FUNCTUION:
select avg(salary) from employee; 

#for Female employess:
select avg(salary) from employee
where sex = 'F';

#SUM FUNCTION:
#Find the sum of salaries of the employees:
SELECT SUM(salary) from employee;

#finid the number of male and female employess are there :
select count(sex),sex from employee
group by sex;

#find the total sales of each salesman:
select sum(total_sales),emp_id from works_with
group by emp_id;

select sum(total_sales),client_id from works_with
group by client_id;

#Minimum function:
select min(total_sales) from works_with;
select max(total_sales) from works_with;

