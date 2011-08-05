prompt PL/SQL Developer import file
prompt Created on 2011年8月2日星期二 by Administrator
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
values (1, 7, '家养新生金毛宝宝', 1000, 2, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (2, 8, '定制狗窝', 320.5, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (3, 9, '特制狗粮', 50, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (4, 10, '狗用去虱剂', 21.6, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (5, 11, '苏格兰折耳猫', 360, 3, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (6, 12, '猫用小窝', 89.9, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (7, 13, '鱼味猫粮', 42.3, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (8, 14, '猫用去虱剂', 12.4, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (9, 15, '天竺鼠', 20, 25, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (10, 16, '豚鼠笼子', 30, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (11, 17, '五谷鼠粮', 23.1, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (12, 18, '小鼠消毒剂', 5.6, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (13, 19, '虎皮鹦鹉', 32, 30, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (14, 20, '鸟笼', 60, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (15, 21, '新鲜鸟食', 30.6, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (16, 22, '鸟用驱虫洗涤剂', 15, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (17, 23, '热带鱼', 12, 60, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (18, 24, '鱼缸', 45, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (19, 25, '干制鱼食', 10, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (20, 26, '鱼缸消毒剂', 6.4, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (21, 27, '陆龟', 230, 20, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (22, 28, '陆龟观赏缸', 50, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (23, 29, '陆龟适用干制蔬菜', 30.7, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (24, 30, '陆龟护眼液', 20.9, 100, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (63, 7, '微笑天使萨摩耶，幼犬', 3600, 10, '微笑天使萨摩耶，一个月包退换', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (64, 7, '边境牧羊犬', 3388, 20, '边境牧羊犬公的 支持支付宝 宠物幼犬出售 保三月健康Q23 ', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (66, 7, '约克夏', 2500, 3, '极品约克夏宝宝 包品种包健康 支持支付宝', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (67, 8, '宠物用香波', 9.8, 300, '六维宠物用品 宠物香波沐浴露 护毛除臭(薰衣草香型500ml) 狗香波', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (68, 8, '牵引带', 36, 100, 'B040156自动伸缩牵引带（绳状） 3米/30kg 牵引绳 狗绳子', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (69, 8, '指甲剪', 29, 479, '日本Petio电动宠物自动磨甲器 宠物电动磨甲器 宠物磨甲器 指甲剪 ', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (70, 8, '狗狗梳子', 38, 5, 'FMJ 美国FURminator福美家 神奇脱毛梳褪毛梳 宠物 狗狗梳子 大号', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (71, 9, '原汁牛皮起司酥心卷', 10, 100, '原汁牛皮起司酥心卷4枚/5.5寸 四种口味 狗狗咬胶/狗狗零食', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (72, 9, '牛皮压骨牛奶', 5.8, 210, '514153 卫仕 牛皮压骨牛奶+胡萝卜咬胶(2支装) 80g', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (73, 9, '珍宝犬粮', 7.5, 101, '秒杀！珍宝犬粮珍宝狗粮3+突破配方叶酸和深海鱼油幼犬/原装500g ', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (74, 9, '五星片', 24, 500, '风来客汪汪系列-五星片4色混装390g 123085 宠物零食 洁齿磨牙 ', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (45, 7, '纯种健康红贵宾', 1800, 45, null, 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (75, 7, '马尔济斯犬', 25000, 1, 'FCI认证犬舍纯种有芯片及证书的精品马尔济斯帅哥宝宝转让出售 ', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (76, 7, '大白熊', 1699, 1, '蒙牛犬业出售一只漂亮的大白熊MM', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (77, 7, '威尔士柯基', 1399, 5, '▓ ◣100%纯种威尔士柯基--非常可爱~适合家养◢ ▓支持支付宝 ', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (78, 7, '西高地梗', 2036, 1, '西高地白梗　西高地家养　西高地梗　西高地犬终身保健康19 ', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (79, 7, '自家繁殖大白头古牧 ', 2200, 21, '★真实拍照★自家繁殖大白头古牧', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (80, 7, '赛级小比熊', 2500, 5, '振强犬业出售宠物狗狗/赛级小比熊幼犬/比熊犬/纯种白比熊 ', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (81, 7, '纯种名犬边境牧羊犬幼犬', 4199, 10, '心相印名犬舍出售纯种名犬边境牧羊犬幼犬 宠物狗狗 送狗用品', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (82, 7, '哈士奇', 988, 9, '可爱烟灰色哈士奇幼犬 ', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (83, 7, '迷你雪纳瑞', 1099, 1, '▉◣迷你雪纳瑞-聪明机敏(公)SCHNAUZER◢▉皇冠信誉！支持支付宝 ', 0, 0);
insert into P_GOODS (G_ID, C_ID, G_NAME, G_PRICE, G_NUM, G_BRIEF, G_SCORE, G_SOLD)
values (84, 7, '纯种古牧', 5888, 1, '纯种古牧幼犬家养公犬宠物冠军赛级狗支持支付宝', 0, 0);
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
