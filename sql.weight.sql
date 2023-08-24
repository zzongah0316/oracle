create table weights (
    id              number(6)
                    constraint weights_id_pk primary key,
    weight          number(6, 1)
                    constraint weights_weight_nn not null,
    height          number(6, 1)
                    constraint weights_height_nn not null,
    bmi             varchar2(100 char)
                    constraint weights_bmi_nn not null,
    created_time    timestamp default sysdate           
);

commit;

select * from weights;

insert into weights (weight, height, bmi)
values (100, 150, '심각한 비만');

commit;