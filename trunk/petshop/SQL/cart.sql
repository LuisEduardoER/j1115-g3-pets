prompt PL/SQL Developer import file
prompt Created on 2011年8月1日星期一 by Administrator
set feedback off
set define off
prompt Disabling triggers for P_CART...
alter table P_CART disable all triggers;
prompt Disabling foreign key constraints for P_CART...
alter table P_CART disable constraint SYS_C005342;
alter table P_CART disable constraint SYS_C005343;
prompt Deleting P_CART...
delete from P_CART;
commit;
prompt Loading P_CART...
insert into P_CART (U_ID, G_ID, I_NUM)
values (17, 17, 2);
insert into P_CART (U_ID, G_ID, I_NUM)
values (17, 20, 5);
insert into P_CART (U_ID, G_ID, I_NUM)
values (17, 25, 9);
insert into P_CART (U_ID, G_ID, I_NUM)
values (17, 33, 9);
commit;
prompt 4 records loaded
prompt Enabling foreign key constraints for P_CART...
alter table P_CART enable constraint SYS_C005342;
alter table P_CART enable constraint SYS_C005343;
prompt Enabling triggers for P_CART...
alter table P_CART enable all triggers;
set feedback on
set define on
prompt Done.
