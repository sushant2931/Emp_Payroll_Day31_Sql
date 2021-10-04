*****UC1*****

 create database payroll_service;  //Create database name payroll_service

show databases;                    // show databases


 use payroll_service;              // go to database created

*****UC2*****
 create table employee_payroll (          // create table
    -> id INT unsigned NOT NULL AUTO_INCREMENT,
    -> name VARCHAR(150) NOT NULL,
    -> salary Double NOT NULL,
    -> start DATE NOT NULL,
    -> PRIMARY KEY (id)
    -> );


mysql> DESCRIBE employee_payroll;     // learn data type


*********UC3**********
insert into employee_payroll (name, salary, start) values  //insert into table
    -> ( 'bill',100000.00,'2018-01-03'),
    -> ('terisa',200000.00,'2019-11-13');


**********UC4********
select * from employee_payroll;         //ability to retrive the data


***********UC5**********
 select salary from employee_payroll where name='bill'; // use where clause


select * from employee_payroll where start between CAST('2018-01-01' AS DATE)AND DATE(NOW());  // find entries between given date to current date

   
************UC6************

alter table employee_payroll add gender char(1) after name;     // alter table to add row

update employee_payroll set gender = 'M' where name = 'bill';   // update query with where condition

mysql> select * from employee_payroll;


******UC7*******
 select sum(salary) from employee_payroll where gender = 'F' group by gender; // sum function
           


mysql> select gender, count(name) from employee_payroll group by gender;  // count function
   

 select * ,avg(salary) from employee_payroll; // avg salary regardless of gender



*****************UC8**************
alter table employee_payroll add phone_number varchar(250) after name; //add phone number

alter table employee_payroll add address varchar(100) DEFAULT 'TBD' after phone, //add address and give default values

alter table employee_payroll add department varchar(150) not null after address; // add department


**********UC9**********

ALTER table employee_payroll rename column salary to basic_pay,
    -> add deductions int not null after basicPay,
    -> add taxablePay int not null after deductions,
    -> add incomeTax int not null after taxablePay,
    -> add netPay int not null after incomePay;


****************UC10*********************

mysql> update employee_payroll set department='Sales' where name='terisa';

mysql> insert into employee_payroll(name,department,gender,basic_pay,deductions,taxable_pay,tax,net_pay,start) values
    -> ('terisa','Marketing','F',3000000.00,1000000.00,3000000.00,500000.00,1500000.00,'2019-11-13');

*************UC11***************
CREATE TABLE employee (
  emp_id int NOT NULL,
  name varchar(20),
  dep_name varchar(20) NOT NULL,
  gender varchar(20),
  start_date int,
  phone_no int,
  city varchar(20),
  country varchar(20),
  PRIMARY KEY (emp_id)
);
insert into employee values(1,'sneha','IT','F','2021-08-02','9892345789','dombivli','IND');

insert into employee values(2,'sakshi','Comp','F','2022-01-02','9392345789','kalyan','IND');

insert into employee values(3,'shubhangi','IT','F','2020-01-01','9992345789','dadar','IND');


CREATE TABLE company (
  cmp_id int NOT NULL,
  name_cmp varchar(20),
  PRIMARY KEY (cmp_id)
);
insert into company values('amazon',1);

insert into company values('google',2);

insert into company values('EY',3);


CREATE TABLE salary (
  emp_id int,
  basic int,
  deduction int,
  taxable int,
  tax int,
  netpay int,
  FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);
insert into salary values(1,20000,500,15000,680,16000);

CREATE TABLE department (
  dep_name varchar(20),
  emp_id int,
  FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);
insert into department values('Comp',1);
insert into department values('IT',2);


***************UC12****************
mysql>select employee.gender,sum(salary.basic_pay) from employee inner join salary on employee.payment=payroll.payment_id group by gender;

mysql>select * from
    -> from employee e,department d,address a,payroll p,company c
    -> where c.emp_id = e.emp_id
    -> and c.dept_id = d.dept_id
    -> and a.emp_id = e.emp_id
    -> and p.emp_id = e.emp_id
    -> and e.start between Date('2018-01-01') and Date('2021-12-31');

