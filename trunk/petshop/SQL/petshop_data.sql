--�����һЩ��ʼ���û�����Ʒ������
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (1, 0, '����');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (2, 0, 'è��');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (3, 0, '�����');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (4, 0, '����');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (5, 0, '����');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (6, 0, '����');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (7, 1, '��');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (8, 2, 'è');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (9, 3, '��');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (10, 4, '��');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (11, 5, '��');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (12, 6, '��');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (13, 1, '��ʳƷ');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (14, 2, 'èʳƷ');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (15, 3, '����ʳƷ');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (16, 4, '����ʳƷ');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (17, 5, '����ʳƷ');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (18, 6, '����ʳƷ');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (19, 1, '���ճ���Ʒ');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (20, 2, 'è�ճ���Ʒ');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (21, 3, '���ճ���Ʒ');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (22, 4, '���ճ���Ʒ');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (23, 5, '������Ʒ');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (24, 6, '������Ʒ');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (25, 1, '��ҩƷ');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (26, 2, 'èҩƷ');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (27, 3, '����ҩƷ');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (28, 4, '����ҩƷ');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (29, 5, '����ҩƷ');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (30, 6, '����ҩƷ');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (31, 13, '����');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (32, 14, 'è��');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (33, 15, '����');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (34, 16, '��ʳ');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (35, 17, '��ʳ');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (36, 18, '��ʳ');
commit;

insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (1, 7, '�ɰ�С��', 200, 2, '�ɰ���С��');
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (2, 8, '����è��', 180, 3, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (3, 9, '�Լ���С��', 40, 5, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (4, 10, '��Ƥ����', 60, 4, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (5, 11, '���ֽ���', 10, 20, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (6, 12, '½��', 120, 15, null);
commit;

insert into P_USERS (U_ID, U_NAME, U_PASS, U_IDENTITY, U_MONEY)
values (1, 'Administrator', '123456', 0, 500);
insert into P_USERS (U_ID, U_NAME, U_PASS, U_IDENTITY, U_MONEY)
values (3, 'user1', '123456', 1, 500);
insert into P_USERS (U_ID, U_NAME, U_PASS, U_IDENTITY, U_MONEY)
values (4, 'user2', '123456', 1, 500);
commit;