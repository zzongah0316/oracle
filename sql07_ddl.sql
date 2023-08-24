/*
SQL 종류:
1. DQL(Data Query Language): 데이터 질의 언어. select 문장.
2. DML(Data Mainpulation Language): 데이터 조작 언어.
    - insert, update, delete.
    - 테이블에 행(row)을 추가, 변경, 삭제하는 SQL 문장.
3. DDL(Data Definition Language): 데이터 정의 언어.
    - create, alter, truncate, drop.
    - 테이블, 사용자 계정을 생성, 변경, 삭제하는 SQL 문장.
4. TCL(Transaction Control Language): 트랜잭션 관리(제어) 문장.
    - commit: 데이터 베이스의 변경 내용을 영구 저장.
    - rollback: 직전의 commit 상태로 되돌리기.
*/

/*
테이블 생성:
create table 테이블이름 (
    컬럼이름 데이터타입 [제약조건, 기본값],
    ...
);

데이터 타입의 이름(키워드)은 데이터베이스 종류에 따라서 다름!
Oracle 데이터 타입: number, varchar2, date, timestamp, clob, blob, ...
*/

/*
테이블 이름: studects
컬럼:
    - stuNo: 학생 아이디. 학번. 숫자(6자리 정수).
    - stuName: 학생 이름. 문자열(10글자)
    - birthday: 학생 생일. 날짜
*/
create table students (
    stuno       number(6), 
    stuname     varchar2(10 char),
    birthday    date
);

/*
테이블에 행(row) 추가 (삽입):
insert into 테이블 (컬럼1, 컬럼2, ...) values (값1, 값2, ...);

insert into 테이블 values (값1, ...);
- values에서 나열하는 값의 개수는 테이블의 컬럼 수와 같아야, 값의 순서는 컬럼의 순서와 같아야 함.
*/
insert into students
values (1, '홍길동', '2023/04/11');

insert into students
values (2, '홍길동');
--> ORA-00947: 값의 수가 충분하지 않습니다.

insert into students
values (2, '홍길동', null);

insert into students (stuno, stuname)
values (3, '홍길동');

insert into students
values('홍길동', 4, to_date('2000/01/01'));
--> ORA-01722: 수치가 부적합합니다.

insert into students (stuname, stuno, birthday)
values ('김길동', 5, to_date('2000/01/01'));

insert into  students (stuno)
values (1234567); -- -> ORA-01438: 컬럼 자릿수보다 더 큰 수를 insert하려는 에러.

insert into students (stuname)
values ('abcdefghijk'); -- ->ORA-12899: 컬럼에서 지정한 문자열 길이보다 더 긴 문자열.

select * from students;

commit; -- 현재까지 작업 내용을 DB에 영구 저장.

-- 테이블 생성할 떄 컬럼의 기본값 설정하기:
create table ex_user (
    no              number(4), -- 0~9999 자릿수 가능 10000개 가능
    userid          varchar2(20), -- 20 바이트까지의 문자열.
    password        varchar2(100),
    age             number(3) default 0,
    created_date    date default sysdate
);

insert into ex_user (no, userid, password)
values (1, 'guest', 'guest0000');
-- -> default 값이 설정된 컬럼들은 insert하지 않으면 기본값이 insert됨.

insert into ex_user(userid, password)
values ('admin', 'admin0000');
-- -> default 값이 설정되지 않은 컬럼들은 insert하지 않으면 null됨.

select * from ex_user;

commit;

-- 제약 조건: (1) primary key(고유키), (2) not null, (3) unique, (4) check, (5) foreign key(외부키)
create table ex1 (
    col1    number(2) 
            primary key, -- null이 아니고, 중복되지 않는 유일한 값 -> 유일한 행 1개를 검색.
    col2    varchar2(100) 
            not null,    -- 반드시 값이 insert되어야 함.
    col3    varchar2(100) 
            unique,      -- 중복되지 않은 유일한 값만 허용. 
    col4    number(2) 
            check (col4 >=0), -- 조건을 만족하는 값만 insert를 허용.
    col5    number(2)    -- 
);

insert into ex1
values (1, '홍길동', 'test', 10, 0);

insert into ex1(col1, col2)
values (1, '홍길동');
-- -> PK 제약조건 위배: 중복되는 값이어서.

insert into ex1 (col2)
values ('홍길동');
-- -> PK 제약조건 위배: PK는 null이 되면 안됨.

insert into ex1 (col1, col2)
values (2, '김길동');

insert into ex1 (col1)
values (3);
-- -> col2가 NN(Not Null)이라는 제약조건을 위배.

insert into ex1 (col1, col2, col3)
values (3, '홍길동', 'test');
-- -> col3은 중복된 값을 허용하지 않는다(unique)는 제약조건에 위배.

insert into ex1 (col1, col2, col4)
values (3, '홍길동', -1);
-- -> col4 >= 0 제약조건에 위배.

select * from ex1;

commit;
