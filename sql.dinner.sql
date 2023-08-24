create table dinners (
    fid     number(38)
            constraint dinner_fid_pk primary key,
    day     varchar2(12 char)
            constraint dinner_day_nn not null,
    diary   varchar2(1000 char),
    bfkcal  number(10, 2) default 0   
);

commit;

drop table dinners ;

create table dinners (
    fid     number(38)
            constraint dinner_fid_pk references foods (fid),
    day     varchar2(12 char)
            constraint dinner_day_nn not null,
    diary   varchar2(1000 char),
    bfkcal  number(10, 2) default 0   
);
commit;

select * from breakfasts; 

select * from lunchs;

select * from dinners;

select a.bfkcal
    , b.lunchkcal
    , c.dinnerkcal
from breakfasts a, lunchs b, dinners c
where a.fid = b.fid
and a.fid =c.fid
and a.day = b.day
and a.day = c.day
;

drop table dinners ;

create table dinners (
    fid     number(38),
    day     varchar2(12 char)
            constraint dinner_day_nn not null,
    diary   varchar2(1000 char),
    bfkcal  number(10, 2) default 0   
);

commit;

drop table dinners ;

create table dinners (
    fid     number(38),
    day     varchar2(12 char),
    diary   varchar2(1000 char),
    dinnerkcal  number(10, 2) default 0   
);

-- DAY, BFKCAL B, LUNCHKCAL L, DINNERKCAL D, ALLKCAL F 

desc foods;
select distinct
     B.DAY
    , B.BFKCAL
    , L.LUNCHKCAL
    , D.DINNERFKCAL
    , (B.BFKCAL+L.LUNCHKCAL+D.DINNERFKCAL) as allkCal
from BREAKFASTS B, LUNCHS L, DINNERS D 
where B.FID = L.FID
and L.FID = D.FID
and B.DAY = L.DAY
and L.DAY = D.DAY
 order by B.DAY;
 
 select B.DAY, B.BFKCAL, L.LUNCHKCAL, D.DINNERKCAL,
 ( B.BFKCAL + L.LUNCHKCAL + D.DINNERKCAL ) AS ALLKCAL 
 from BREAKFASTS B, LUNCH L, DINNER D 
 where B.FID = L.FID 
 and L.FID = D.FID 
 and B.DAY = L.DAY 
 and L.DAY = D.DAY 
 order by B.DAY;
 
 
 
 select *
 from DINNERS;
 select *
 from LUNCHS;
 select *
 from BREAKFASTS;
 
 select B.DAY
     , B.BFKCAL
     , L.LUNCHKCAL
     , D.DINNERKCAL
    , ( B.BFKCAL + L.LUNCHKCAL + D.DINNERKCAL ) AS ALLKCAL 
 from BREAKFASTS B, LUNCHS L, DINNERS D 
 where B.FID = L.FID 
 and L.FID = D.FID 
 and B.DAY = L.DAY 
 and L.DAY = D.DAY 
 order by B.DAY;
 
 select * 
 from BREAKFASTS B, LUNCHS L, DINNERS D 
  where B.FID = L.FID(+); and B.FID = D.FID(+);
 ; where B.FID = L.FID and L.FID = D.FID order by B.DAY;
 
 desc foods;
 
insert into foods(FID, DAY, BFKCAL) (select FID, DAY, BFKCAL from BREAKFASTS ); 
 
select * from foods;

insert into foods(FID, DAY, LUNCHKCAL) (select FID, DAY, LUNCHKCAL from LUNCHS);

insert into foods(FID, DAY, DINNERKCAL) (select FID, DAY, DINNERKCAL from DINNERS );
 
 
 select distinct *
 from foods
 where day ;
 
 SELECT f1.DAY,
  COALESCE(SUM(f1.BFKCAL), SUM(f2.BFKCAL)) AS BFKCAL,
  COALESCE(SUM(f1.LUNCHKCAL), SUM(f2.LUNCHKCAL)) AS LUNCHKCAL,
  COALESCE(SUM(f1.DINNERKCAL), SUM(f2.DINNERKCAL)) AS DINNERKCAL,
  (COALESCE(SUM(f1.BFKCAL), SUM(f2.BFKCAL)) + COALESCE(SUM(f1.LUNCHKCAL), SUM(f2.LUNCHKCAL)) + COALESCE(SUM(f1.DINNERKCAL), SUM(f2.DINNERKCAL))) AS ALLKCAL
FROM foods f1
LEFT JOIN foods f2 ON f1.DAY = f2.DAY AND f2.BFKCAL != 0 AND f1.FID != f2.FID
GROUP BY f1.DAY;
commit;



SELECT f1.DAY,   COALESCE(SUM(f1.BFKCAL), SUM(f2.BFKCAL)) AS BFKCAL,   COALESCE(SUM(f1.LUNCHKCAL), SUM(f2.LUNCHKCAL)) AS LUNCHKCAL,   COALESCE(SUM(f1.DINNERKCAL), SUM(f2.DINNERKCAL)) AS DINNERKCAL,   (COALESCE(SUM(f1.BFKCAL), SUM(f2.BFKCAL)) + COALESCE(SUM(f1.LUNCHKCAL), SUM(f2.LUNCHKCAL)) + COALESCE(SUM(f1.DINNERKCAL), SUM(f2.DINNERKCAL))) AS ALLKCAL FROM foods f1 LEFT JOIN foods f2 ON f1.DAY = f2.DAY AND f2.BFKCAL != 0 AND f1.FID != f2.FID GROUP BY f1.DAY;