-- 영업팀 연봉 5000 김철수 입사
INSERT INTO employees (name, department_name, salary)
VALUES ('김철수', '영업팀', 5000);
-- 팀(미정) 연봉 4000 이영희 입사
INSERT INTO Employees (employee_id, name, salary)
VALUES (2, '이영희', 4000);
-- 팀(미정) 연봉(미정) 박민수 입사
INSERT INTO Employees (employee_id, name, hiredate)
VALUES (3, '박민수', "2025-02-05"); 
    -- 이영희나 박민수 처럼 department_name 이 Null 인 경우 
    -- 고의인지 실수 인지 구분상관 없이 미리 제약조건으로 강제 함

-- 영업팀 연봉 4500 박명수 입사
INSERT INTO employees
VALUES (NULL, '박명수', '영업팀', 4500, '2025-02-06');
-- 개발팀 연봉 7000 유재석 입사
INSERT INTO Employees
VALUES (NULL, '유재석', '개발팀', 7000, '2025-02-06');

-- 이전에 넣은 값과 예제의 ID 가 충돌한다
-- 이떄 AUTO_INCREMENT 를 사용하려면 그 부분을 NULL 로 넣어줘도 처리된다


create table new_employees(
 employee_id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(50) NOT NULL,
 department_name VARCHAR(50),
 salary DECIMAL(10,2) CHECK (salary>0),
 hiredate DATE DEFAULT (CURRENT_DATE)
);

INSERT INTO new_employees
SELECT * FROM employees WHERE salary < 5000;


-- 사원 테이블에서 사원 번호가 2인 데이터의 부서명을 영업지원팀으로 수정
UPDATE employees
SET department_name = '영업지원팀'
WHERE employee_id = 2;
-- 사원 테이블에서 사원 번호가 3인 데이터의 부서명을 연구소로, 연봉을 8000 으로 수정
UPDATE employees
SET department_name = '연구소', salary = 8000
WHERE employee_id = 3;
-- 사원 테이블에서 연봉이 5000 미만인 데이터의 연봉을 5% 인상하도록 수정
UPDATE employees
SET salary = salary + (salary * 0.05)
WHERE salary < 5000;


-- 사원 테이블에서 연봉이 7000 이상인 데이터를 삭제
DELETE FROM employees
WHERE salary >= 7000;
-- 사원 테이블에서 사원 번호가 4인 데이터를 삭제
DELETE FROM employees
WHERE employee_id = 4;

INSERT INTO employees
VALUES (3, '조세호', '개발팀', 6000, '2025-02-07');
SELECT * FROM employees;
commit;

delete from employees where employee_id = 3;

rollback;
-- 남아있는거 확인가능..

-- 현재까지 SQL 문장을 사용하여 변경된 사항이 적용된 저장점 생성
SAVEPOINT sp1;
-- 개발팀 연봉 7000 박나래 입사 데이터 삽입 및 조회
INSERT INTO Employees
VALUES (4, '박나래', '기획팀', 7000, '2025-02-08');
SELECT * FROM employees;
-- 현재까지 SQL 문장을 사용하여 변경된 사항이 적용된 저장점 생성
SAVEPOINT sp2;
-- 개발팀 연봉 8000 전현무 입사 데이터 삽입 및 조회
INSERT INTO Employees
VALUES (null, '전현무', '개발팀', 6000, '2025-02-07');
SELECT * FROM employees;

