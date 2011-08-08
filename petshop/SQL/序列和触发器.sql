--自增序列,用于u_id
create sequence u_id_seq
minvalue 1
start with 10000
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
--已删除g_id的触发器

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
--已删除o_id的触发器