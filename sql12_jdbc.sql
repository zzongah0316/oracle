-- JDBC(Java Database Connectivity)
-- 자바 프로그램에서 데이터베이스에 접속해서 SQL(select/insert/delete) 문장들을 실행.

-- 테이블 생성
-- 테이블 이름: blogs
-- 컬럼:
--   id: 블로그 글 번호. number(6) primary key(고유키) -> insert할 때마다 자동 증가.
--   title: 블로그 글 제목. varchar2(100 char). not null.
--   content: 블로그 글 내용. varchar2(1000 char). not null.
--   author: 블로그 글 작성자. varchar2(100 char). not null.
--   created_time: 블로그 최초 작성 시간. timestamp. 기본값(시스템 현재 시간).
--   modified_time: 블로그 수정 시간. timestamp. 기본값(시스템 현재 시간).

create table blogs (
    id              number(6)
                    constraint blogs_id_pk primary key,
    title           varchar2(100 char)
                    constraint blogs_title_nn not null,
                    content varchar2(1000 char)
                    constraint blogs_content_nn not null,
    author          varchar2(100 char)
                    constraint blogs_author_nn not null,
    created_time    timestamp default sysdate,
    modified_time   timestamp  default sysdate
);

/*
Oracle 접속 -> SCOTT -> 테이블 -> BLOGS 오른쪽 클릭 -> 편집
 -> ID 컬럼이 선택된 상태 -> ID  열 탭 클릭 -> 유형: 열 시퀀스 변경 -> 확인
 
 시퀀스(sequence): 자동으로 생성되는 연속된 숫자(0, 1, 2, 3, 4, ...).
 BLOGS 테이블에 데이터가 insert될 때마다 PK로 설정된 id 컬럼에 시퀀스가 자동으로 저장되도록 하기 위해서.
*/

insert into blogs (title, content, author)
values ('블로그 테스트', '새 블로그 작성...', 'test');

insert into blogs (title, content, author)
values ('test', '안녕하세요, 제 블로그입니다.', 'admin');

-- update blogs
-- set title = ?, content = ?, modified_time = sysdate
-- where id = ?;

select * from blogs where id = 1;

commit;