alter session set "_ORACLE_SCRIPT" = true;
create user scott identified by tiger;
grant dba to scott;

-- 연락처(Contact) 테이블 생성
-- JDBD: 자바 프로그램으로 연락처 테이블을 관리.
-- CRUD(Create, Read, Update, Delete)

create table contacts (
    cid     number(6)
            constraint contacts_cid_pk primary key,
    name    varchar2(100)
            constraint contacts_name_nn not null,
    phone   varchar2(100)
            constraint contacts_phone_nn not null,
    email   varchar2(100)
);

-- 테이블 편집 -> ID 열 -> 유형: 열 시퀀스 선택.

-- 새 연락처
insert into contacts (name, phone, email)
values ('죵아', '1004', 'zzongah.co.kr');

insert into contacts (name, phone, email)
values ('하뚜', '486', 'zzong.co.kr');

-- 연락처 전체 목록 보기
select * from contacts;

-- PK로 검색하기
select * from contacts where cid = 1;

-- cid가 일치하는 연락처 수정하기
update contacts
set name = '하트하트', phone = '0101234', email ='email.co.ke'
where cid = 2;

-- cid가 일치하는 연락처 삭제하기
delete from contacts where cid = 1;

commit;

-- 검색 기능
select * from contacts
where lower(name) like lower('%ABC%') 
    or 
    lower(phone) like lower('%ABC%')  
    or 
    lower(email) like lower('%ABC%') 
order by cid;

select * from posts; where id = 4;

