--数据库建立文件

--用户表,主键u_id,u_name不重复,u_identity表示用户权限,0为管理员,1为会员,默认为1
create table p_users(
       u_id number primary key,
       u_name varchar2(20) unique not null,
       u_pass varchar2(20) not null,
       u_identity number(1) default 1 not null,
       u_money number(10,2) default 500
);

--商品分类表,主键c_id,p_id用于区分父分类以及子分类,具体看solutions文件夹
create table p_category(
       c_id number primary key,
       p_id number not null,
       c_name varchar2(50) not null
);

--商品表,主键g_id,外键为分类表中c_id,商品数量默认1
create table p_goods(
       g_id number primary key,
       c_id number not null,
       g_name varchar2(50) not null,
       g_price number(10,2) not null,
       g_num number(3) default 1 not null,
       g_brief varchar2(100),
       foreign key(c_id) references p_category(c_id) on delete cascade        
);

--订单表,主键o_id,外键用户表中u_id,o_state表示商品订单状态,0表示未发货未付款,1表示付款未发货,2表示付款已发货,3表示已确认收货，4表示已评价，5表示已取消，默认0
create table p_orders(
       o_id number primary key,
       u_id number not null,
       o_time date not null,
       o_receiver varchar2(20) not null,
       o_address varchar2(200) not null,
       o_phone number(13) not null,
       o_state number(1) default 0 check(o_state between 0 and 5),
       foreign key(u_id) references p_users(u_id) on delete cascade
);

--订单信息表,存储订单中商品信息,外键订单表中o_id,以及商品表中g_id
create table p_orders_info(
       o_id number not null,
       g_id number not null,
       i_num number not null,
       i_price number(10,2) not null,
       foreign key(o_id) references p_orders(o_id) on delete cascade,
       foreign key(g_id) references p_goods(g_id) on delete cascade
);

--购物车表,外键用户表中u_id以及商品表中g_id,商品数默认1
create table p_cart(
       u_id number not null,
       g_id number not null,
       i_num number default 1 not null,
       foreign key(u_id) references p_users(u_id) on delete cascade,
       foreign key(g_id) references p_goods(g_id) on delete cascade
);


--自增序列,用于u_id
create sequence u_id_seq
minvalue 1
start with 1
increment by 1
;

--相应触发器
create or replace trigger u_id_trigger       
before insert on p_users       
for each row       
begin       
select u_id_seq.nextval into :new.u_id from dual;    
end u_id_trigger; 
  
--自增序列,用于g_id
create sequence g_id_seq
minvalue 1
start with 1
increment by 1;

--相应触发器
create or replace trigger g_id_trigger       
before insert on p_goods       
for each row       
begin       
select g_id_seq.nextval into :new.g_id from dual;    
end g_id_trigger;   

--自增序列,用于c_id
create sequence c_id_seq
minvalue 1
start with 1
increment by 1;

--相应触发器
create or replace trigger c_id_trigger        
before insert on p_category       
for each row       
begin       
select c_id_seq.nextval into :new.c_id from dual;      
end c_id_trigger;   

--自增序列,用于o_id
create sequence o_id_seq
minvalue 1
start with 1
increment by 1;

--相应触发器
create or replace trigger o_id_trigger       
before insert on p_orders       
for each row       
begin       
select o_id_seq.nextval into :new.o_id from dual;  
end o_id_trigger;   















