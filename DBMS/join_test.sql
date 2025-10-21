-- 예제에서 사용할 테이블 생성
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);
CREATE TABLE Employees (
    ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    DeptID INT,
    ManagerID INT
);


-- Departments 테이블에 데이터 삽입
INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Marketing'),
(4, 'planning');
-- Employees 테이블에 데이터 삽입
INSERT INTO Employees (ID, Name, DeptID, ManagerID) VALUES
(101, 'Alice', 1, NULL),
(102, 'Bob', 2, 101),
(103, 'Charlie', 2, 101),
(104, 'David', 3, 102),
(105, 'Eva', NULL, NULL);

select e.Name, d.DeptName
from Employees as e
Inner join Departments as d on e.deptId = d.deptid;

Create View app_employees_info AS 
select e.Name, d.DeptName
from Employees as e
Inner join Departments as d on e.deptId = d.deptid;

--테스트용
savepoint mypoint1;
insert into employees values (109, '세호', 2, 102);
savepoint mypoint2;

------------------------------------------

-- left join 
Create or Replace View app_employees_info AS 
select e.Name, d.DeptName
from Employees as e
Left join Departments as d on e.deptId = d.deptid;


-- self join
Create or Replace View boss AS 
select e1.Name 'Employee', e2.Name as 'Manager' 
from Employees as e1
join Employees as e2 on e1.ManagerID = e2.id; -- 요 부분 어려워 하는 사람 있을수도 있다..?

