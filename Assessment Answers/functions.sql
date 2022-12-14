create database Sql_Training;
show databases;
use sql_training;
CREATE TABLE EMPLOYEE (
  empno int,
  ename varchar(20),
  job varchar(20),
  manager int,
  hiredate varchar(10),
  salary float,
  commission float,
  deptno int
);

insert into EMPLOYEE(empno,ename,job,manager,hiredate,salary,commission,deptno)values
(8369,"Smith","CLERK",8902,"1990-12-18",800.00,null,20),
(8499,"Anya","SALESMAN",8698,"1991-02-20",1600.00,300.00,30),
(8521,"Seth","SALESMAN",8998,"1991-02-22",1250.00,500.00,30),
(8366,"Mahadevan","MANAGER",8839,"1991-04-02",2985.00,null,20),
(8654,"Momin","SALESMAN",8698,"1991-09-28",1250.00,1400.00,30),
(8698,"Bina","MANAGER",8839,"1991-05-01",2850.00,null,30),
(8882,"Shiavnsh","MANAGER",8839,"1991-06-09",2450.00,null,30),
(8888,"Scott","ANALYST",8566,"1992-12-09",2850.00,null,30),
(8839,"Amir","PRESIDENT",null,"1991-1-18",5000.00,null,10),
(8844,"Kuldeep","SALESMAN",8698,"1991-09-08",1500.00,0.00,30),
(8886,"Anoop","CLERK",8888,"1993-01-12",1100.00,null,20),
(8100,"Yash","ANALYST",null,"2003-05-03",6000.00,null,20),
(8900,"Jatin","CLERK",8698,"1991-12-03",950.00,null,30),
(8902,"Fakir","ANALYST",8566,"1991-12-03",3500.00,null,20);

select * from EMPLOYEE;

insert into EMPLOYEE(empno,ename,job,manager,hiredate,salary,commission,deptno)values(8088,"Ramesh","CLERK",8789,"2022-08-08",4500.00,null,10);
select * from EMPLOYEE;

Delimiter $
create function empl()
returns varchar(1000)
deterministic
begin
select * from employee;
end $

call empl();

Delimiter $
create function HelloWorld()
returns varchar(50)
deterministic
begin
return"Hello world from user" ;
end $
delimiter ;
select Helloworld() as "message";

Delimiter $
create function counts()
returns int
deterministic
begin
declare count int;
select count(*) from Employee into count;
return count;
end $
delimiter ;
select counts();

Delimiter $
create function search()
returns varchar(200)
deterministic
begin
declare result int;
select * from Employee where deptno="30" into result;
return result;
end $
delimiter ;
select * from search();


DELIMITER $
CREATE FUNCTION EMPLOYEEVALUES(EMPNO INT, ENAME VARCHAR(20), JOB VARCHAR(20), MANAGER INT, HIREDATE VARCHAR(15), SALARY INT, COMMISSION INT, DEPTNO INT)
RETURNS VARCHAR(60)
DETERMINISTIC
BEGIN
RETURN (EMPNO, 'ENAME', 'JOB', MANAGER, 'HIREDATE', SALARY, COMMISSION, DEPTNO);
END $
DELIMITER ;
SELECT EMPLOYEEVALUES(8088, 'RAMESH', 'CLERK', 8789, '2022-08-09', 4500.00, NULL, 10);
