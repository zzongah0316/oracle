create table foods (
    day         varchar2(12 char)
                constraint foods_date_pk primary key,
    bfkcal      number(10, 2) default 0,
    lunchkcal   number(10, 2) default 0,
    dinnerkcal  number(10, 2) default 0,
    allkcal     number(10, 2) default 0
);

commit; 

drop table foods ;

create table foods (
    fid         number(38)
                constraint foods_fid_pk primary key,
    day         varchar2(12 char)
                constraint foods_day_nn not null,
    bfkcal      number(10, 2) default 0,
    lunchkcal   number(10, 2) default 0,
    dinnerkcal  number(10, 2) default 0,
    allkcal     number(10, 2) default 0
);

commit;

drop table foods ;

create table foods (
    fid         number(38)
                constraint breakfasts_fid_pk primary key,
    day         varchar2(12 char)
                constraint foods_day_nn not null,
    bfkcal      number(10, 2) default 0,
    lunchkcal   number(10, 2) default 0,
    dinnerkcal  number(10, 2) default 0,
    allkcal     number(10, 2) default 0
);

commit;
drop table foods ;

create table foods (
    fid         number(38)
                constraint foods_fid_pk primary key,
    day         varchar2(12 char)
                constraint foods_day_nn not null,
    bfkcal      number(10, 2) default 0,
    lunchkcal   number(10, 2) default 0,
    dinnerkcal  number(10, 2) default 0,
    allkcal     number(10, 2) default 0
);

commit;

drop table foods ;

insert into foods (fid)
values (1);

drop table foods ;

create table foods (
    fid         number(38),
    day         varchar2(12 char)
                constraint foods_day_nn not null,
    bfkcal      number(10, 2) default 0,
    lunchkcal   number(10, 2) default 0,
    dinnerkcal  number(10, 2) default 0,
    allkcal     number(10, 2) default 0
);
commit;

create table foods (
    fid         number(38),
    day         varchar2(12 char),
    bfkcal      number(10, 2) default 0,
    lunchkcal   number(10, 2) default 0,
    dinnerkcal  number(10, 2) default 0,
    allkcal     number(10, 2) default 0
);

select * from foods order by day
