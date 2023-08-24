create table breakfasts (
    day     varchar2(12 char)
            constraint breakfasts_day_fk references foods (day),
    diary   varchar2(1000 char),
    bfkcal  number(10, 2) default 0   
);

commit;

drop table breakfasts;

create table breakfasts (
    fid     number(38)
            constraint breakfasts_fid_pk primary key,
    day     varchar2(12 char)
            constraint breakfasts_day_nn not null,
    diary   varchar2(1000 char),
    bfkcal  number(10, 2) default 0   
);

commit;

drop table breakfasts;

create table breakfasts (
    fid     number(38)
            constraint breakfasts_fid_fk references foods (fid),
    day     varchar2(12 char)
            constraint breakfasts_day_nn not null,
    diary   varchar2(1000 char),
    bfkcal  number(10, 2) default 0   
);

commit;

drop table breakfasts;

create table breakfasts (
    fid     number(38)
            constraint breakfasts_fid_pk primary key,
    day     varchar2(12 char)
            constraint breakfasts_day_nn not null,
    diary   varchar2(1000 char),
    bfkcal  number(10, 2) default 0   
);

commit;

truncate table breakfasts;
commit;

select * from BREAKFASTS order by DAY;

select * from BREAKFASTS order by DAY;

drop table breakfasts ;

create table breakfasts (
    fid     number(38)
            constraint breakfasts_fid_pk references foods (fid),
    day     varchar2(12 char)
            constraint breakfasts_day_nn not null,
    diary   varchar2(1000 char),
    bfkcal  number(10, 2) default 0   
);
select * from breakfasts;
select * from foods;

commit;

drop table breakfasts ;

create table breakfasts (
    fid     number(38),
    day     varchar2(12 char)
            constraint breakfasts_day_nn not null,
    diary   varchar2(1000 char),
    bfkcal  number(10, 2) default 0   
);

commit;

insert into breakfasts (fid, day, diary, bfkcal)
values (1, '230421', '안녕하세요', 100);

insert into lunchs (fid, day, diary, lunchkcal)
values (1, '230421', '점심', 3000);

desc dinners;

insert into dinners (fid, day, diary, dinnerfkcal)
values (1, '230421', '저녁', 5000);
commit;

drop table breakfasts ;
create table breakfasts (
    fid     number(38),
    day     varchar2(12 char),
    diary   varchar2(1000 char),
    bfkcal  number(10, 2) default 0   
);