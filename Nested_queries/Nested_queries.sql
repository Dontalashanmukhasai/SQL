use company;
#NESTED QUERIES:
#Find the names of all the employees who have sold over 30000 to a single client:
select employee.first_name, employee.last_name from employee
where employee.emp_id in (
		select works_with.emp_id from works_with
		where works_with.total_sales>30000
);

#find all the clients who are all handled by branchthat micheal scott manages :

select client.client_name from client
where client.branch_id in( 
	select branch.branch_id from branch
	where branch.mgr_id = 102
);