prompt PL/SQL Developer import file
prompt Created on 2011��8��2�����ڶ� by Administrator
set feedback off
set define off
prompt Disabling triggers for P_CATEGORY...
alter table P_CATEGORY disable all triggers;
prompt Disabling triggers for P_GOODS...
alter table P_GOODS disable all triggers;
prompt Disabling triggers for P_USERS...
alter table P_USERS disable all triggers;
prompt Disabling triggers for P_CART...
alter table P_CART disable all triggers;
prompt Disabling triggers for P_ORDERS...
alter table P_ORDERS disable all triggers;
prompt Disabling triggers for P_ORDERS_INFO...
alter table P_ORDERS_INFO disable all triggers;
prompt Disabling foreign key constraints for P_GOODS...
alter table P_GOODS disable constraint SYS_C005475;
prompt Disabling foreign key constraints for P_CART...
alter table P_CART disable constraint SYS_C005493;
alter table P_CART disable constraint SYS_C005494;
prompt Disabling foreign key constraints for P_ORDERS...
alter table P_ORDERS disable constraint SYS_C005483;
prompt Disabling foreign key constraints for P_ORDERS_INFO...
alter table P_ORDERS_INFO disable constraint SYS_C005488;
alter table P_ORDERS_INFO disable constraint SYS_C005489;
prompt Deleting P_ORDERS_INFO...
delete from P_ORDERS_INFO;
commit;
prompt Deleting P_ORDERS...
delete from P_ORDERS;
commit;
prompt Deleting P_CART...
delete from P_CART;
commit;
prompt Deleting P_USERS...
delete from P_USERS;
commit;
prompt Deleting P_GOODS...
delete from P_GOODS;
commit;
prompt Deleting P_CATEGORY...
delete from P_CATEGORY;
commit;
prompt Loading P_CATEGORY...
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (1, 0, 'dog_shop');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (2, 0, 'cat_shop');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (3, 0, 'small_petshop');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (4, 0, 'bird_shop');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (5, 0, 'fish_shop');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (6, 0, 'reptile_shop');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (7, 1, 'dogs');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (8, 1, 'dog_essentials');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (9, 1, 'dog_food');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (10, 1, 'dog_medicines');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (11, 2, 'cats');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (12, 2, 'cat_essentials');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (13, 2, 'cat_food');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (14, 2, 'cat_medicines');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (15, 3, 'small_pets');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (16, 3, 'small_pet_essentials');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (17, 3, 'small_pet_food');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (18, 3, 'small_pet_medicines');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (19, 4, 'birds');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (20, 4, 'bird_essentials');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (21, 4, 'bird_food');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (22, 4, 'bird_medicines');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (23, 5, 'fishes');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (24, 5, 'fish_essentials');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (25, 5, 'fish_food');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (26, 5, 'fish_medicines');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (27, 6, 'reptiles');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (28, 6, 'reptile_essentials');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (29, 6, 'reptile_food');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (30, 6, 'reptile_medicines');
commit;
prompt 30 records loaded
prompt Loading P_GOODS...
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (1, 7, '����������ë����', 1000, 2, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (2, 8, '���ƹ���', 320.5, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (3, 9, '���ƹ���', 50, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (4, 10, '����ȥʭ��', 21.6, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (5, 11, '�ո����۶�è', 360, 3, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (6, 12, 'è��С��', 89.9, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (7, 13, '��ζè��', 42.3, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (8, 14, 'è��ȥʭ��', 12.4, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (9, 15, '������', 20, 25, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (10, 16, '��������', 30, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (11, 17, '�������', 23.1, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (12, 18, 'С��������', 5.6, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (13, 19, '��Ƥ����', 32, 30, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (14, 20, '����', 60, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (15, 21, '������ʳ', 30.6, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (16, 22, '��������ϴ�Ӽ�', 15, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (17, 23, '�ȴ���', 12, 60, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (18, 24, '���', 45, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (19, 25, '������ʳ', 10, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (20, 26, '���������', 6.4, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (21, 27, '½��', 230, 20, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (22, 28, '½����͸�', 50, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (23, 29, '½�����ø����߲�', 30.7, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (24, 30, '½�껤��Һ', 20.9, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (63, 7, '΢Ц��ʹ��ĦҮ����Ȯ', 3600, 10, '΢Ц��ʹ��ĦҮ��һ���°��˻�', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (64, 7, '�߾�����Ȯ', 3388, 20, '�߾�����Ȯ���� ֧��֧���� ������Ȯ���� �����½���Q23 ', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (66, 7, 'Լ����', 2500, 3, '��ƷԼ���ı��� ��Ʒ�ְ����� ֧��֧����', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (67, 8, '�������㲨', 9.8, 300, '��ά������Ʒ �����㲨��ԡ¶ ��ë����(޹�²�����500ml) ���㲨', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (68, 8, 'ǣ����', 36, 100, 'B040156�Զ�����ǣ��������״�� 3��/30kg ǣ���� ������', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (69, 8, 'ָ�׼�', 29, 479, '�ձ�Petio�綯�����Զ�ĥ���� ����綯ĥ���� ����ĥ���� ָ�׼� ', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (70, 8, '��������', 38, 5, 'FMJ ����FURminator������ ������ë����ë�� ���� �������� ���', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (71, 9, 'ԭ֭ţƤ��˾���ľ�', 10, 100, 'ԭ֭ţƤ��˾���ľ�4ö/5.5�� ���ֿ�ζ ����ҧ��/������ʳ', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (72, 9, 'ţƤѹ��ţ��', 5.8, 210, '514153 ���� ţƤѹ��ţ��+���ܲ�ҧ��(2֧װ) 80g', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (73, 9, '�䱦Ȯ��', 7.5, 101, '��ɱ���䱦Ȯ���䱦����3+ͻ���䷽Ҷ����������Ȯ/ԭװ500g ', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (74, 9, '����Ƭ', 24, 500, '����������ϵ��-����Ƭ4ɫ��װ390g 123085 ������ʳ ���ĥ�� ', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (45, 7, '���ֽ�������', 1800, 45, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (75, 7, '�����˹Ȯ', 25000, 1, 'FCI��֤Ȯ�ᴿ����оƬ��֤��ľ�Ʒ�����˹˧�籦��ת�ó��� ', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (76, 7, '�����', 1699, 1, '��ţȮҵ����һֻƯ���Ĵ����MM', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (77, 7, '����ʿ�»�', 1399, 5, '�� ��100%��������ʿ�»�--�ǳ��ɰ�~�ʺϼ����� ��֧��֧���� ', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (78, 7, '���ߵع�', 2036, 1, '���ߵذ׹������ߵؼ��������ߵع������ߵ�Ȯ��������19 ', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (79, 7, '�Լҷ�ֳ���ͷ���� ', 2200, 21, '����ʵ���ա��Լҷ�ֳ���ͷ����', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (80, 7, '����С����', 2500, 5, '��ǿȮҵ���۳��ﹷ��/����С������Ȯ/����Ȯ/���ְױ��� ', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (81, 7, '������Ȯ�߾�����Ȯ��Ȯ', 4199, 10, '����ӡ��Ȯ����۴�����Ȯ�߾�����Ȯ��Ȯ ���ﹷ�� �͹���Ʒ', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (82, 7, '��ʿ��', 988, 9, '�ɰ��̻�ɫ��ʿ����Ȯ ', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (83, 7, '����ѩ����', 1099, 1, '��������ѩ����-��������(��)SCHNAUZER�����ʹ�������֧��֧���� ', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (84, 7, '���ֹ���', 5888, 1, '���ֹ�����Ȯ������Ȯ����ھ�������֧��֧����', 0, 0);
commit;
prompt 46 records loaded
prompt Loading P_USERS...
insert into P_USERS (U_ID, U_NAME, U_PASS, U_IDENTITY, U_MONEY)
values (1, 'Administrator', '123456', 0, 0);
insert into P_USERS (U_ID, U_NAME, U_PASS, U_IDENTITY, U_MONEY)
values (2, 'user1', '111', 1, 500);
insert into P_USERS (U_ID, U_NAME, U_PASS, U_IDENTITY, U_MONEY)
values (3, 'user2', '123456', 1, 500);
insert into P_USERS (U_ID, U_NAME, U_PASS, U_IDENTITY, U_MONEY)
values (21, 'user3', '111', 1, 500);
commit;
prompt 4 records loaded
prompt Loading P_CART...
insert into P_CART (U_ID, G_ID, I_NUM)
values (2, 17, 5);
insert into P_CART (U_ID, G_ID, I_NUM)
values (2, 20, 6);
insert into P_CART (U_ID, G_ID, I_NUM)
values (2, 24, 7);
insert into P_CART (U_ID, G_ID, I_NUM)
values (2, 22, 2);
commit;
prompt 4 records loaded
prompt Loading P_ORDERS...
insert into P_ORDERS (O_ID, U_ID, O_TIME, O_RECEIVER, O_ADDRESS, O_PHONE, O_STATE, O_TYPE)
values (1, 2, to_date('02-08-2011 15:31:59', 'dd-mm-yyyy hh24:mi:ss'), 'sdsd', 'sdsdfsdf', 13213213, 0, 2);
insert into P_ORDERS (O_ID, U_ID, O_TIME, O_RECEIVER, O_ADDRESS, O_PHONE, O_STATE, O_TYPE)
values (2, 2, to_date('02-08-2011 15:33:36', 'dd-mm-yyyy hh24:mi:ss'), 'sdsd', 'sdsdfsdf', 13213213, 0, 1);
commit;
prompt 2 records loaded
prompt Loading P_ORDERS_INFO...
prompt Table is empty
prompt Enabling foreign key constraints for P_GOODS...
alter table P_GOODS enable constraint SYS_C005475;
prompt Enabling foreign key constraints for P_CART...
alter table P_CART enable constraint SYS_C005493;
alter table P_CART enable constraint SYS_C005494;
prompt Enabling foreign key constraints for P_ORDERS...
alter table P_ORDERS enable constraint SYS_C005483;
prompt Enabling foreign key constraints for P_ORDERS_INFO...
alter table P_ORDERS_INFO enable constraint SYS_C005488;
alter table P_ORDERS_INFO enable constraint SYS_C005489;
prompt Enabling triggers for P_CATEGORY...
alter table P_CATEGORY enable all triggers;
prompt Enabling triggers for P_GOODS...
alter table P_GOODS enable all triggers;
prompt Enabling triggers for P_USERS...
alter table P_USERS enable all triggers;
prompt Enabling triggers for P_CART...
alter table P_CART enable all triggers;
prompt Enabling triggers for P_ORDERS...
alter table P_ORDERS enable all triggers;
prompt Enabling triggers for P_ORDERS_INFO...
alter table P_ORDERS_INFO enable all triggers;
set feedback on
set define on
prompt Done.
