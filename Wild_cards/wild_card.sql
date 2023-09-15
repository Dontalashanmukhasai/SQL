#Wild card:
use company;
#find any client who are on LEC:
select * from client
where client_name LIKE '%LEC';

#Find any branch suppliers who are in Lables Business:
select * from branch_supplier
where supplier_name LIKE '% Lables%';

#fnd any employee who born in october:
select * from employee
where birth_date LIKE '____-10%';

#find any clients who are school:
select * from client
where client_name LIKE '%school';

#UNION:
#Select list of employees and branch names:
select first_name from employee
union
select branch_name from branch;

#we can change the column name aswell:
select first_name as company_name
from employee
union
select branch_name from branch;

#UNION can work on the same datatype and the columns should equal or should be same number of columns:
select client_name , branch_id from client 
union
select branch_name ,  branch_id from branch
