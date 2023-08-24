create table lunchs (
    fid     number(38)
            constraint lunch_fid_pk primary key,
    day     varchar2(12 char)
            constraint lunch_day_nn not null,
    diary   varchar2(1000 char),
    bfkcal  number(10, 2) default 0   
);
commit;

drop table lunchs;

create table lunchs (
    fid     number(38)
             constraint lunchs_fid_pk references foods (fid),
    day     varchar2(12 char)
            constraint lunch_day_nn not null,
    diary   varchar2(1000 char),
    bfkcal  number(10, 2) default 0   
);

commit;


drop table lunchs;

create table lunchs (
    fid     number(38),
    day     varchar2(12 char),
    diary   varchar2(1000 char),
    lunchkcal  number(10, 2) default 0   
);

commit;