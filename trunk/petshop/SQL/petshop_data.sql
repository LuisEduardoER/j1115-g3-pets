--�����һЩ��ʼ���û�����Ʒ������
delete from P_USERS;
commit;
--prompt Loading P_USERS...
insert into P_USERS (U_ID, U_NAME, U_PASS, U_IDENTITY, U_MONEY)
values (1, 'Administrator', '123456', 0, 0);
insert into P_USERS (U_ID, U_NAME, U_PASS, U_IDENTITY, U_MONEY)
values (2, 'user1', '123456', 1, 500);
insert into P_USERS (U_ID, U_NAME, U_PASS, U_IDENTITY, U_MONEY)
values (3, 'user2', '123456', 1, 500);
commit;

delete from P_CATEGORY;
commit;
--prompt Loading P_CATEGORY...
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

delete from P_GOODS;
commit;
--prompt Loading P_GOODS...
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (1, 7, '����������ë����', 1000, 2, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (2, 8, '���ƹ���', 320.5, 100, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (3, 9, '���ƹ���', 50, 100, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (4, 10, '����ȥʭ��', 21.6, 100, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (5, 11, '�ո����۶�è', 360, 3, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (6, 12, 'è��С��', 89.9, 100, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (7, 13, '��ζè��', 42.3, 100, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (8, 14, 'è��ȥʭ��', 12.4, 100, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (9, 15, '������', 20, 25, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (10, 16, '��������', 30, 100, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (11, 17, '�������', 23.1, 100, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (12, 18, 'С��������', 5.6, 100, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (13, 19, '��Ƥ����', 32, 30, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (14, 20, '����', 60, 100, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (15, 21, '������ʳ', 30.6, 100, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (16, 22, '��������ϴ�Ӽ�', 15, 100, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (17, 23, '�ȴ���', 12, 60, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (18, 24, '���', 45, 100, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (19, 25, '������ʳ', 10, 100, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (20, 26, '���������', 6.4, 100, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (21, 27, '½��', 230, 20, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (22, 28, '½����͸�', 50, 100, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (23, 29, '½�����ø����߲�', 30.7, 100, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (24, 30, '����������', 20.9, 100, null);
commit;
