#DML COMMANDS
use mysql;

CREATE TABLE STUDENT1( 
student_id INT,
name VARCHAR(20),
major VARCHAR(20),
PRIMARY KEY(student_id)
);

INSERT INTO STUDENT1 values(1,"JACK","BIOLOGY");
INSERT INTO STUDENT1 values(2,"KATE","PHYSICS");
INSERT INTO STUDENT1 values(3,"CLAIRE","ENGLISH");
INSERT INTO STUDENT1 values(4,"JACK","HINDI");
INSERT INTO STUDENT1 values(5,"JACK","SOCIAL");
INSERT INTO STUDENT1 values(6,"MIKE","COMP.SCIENCE");

DESCRIBE STUDENT1;
SELECT * FROM STUDENT1;

update STUDENT1 SET name ="queen",major ="computer" where student_id = 4;
delete from STUDENT1 where student_id = 5;