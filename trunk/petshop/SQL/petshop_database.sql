--���ݿ⽨���ļ�

--�û���,����u_id,u_name���ظ�,u_identity��ʾ�û�Ȩ��,0Ϊ����Ա,1Ϊ��Ա,Ĭ��Ϊ1
create table p_users(
       u_id number primary key,
       u_name varchar2(20) unique not null,
       u_pass varchar2(20) not null,
       u_identity number(1) default 1 not null,
       u_money number(10,2) default 500
);

--��Ʒ�����,����c_id,p_id�������ָ������Լ��ӷ���,���忴solutions�ļ���
create table p_category(
       c_id number primary key,
       p_id number not null,
       c_name varchar2(50) not null
);

--��Ʒ��,����g_id,���Ϊ�������c_id,��Ʒ����Ĭ��1
create table p_goods(
       g_id number primary key,
       c_id number not null,
       g_name varchar2(50) not null,
       g_price number(10,2) not null,
       g_num number(3) default 1 not null,
       g_brief varchar2(100),
       foreign key(c_id) references p_category(c_id) on delete cascade        
);

--������,����o_id,����û�����u_id,o_state��ʾ��Ʒ����״̬,0��ʾδ����δ����,1��ʾ����δ����,2��ʾ�����ѷ���,3��ʾ��ȷ���ջ���4��ʾ�����ۣ�5��ʾ��ȡ����Ĭ��0
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

--������Ϣ��,�洢��������Ʒ��Ϣ,�����������o_id,�Լ���Ʒ����g_id
create table p_orders_info(
       o_id number not null,
       g_id number not null,
       i_num number not null,
       i_price number(10,2) not null,
       foreign key(o_id) references p_orders(o_id) on delete cascade,
       foreign key(g_id) references p_goods(g_id) on delete cascade
);

--���ﳵ��,����û�����u_id�Լ���Ʒ����g_id,��Ʒ��Ĭ��1
create table p_cart(
       u_id number not null,
       g_id number not null,
       i_num number default 1 not null,
       foreign key(u_id) references p_users(u_id) on delete cascade,
       foreign key(g_id) references p_goods(g_id) on delete cascade
);


--��������,����u_id
create sequence u_id_seq
minvalue 1
start with 1
increment by 1
;

--��Ӧ������
create or replace trigger u_id_trigger       
before insert on p_users       
for each row       
begin       
select u_id_seq.nextval into :new.u_id from dual;    
end u_id_trigger; 
  
--��������,����g_id
create sequence g_id_seq
minvalue 1
start with 1
increment by 1;

--��Ӧ������
create or replace trigger g_id_trigger       
before insert on p_goods       
for each row       
begin       
select g_id_seq.nextval into :new.g_id from dual;    
end g_id_trigger;   

--��������,����c_id
create sequence c_id_seq
minvalue 1
start with 1
increment by 1;

--��Ӧ������
create or replace trigger c_id_trigger        
before insert on p_category       
for each row       
begin       
select c_id_seq.nextval into :new.c_id from dual;      
end c_id_trigger;   

--��������,����o_id
create sequence o_id_seq
minvalue 1
start with 1
increment by 1;

--��Ӧ������
create or replace trigger o_id_trigger       
before insert on p_orders       
for each row       
begin       
select o_id_seq.nextval into :new.o_id from dual;  
end o_id_trigger;   















