/*
DDL(Data Definition Language): create, alter, truncate, drop
alter table: 테이블 정의 수정.
- 변경: 이름 변경(rename), 추가(add), 삭제(drop), 수정(modify)
    (1) alter table ... rename ...
    (2) alter table ... add ...
    (3) alter table ... drop ...
    (4) alter table ... modify ...
*/

-- 이름 변경(rename)
-- (1) 테이블 이름 변경: students 테이블 이름을 student로 변경
alter table students rename to student;

-- (2) 컬럼 이름 변경: student 테이블의 stuname 컬럼의 이름을 sname으로 변경
alter table student rename column stuname to sname;

-- (3) 제약 조건 이름 변경: 제약 조건 추가 후 작성.

describe student; 
-- -> 표준 SQL 명령어 아님! Oracle에서만 사용 가능.
-- -> 테이블의 컬럼 이름, NULL 가능여부, 데이터 타입을 출력.

-- 추가(add)
-- (1) 새로운 컬럼: student 테이블에 department(학과) 컬럼 추가.
-- add + 컬럼이름 + 데이터타입 + [기본값]
alter table student add department number(2);

-- (2) 새로운 제약 조건: student 테이블의 stuno 컬럼에 PK 제약조건을 추가
-- add + constraint + 제약조건이름 + 제약조건내용 + (컬럼)
alter table student add constraint stu_no_pk primary key (stuno);

-- 제약조건 stu_no_pk를 student_pk로 이름 변경
alter table student rename constraint stu_no_pk to student_pk;

-- 삭졔(drop)
-- (1) 컬럼 삭제: student 테이블에서 department 컬럼을 삭제
-- drop column 컬럼이름 
alter table student drop column department;
desc student;

-- (2) 제약조건 삭제: student 테이블에서 STUDENT_PK 제약조건 삭제
alter table student drop constraint student_pk;


-- 수정(modify): 테이블의 컬럼 정의(데이터 타입, null 여부, 기본값)를 수정.
-- student 테이블의 sname 컬럼의 데이터 타입을 varchar2(100 char)로 수정.
alter table student modify sname varchar2(100 char);
desc student;

alter table student modify sname not null;
desc student;

-- modify는 제약조건 내용을 변경할 수 없음!
-- drop constraint ... (제약조건 삭제) --> add constraint ... (새로운 제약조건 추가)





