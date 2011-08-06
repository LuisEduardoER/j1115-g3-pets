--��������,����u_id
create sequence u_id_seq
minvalue 1
start with 10000
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
--��ɾ��g_id�Ĵ�����

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
--��ɾ��o_id�Ĵ�����