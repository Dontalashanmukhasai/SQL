use company;
insert into branch values(4,'buffalo',null,null);
#JOINS:
select employee.emp_id,employee.first_name,branch.branch_name
from employee
join branch
on employee.emp_id = branch.mgr_id;

#Left JOIN:
select employee.emp_id,employee.first_name,branch.branch_name
from employee
left join branch
on employee.emp_id = branch.mgr_id;

#Right Join:
select employee.emp_id,employee.first_name,branch.branch_name
from employee
right join branch
on employee.emp_id = branch.mgr_id;
