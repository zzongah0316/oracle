/*
DML(Data Mainpulation Language): 데이터 조작 언어. insert, update, delete, [select]
- insert into + TABLE + [(COLUMN, ...)] + values + (값, ...);
- insert into + TABLE + 
    select COLUMN, ... from TABLE2 [where ...];
- update TABLE set COLUMN = 값, ... [where 조건식];
- delete from TABLE [where 조건식];
*/

-- create table ... as select 구문: 테이블의 모양(컬럼 이름, 데이터 타입)과 데이터를 복사.
create table my_emp 
as select * from emp;

select * from my_emp;

-- 테이블의 모양만 복사, 데이터는 복사하지 않는 경우:
create table my_emp2
as select * from emp where empno = -1;

select * from my_emp2;

-- my_emp2 테이블에 emp 테이블의 모든 내용을 insert;
insert into my_emp2
select * from emp;

commit;

select * from my_emp2;

-- my_emp2 테이블에서, 
-- 사번이 1004인 직원의 급여를 6000으로 변경:
update my_emp2
set sal = 6000 
where empno = 1004;

commit;

update my_emp2 set sal = 6000;
--> 모든 행의 sal 컬럼 값을 업데이트

rollback;
-- -> 최종(직전) 커밋 상태로 되돌리기.

-- 사번이 1004인 직원의 직무를 'MANAGER', 입사날짜는 '2000/12/31', 부서번호는 40으로 업데이트.
update my_emp2
set job = 'MANAGER', hiredate = to_date('2000/12/31'), deptno = 40
where empno = 1004;

select * from my_emp2;

-- 'ACCOUNTING' 부서에서 일하는 직원들의 급여를 10% 인상.
update my_emp2
set sal = sal*1.1
where deptno = (
    select deptno from dept where dname = 'ACCOUNTING'
);

select * from my_emp2 where deptno =10;

-- salgrade가 1인 직원들의 급여를 20% 인상:
update my_emp2
set sal = sal * 1.2
where sal between
    (select losal from salgrade where grade = 1)
    and
    (select hisal from salgrade where grade = 1);

select * from my_emp2;

commit;
    
-- 테이블에서 행 삭제
delete from my_emp2;

rollback;
select * from my_emp2;
-- -> delete 명령은 rollback이 가능한 DML.
-- -> truncate table 명령은 rollback이 불가능한 DDL.

-- 직원번호 1004인 직원 레코드(행)을 삭제:
delete from my_emp2
where empno = 1004;

-- 1987년도에 입사한 직원을 삭제
delete from my_emp2
where to_char(hiredate, 'YYYY') = '1987';

select * from my_emp2;

commit;