
--A  small IT firm designing business software for its clients wants to store and manage its data. It has identified following entities for which, it will maintain data.--
--Tables to Create;
--Clients/Employees/Departments/Projects/EmployeeProjectTasks--
--

Create Table Clients

(Client_ID INT PRIMARY KEY,
Client_Name VARCHAR(40) NOT NULL,
Client_Address VARCHAR(30),
Email VARCHAR(30) UNIQUE,
Phone VARCHAR(30),
Business VARCHAR(20) NOT NULL)

Insert into Clients Values

 (1001,'ACME Utilities', 'Noida', 'contact@acmeutil.com', '9567880032', 'Manufacturing'),
 (1002, 'Trackon Consultants', 'Mumbai', 'consult@trackon.com', '8734210090', 'Consultant'),
 (1003, 'MoneySaver Distributions', 'Kolkata', 'save@moneysaver.com', '7799886655', 'Reseller'),
 (1004, 'Lawful Crop', 'Chennai', 'justice@lawful.com', '9210342219', 'Professional')

 Select* from Clients

Create Table Employees

(Employee_No INT,
Employee_Name VARCHAR(20),
Job VARCHAR(30),
Salary INT,
Deptno INT)

 Insert into Employees Values

 (7001, 'Sandeep', 'Analyst', 25000, 10),
 (7002, 'Rajesh', 'Designer', 30000, 10),
 (7003, 'Madhav', 'Developer', 40000, 20),
 (7004, 'Manoj', 'Developer',40000, 20),
 (7005, 'Abhay', 'Designer', 35000, 10),
 (7006, 'Uma', 'Tester', 30000, 30),
 (7007, 'Gita', 'Technical Writer', 30000, 40),
 (7008, 'Priya', 'Tester', 35000, 30),
 (7009, 'Nutan', 'Developer', 45000, 20),
 (7010, 'Smita', 'Analyst', 20000, 10),
 (7011, 'Anand', 'Project Manager', 65000, 10)

 Select* from Employees


 Create Table Departments

(Deptno INT,
Dname VARCHAR(15),
Located_at VARCHAR(20))

Insert into Departments Values

(10, 'Design', 'Pune'),
(20, 'Development', 'Pune'),
(30, 'Testing', 'Mumbai'),
(40, 'Document', 'Mumbai')

Select* from Departments


Create Table Projects

(Project_ID INT PRIMARY KEY,
Descrip VARCHAR(30) NOT NULL,
Starting_Date Date,
Planned_End_Date Date,
Actual_End_Date Date,
Budget VARCHAR(30),
Client_ID INT)

Drop table Projects

Create Table Projects

(Project_ID INT PRIMARY KEY,
Descrip VARCHAR(30) NOT NULL,
Starting_Date Date,
Planned_End_Date Date,
Actual_End_Date Date,
Budget INT,
Client_ID INT)

SET DATEFORMAT dmy;
Insert into Projects Values

(401, 'Inventory', '01-Apr-11', '01-oct-11', '31-oct-11', 150000, 1001),
(402, 'Accounting', '01-Aug-11', '01-Jan-12',NULL, 500000,1002),
(403, 'Payroll', '01-Oct-11', '31-Dec-11',NULL, 75000, 1003),
(404, 'Contact Management', '01-Nov-11', '31-Dec-11',NULL, 50000, 1004)

Select* from Projects


Create Table EmployeeProjectTasks

(Project_ID INT,
Employee_No INT,
Starting_Date DATE,
End_Date DATE,
Task VARCHAR(25) NOT NULL,
Status VARCHAR(12) NOT NULL)

SET DATEFORMAT dmy;
Insert into EmployeeProjectTasks Values

(401, 7001, '01-Apr-11', '20-Apr-11', 'System Analysis', 'Completed'),
(401, 7002,'21-Apr-11','30-May-11','System Design','Completed'),
(401, 7003,'01-Jun-11','15-Jul-11','Coding','Completed'),
(401, 7004,'18-Jul-11','01-Sep-11','Coding','Completed'),
(401, 7006,'03-Sep-11','15-Sep-11','Testing','Completed'),
(401, 7009,'18-Sep-11','05-Oct-11','Code Change','Completed'),
(401, 7008,'06-Oct-11','16-Oct-11','Testing','Completed'),
(401, 7007,'06-Oct-11','22-Oct-11','Documentation','Completed'),
(401, 7011,'22-Oct-11','31-Oct-11','Sign off','Completed'),
(402, 7010,'01-Aug-11','20-Aug-11','System Analysis','Completed'),
(402, 7002,'22-Aug-11','30-Sep-11','System Design','Completed'),
(402, 7004,'01-Oct-11',NULL,'Coding','In Progress')

Select* from EmployeeProjectTasks

--1. Display customer details with business as ‘Consultant’--

Select* from Clients
Where Business = 'Consultant'

--2.Display employee details who are not ‘Developers’--

Select* from Employees
Where Job Not in ('Developers')

--3.Display project details with budget > 100000--

Select* from Projects
Where Budget>100000

--4.Display details of project that are already finished--

Select*from Projects
Where Actual_End_Date is NOT NULL

--5.Display employee names beginning with ‘M’--

Select* from Employees
Where Employee_name LIKE 'M%' 

--6.Display employee names ending with ‘a’--

Select* from Employees
Where Employee_name LIKE '%a' 

--7.Display the number of months project ‘Inventory’ took for completion--

SELECT DATEDIFF(month, '01/Apr/11', '31/10/11') AS Number_of_Months;


--8.Display the task that is ‘In Progress’--

Select* from EmployeeProjectTasks
Where Status='In Progress'

--9.Display details of departments located in Pune--

Select* from Departments
Where Located_at= 'Pune'

--10.Display employee name and salary in descending order of salary--

Select Employee_Name, Salary from Employees
Order by Salary Desc

--11. Display tasks in ascending order of end date--

Select Task, End_Date from EmployeeProjectTasks
Order by End_Date

--12.Display distinct jobs from Employees table--

SELECT DISTINCT job
         
FROM employees ;

--13.Display employee names in all uppercase--

Select Upper(Employee_Name) as Employee_Names
from Employees;

--14.Display employee name, salary and bonus calculated as 25% of salary--

SELECT Employee_Name, salary, salary*.25 Bonus 
FROM Employees;

--15.Display concatenated string ‘Employee works as Job’ (e.g. Manoj works as Developer) for all
--employees--

Select Employee_Name,Job,
CONCAT(Employee_Name, 'works as', Job) As Employee_Role
From Employees;

--16.Display day of week (e.g. Friday) for each start date of projects

SELECT
  DATENAME(dw, Starting_Date) AS Day_of_Week
FROM Projects;

--17.Display position number of ‘@’ symbol in each email id of clients

SELECT Charindex('@', 'contact@acmeutil.com') AS Symbol_Position

--18.Display first 3 characters of each client name--

SELECT SUBSTRING(Client_name,1,3) 
FROM CLIENTS;

--19.Display project budget values formatted as ‘$150,000’

Select Format(150000, 'c0') Project_Budget_Values;
Select Format(500000, 'c0') Project_Budget_Values;
Select Format(75000, 'c0') Project_Budget_Values;
Select Format(50000, 'c0') Project_Budget_Values;

--20.Display planned end date and review date as 3 months after planned end date for each project


Select DATEADD(MONTH,3,'01-OCT-11') as Review_Date,
       DATEADD(MONTH,3,'01-Jan-12') as Review_Date,
	   DATEADD(MONTH,3,'31-Dec-11') as Review_Date,
	   DATEADD(MONTH,3,'31-Dec-11') as Review_Date;
	   go

Alter table Projects
ADD Review_date DATE;
set Dateformat dmy;

Select*from Projects

Update Projects
Set Review_date= '01-01-2012'
Where Project_ID= 401

Update Projects
Set Review_date= '01-04-2012'
Where Project_ID= 402

Update Projects
Set Review_date= '31-03-2012'
Where Project_ID= 403

Update Projects
Set Review_date= '31-03-2012'
Where Project_ID= 404

Select Planned_End_Date, Review_Date
from Projects;

--21.Display count of clients--

Select Count(Client_name) as No_of_Clients
From Clients;

--22.Display count of employees and sum of their salaries--

Select Count(Employee_name) as No_of_Employees,
       Sum(Salary) as Sum_of_Employee_Salary
From Employees;

--23.Display max salary per department--

Select max(salary) as Max_Salary, Deptno
from Employees
Group by Deptno;

--24.Display min salary per job--

Select min(salary) as Min_Salary, Job
from Employees
Group by Job;

--25.Display average salary--

Select avg(Salary) as Average_Salary
From Employees;

--26.Display sum of budget--

Select SUM(Budget) as Total_Budget
From Projects;

--27.Display count of ‘Coding’ task--

Select Count('Coding') as No_of_Coding_Tasks
From EmployeeProjectTasks
Where Task='Coding';

--28.Display department wise count and sum of salary of employees--

Select Count(Employee_Name) as No_of_Employees_per_Dept, Deptno,
       Sum(Salary) as Total_Salary
From Employees
Group by Deptno;

--29.Display client names and their project desc, start date and budget--

SELECT Projects.Descrip,Starting_Date, Budget, Clients.Client_Name
From Projects INNER JOIN Clients 
ON Projects.Client_ID = Clients.Client_ID

--30.Display department name, employee name and job--

SELECT Departments.[Dname],Employees.[Employee_Name],[job]
FROM Departments
INNER JOIN Employees 
ON Departments.Deptno = Employees.Deptno

--31.Display names of employees doing ‘System Analysis’ along with project name--

SELECT EmployeeProjectTasks.[Task], Projects.[Descrip]
From EmployeeProjectTasks
INNER JOIN Projects
on EmployeeProjectTasks.Project_ID=Projects.Project_ID
Where Task= 'System Analysis';

--32.Display job wise count--

Select Count(Employee_Name) as No_of_Employees, Job
From Employees
Group by Job;

--33. Display employee numbers not present in EmpProjectTasks table using necessary set operator--

SELECT Employee_No
From Employees
EXCEPT
SELECT Employee_No
From EmployeeProjectTasks;

--34.Display employee numbers present in both Employees and EmpProjectTasks table using necessary set operator

SELECT Employee_No
From Employees
INTERSECT
SELECT Employee_No
From EmployeeProjectTasks;

--35.Display all employee numbers present in both Employees and EmpProjectTasks table using necessary set operato

SELECT Employee_No
From Employees
UNION 
SELECT Employee_No
From EmployeeProjectTasks;

--WEEK3--

--01.Display the project name with highest budget--

Select max(Budget) as Maximum_Budget,Descrip
From Projects
Group by Descrip;

--02.Display employee names who have same job as ‘Madhav’

SELECT Employee_Name, Job
FROM employees 
WHERE job in 
( SELECT job  
FROM employees  
WHERE Employee_Name='Madhav'
);

--03.Display employee’s name and job who worked on ‘Code Change’ task of project 401--

SELECT Employee_Name,Job
FROM EMPLOYEES 
WHERE Employee_No = (SELECT Employee_No
FROM EmployeeProjectTasks 
WHERE PROJECT_ID = 401 AND TASK = 'Code Change');

--04.Display client name whose project’s ‘Coding’ task is ‘In Progress--

SELECT Client_Name 
FROM CLIENTS 
WHERE CLIENT_ID = (SELECT CLIENT_ID 
FROM PROJECTS 
WHERE PROJECT_ID = (SELECT PROJECT_ID 
FROM EmployeeProjectTasks 
WHERE TASK = 'Coding'
AND STATUS = 'In Progress'));

--05.Display department number, names and salaries of employees who are earning max salary in their departments--

SELECT DEPTNO,Employee_Name,SALARY 
FROM Employees
WHERE SALARY = (SELECT MAX(SALARY) 
FROM EMPLOYEES 
WHERE DEPTNO = DEPTNO);

--06.Display name of department with highest SUM of salary--

SELECT DISTINCT Employees.Employee_Name, Employees.Salary, Departments.Dname
FROM Employees , Departments 
WHERE Employees.salary =  
(SELECT MAX(salary) 
FROM Employees 
WHERE Deptno = Deptno ) 
AND Employees.Deptno =Departments.Deptno;

--07. Create a table named ‘CLIENT_PROJECTS’ using CTAS method that includes 
--CLIENT_ID, CNAME, ADDRESS,BUSINESS,DESCR,BUDGET columns from CLIENTS and PROJECTS tables


SELECT  C.Client_ID,
C.Client_Name,
C.Client_Address, 
C.Business, 
P.Descrip, 
P.Budget
INTO dbo.ClientProjects
FROM Clients C
LEFT JOIN Projects P ON C.Client_ID = P.Client_ID;

--08.Increase salary of employees by 15% who have performed task of ‘Testing’ on projects--

UPDATE Employees 
Set Salary = Salary*.15
Where Employee_No IN (Select Employee_No from EmployeeProjectTasks 
Where Task = 'Testing');

Select* from Employees

--09.Create a view named DEPT_EMP with DEPTNO,DNAME,LOC,ENAME,JOB, and SALARY columns-- 

SELECT  D.Deptno,
D.Dname,
D.Located_at,  
E.Employee_Name, 
E.Job,
E.Salary
INTO dbo.DEPT_EMP
FROM Departments D
LEFT JOIN Employees E ON D.Deptno = E.Deptno;

Select* from DEPT_EMP

--10.Create synonym EPT for table EmpProjectTasks--

Create Synonym EPT
for EmployeeProjectTasks;
Go

Select*
from EPT