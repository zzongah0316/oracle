insert into users (username, password, email)
values ('guest', 'guest1234', 'guest@itwill.co.kr');

commit; 

select * from users;

alter table users add constraint USERS_USERNAME_UQ unique(username);

-- select * from posts WHERE title like upper('%타이틀%') or lower('%타이틀%') ;  
insert into posts (title, content, author)
values ('tiTle', 'bIg', 'JUNGah');

select * from posts;
select * from posts WHERE title like '%이%';
select * from posts WHERE content like '%공%';
select * from posts where content like '%공%';
SELECT * FROM posts WHERE title LIKE '%공%' OR content LIKE '%공%';
select * from posts where author like '%정%';
