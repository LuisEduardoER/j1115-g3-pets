--添加了一些初始的用户，商品等数据
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (1, 0, '狗类');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (2, 0, '猫类');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (3, 0, '兔类等');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (4, 0, '鸟类');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (5, 0, '鱼类');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (6, 0, '龟类');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (7, 1, '狗');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (8, 2, '猫');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (9, 3, '兔');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (10, 4, '鸟');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (11, 5, '鱼');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (12, 6, '龟');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (13, 1, '狗食品');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (14, 2, '猫食品');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (15, 3, '兔子食品');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (16, 4, '鸟类食品');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (17, 5, '鱼类食品');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (18, 6, '龟类食品');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (19, 1, '狗日常用品');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (20, 2, '猫日常用品');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (21, 3, '兔日常用品');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (22, 4, '鸟日常用品');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (23, 5, '鱼类用品');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (24, 6, '龟类用品');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (25, 1, '狗药品');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (26, 2, '猫药品');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (27, 3, '兔子药品');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (28, 4, '鸟类药品');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (29, 5, '鱼类药品');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (30, 6, '龟类药品');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (31, 13, '狗粮');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (32, 14, '猫粮');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (33, 15, '兔粮');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (34, 16, '鸟食');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (35, 17, '鱼食');
insert into P_CATEGORY (C_ID, P_ID, C_NAME)
values (36, 18, '龟食');
commit;

insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (1, 7, '可爱小狗', 200, 2, '可爱的小狗');
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (2, 8, '新生猫咪', 180, 3, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (3, 9, '自家养小兔', 40, 5, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (4, 10, '虎皮鹦鹉', 60, 4, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (5, 11, '特种金鱼', 10, 20, null);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF)
values (6, 12, '陆龟', 120, 15, null);
commit;

insert into P_USERS (U_ID, U_NAME, U_PASS, U_IDENTITY, U_MONEY)
values (1, 'Administrator', '123456', 0, 500);
insert into P_USERS (U_ID, U_NAME, U_PASS, U_IDENTITY, U_MONEY)
values (3, 'user1', '123456', 1, 500);
insert into P_USERS (U_ID, U_NAME, U_PASS, U_IDENTITY, U_MONEY)
values (4, 'user2', '123456', 1, 500);
commit;