prompt PL/SQL Developer import file
prompt Created on 2011年8月6日 by HQS
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
alter table P_GOODS disable constraint SYS_C005532;
prompt Disabling foreign key constraints for P_CART...
alter table P_CART disable constraint SYS_C005543;
alter table P_CART disable constraint SYS_C005544;
prompt Disabling foreign key constraints for P_ORDERS...
alter table P_ORDERS disable constraint SYS_C005553;
prompt Disabling foreign key constraints for P_ORDERS_INFO...
alter table P_ORDERS_INFO disable constraint SYS_C005559;
alter table P_ORDERS_INFO disable constraint SYS_C005560;
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
insert into P_CATEGORY (c_id, p_id, c_name)
values (1, 0, 'dog_shop');
insert into P_CATEGORY (c_id, p_id, c_name)
values (2, 0, 'cat_shop');
insert into P_CATEGORY (c_id, p_id, c_name)
values (3, 0, 'small_petshop');
insert into P_CATEGORY (c_id, p_id, c_name)
values (4, 0, 'bird_shop');
insert into P_CATEGORY (c_id, p_id, c_name)
values (5, 0, 'fish_shop');
insert into P_CATEGORY (c_id, p_id, c_name)
values (6, 0, 'reptile_shop');
insert into P_CATEGORY (c_id, p_id, c_name)
values (7, 1, 'dogs');
insert into P_CATEGORY (c_id, p_id, c_name)
values (8, 1, 'dog_essentials');
insert into P_CATEGORY (c_id, p_id, c_name)
values (9, 1, 'dog_food');
insert into P_CATEGORY (c_id, p_id, c_name)
values (10, 1, 'dog_medicines');
insert into P_CATEGORY (c_id, p_id, c_name)
values (11, 2, 'cats');
insert into P_CATEGORY (c_id, p_id, c_name)
values (12, 2, 'cat_essentials');
insert into P_CATEGORY (c_id, p_id, c_name)
values (13, 2, 'cat_food');
insert into P_CATEGORY (c_id, p_id, c_name)
values (14, 2, 'cat_medicines');
insert into P_CATEGORY (c_id, p_id, c_name)
values (15, 3, 'small_pets');
insert into P_CATEGORY (c_id, p_id, c_name)
values (16, 3, 'small_pet_essentials');
insert into P_CATEGORY (c_id, p_id, c_name)
values (17, 3, 'small_pet_food');
insert into P_CATEGORY (c_id, p_id, c_name)
values (18, 3, 'small_pet_medicines');
insert into P_CATEGORY (c_id, p_id, c_name)
values (19, 4, 'birds');
insert into P_CATEGORY (c_id, p_id, c_name)
values (20, 4, 'bird_essentials');
insert into P_CATEGORY (c_id, p_id, c_name)
values (21, 4, 'bird_food');
insert into P_CATEGORY (c_id, p_id, c_name)
values (22, 4, 'bird_medicines');
insert into P_CATEGORY (c_id, p_id, c_name)
values (23, 5, 'fishes');
insert into P_CATEGORY (c_id, p_id, c_name)
values (24, 5, 'fish_essentials');
insert into P_CATEGORY (c_id, p_id, c_name)
values (25, 5, 'fish_food');
insert into P_CATEGORY (c_id, p_id, c_name)
values (26, 5, 'fish_medicines');
insert into P_CATEGORY (c_id, p_id, c_name)
values (27, 6, 'reptiles');
insert into P_CATEGORY (c_id, p_id, c_name)
values (28, 6, 'reptile_essentials');
insert into P_CATEGORY (c_id, p_id, c_name)
values (29, 6, 'reptile_food');
insert into P_CATEGORY (c_id, p_id, c_name)
values (30, 6, 'reptile_medicines');
commit;
prompt 30 records loaded
prompt Loading P_GOODS...
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (102, 7, '松狮', 1800, 5, '松狮公的幼犬 支持支付宝 宠物狗狗出售 保三月退换', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (103, 7, '威尔士柯基', 5500, 3, '威尔士柯基/纯种柯基幼犬/CKU认证犬舍KG9I', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (104, 7, '阿拉斯加', 3000, 5, 'ALO4出售纯种阿拉斯加雪橇犬一窝 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (105, 7, '铁包金腊肠', 899, 19, '◣100%纯种铁包金腊肠~可爱听话-公狗◢皇冠信誉！支持上门看狗 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (107, 7, '藏獒', 6500, 100, '【推荐】名獒直子 狮头呦獒 健康保证 支持全国托运ZA162 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (108, 7, '纽芬兰大型犬', 1699, 20, '▉100%纯种的纽芬兰大型犬-聪明听话会看家-母▉支持上门看狗 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (109, 7, '纯种狼狗', 1500, 5, '狗场直销 纯种狼狗 黑贝 德牧 德国牧羊犬 幼犬纯种健康 支付宝 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (110, 7, '苏格兰牧羊犬', 1688, 3, '苏格兰牧羊犬公的狗狗 宠物幼犬出售 支持支付宝交易 生日礼物', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (111, 7, '法国斗牛犬', 1500, 10, '法国斗牛犬 宠物狗狗 纯种 幼犬出售，顶级品质 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (112, 7, '泰迪幼犬', 2800, 50, '纯种 泰迪幼犬 出售【双钻信誉】泰迪犬 宠物犬', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (113, 8, '小狗狗衣服', 15, 100, '宠物衣服小狗狗衣服 夏装特价泰迪扮靓 小蜜蜂%小猴子薄款汗衫 ', 4.5, 2);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (114, 8, '四脚卫衣', 26.5, 210, '宠物衣服狗狗衣服 春夏装新款上市 条纹背带情侣款四脚卫衣 多款 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (115, 8, '宠物剃毛器', 65.8, 60, '宝利宠物电推剪rfcz999 宠物剃毛器 美毛剪电动推子包邮送削发器', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (117, 8, '宠物香水', 15, 320, '小伙伴 宠物香水 除蚤 驱蚊 消炎', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (118, 8, '宠物毛巾', 3.9, 880, '特价 正品带桶装 狗毛巾 宠物毛巾/仿鹿皮/超强吸水毛巾/美容巾 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (119, 8, '宠物梳', 18, 542, '宠物梳 自洁式钢针梳 脱毛梳 狗狗梳子 圆珠 针梳 带保护头', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (120, 8, '狗指甲剪', 13.5, 260, '特价！波波宠物指甲剪 带指甲锉 狗指甲剪 指甲钳 大号 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (121, 8, '拔耳毛钳', 22, 390, '宠物拔耳毛钳 直/弯拔毛钳止血钳14CM(拔耳毛,清理耳垢)', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (122, 8, '狗狗食盆', 14.4, 210, '冲金冠B050106高级烤漆不锈钢 防滑宠物食盆 狗狗食盆 狗碗 水碗 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (123, 8, '滕编席垫子套', 15.9, 100, '凉爽夏季必备 狗窝不再炎热 滕编席垫子套 换洗套替换套 多规格b ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (124, 8, '宠物吹风机', 65, 80, '特价波波 高级宠物吹风机 狗狗吹风机 电吹风 1000w ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (125, 8, '狗嘴套', 15.5, 460, 'RC01优质软塑料制犬用栅栏式狗嘴套 宠物嘴套 7个号子 全犬合适 ', 4, 3);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (126, 8, '狗项圈', 8, 371, '宠物项圈 珍珠项链蝴蝶结铃铛款 猫圈 狗项圈 宠物项链 ', 4, 3);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (127, 8, '宠物饮水器头', 7.5, 264, '特价 便携式饮水嘴 宠物饮水器头 可接矿泉水瓶饮水器具 三皇冠 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (128, 8, '筒式狗包', 75, 140, '优质 筒式宠物箱包 宠物包 筒式狗包 猫包 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (129, 8, '瓢虫变身装 ', 8.8, 220, '春夏秋冬宠物衣服 狗狗衣服 猫衣服猫咪衣服瓢虫变身装 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (130, 9, '散装500g狗粮', 9, 50, '特价 C050107法国皇家A3幼犬粮 散装500g狗粮 狗狗主粮 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (131, 9, '冠能狗粮', 7.6, 100, '冠能狗粮~冠能优启幼犬鸡肉米饭500g（散装）-满10袋 包邮 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (132, 9, '凌采露华幼犬粮', 26.8, 27, '官方EVO凌采露华幼犬粮 鸡肉小颗粒高端天然狗粮500g 泰迪 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (133, 9, '爱慕思优卡', 103, 360, '爆款- 行货阿根廷爱慕斯爱慕思优卡小型犬幼犬狗粮3kg-江浙沪包邮 ', 4, 13);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (134, 9, '珍宝狗粮', 138, 254, '买就送 十四省包邮 珍宝狗粮成犬粮外销包15kg 送2袋狗粮试用包 ', 4, 13);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (135, 9, '宝路', 26.8, 123, '宝路 狗粮 中小型犬成犬粮牛肉1.8kg ', 4, 13);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (136, 9, '纯鲜牛肉棒', 16, 354, '麦健 HACCP标准 质量超好 纯鲜牛肉棒 800克 宠物零食 狗狗零食 ', 4, 13);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (137, 9, '干燥鸡肉', 24.95, 120, '金皇冠 特价极品干燥鸡肉整枝质量超好鸡小胸肉干800克狗狗零食 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (138, 9, '牛肉味洁齿骨', 1, 769, '宠物零食/狗零食/风来客/牛肉味洁齿骨/2.5寸/单支 狗咬胶 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (139, 9, '奶味补钙真羊骨', 7, 157, '宠物零食 狗咬胶 奶味补钙真羊骨约10根装，大小有点不一的 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (140, 9, '香肠', .45, 697, '$/狗零食/鸡肉/香肠/火腿肠/猫狗零食/宠物香肠/买20根7元 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (141, 9, '高钙牛乳棒', 6, 393, '【15元任选3】高钙牛乳棒 洁齿狗零食 可爱蜡笔造型 磨牙除口臭 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (142, 9, '鸡肉串牛皮卷', 4.8, 125, '鸡肉串牛皮卷100g 磨牙洁齿咬胶 宠物狗狗零食 鸡肉 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (143, 9, '乳香牛尾巴', 1, 628, '狗狗 宠物 天然 乳香牛尾巴一元一根 软骨多 耐吃 磨牙补钙零食 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (144, 10, '滴耳液', 1.4, 254, '宠物 硼酸冰片 滴耳液 耳螨特效 /满60瓶包邮 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (145, 10, '皮特芬喷剂', 27, 120, '限时折扣 南京金盾 皮特芬喷剂100ML 宠物真菌皮肤病喷剂 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (146, 10, '复方窝不咳', 29, 100, '皇冠信誉A100525 复方窝不咳 咳嗽（犬窝咳治疗 2-3天见效） ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (147, 10, '正品癣螨净', 4.3, 456, '【秒杀价】新包装 正品癣螨净/宠物皮肤病克星-Y886擦剂 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (148, 10, '福来恩 滴剂', 46, 20, '特价 福来恩 滴剂 增效 加强版 大型犬(20-40kg) 单支 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (149, 10, '滴虫剂', 3.6, 234, '宠爱一生宠物除蚤灭虱滴虫剂/杀灭狗狗螨虫/跳蚤虱子等寄生虫', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (150, 10, '法国威隆耳肤灵', 53, 80, '正品保障 效果显著 狗狗耳部发炎 耳螨 瘙痒 法国威隆耳肤灵10g ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (151, 10, '宠物专用灭虫剂', 22, 90, '[皇冠卖家 假一赔百] 蜱虱消宠物专用灭虫剂500ML ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (152, 10, '益生菌制剂', 3.3, 900, '冲冠促销 EHP肠胃宝益生菌制剂调理肠胃护理 宠物肠炎止泻 单包 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (153, 10, '法国梅里亚6联疫苗', 26, 652, '20127冲五皇冠 特价 法国梅里亚6联疫苗/支 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (154, 10, '拜宠清犬用驱虫药', 18, 320, '040301德国拜耳DrontalPlus拜宠清犬用驱虫药单片拆售18元 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (155, 10, '测试纸套装 ', 24.5, 430, 'ZH2541快灵犬瘟热病毒+犬细小病毒测试纸套装 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (156, 10, '麦酷狗钙片', 29.5, 542, '麦酷狗钙片大骨牛乳钙片458片宠物钙片 猫咪保健品狗狗补钙', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (157, 10, '狗奶粉', 72, 70, '特价！狗奶粉 韩国Both山羊奶粉450g 宠物奶粉 幼犬奶粉 猫奶粉', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (158, 10, '宠物美毛粉', 11, 320, '深海鱼肉粉 进口鱼粉 宠物美毛粉 发毛粉 狗粮伴侣狗狗美毛粉500g ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (159, 10, '果蔬美毛片', 15, 120, '江浙沪满68包邮 笨笨宝宝宠物狗狗果蔬美毛片 200片 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (160, 10, '强力金维他', 12, 100, '兽药 兽用 强力金维他 功效增强抵抗力 促进身体机能发展 500g/件 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (161, 10, '发育宝+钙能量', 83, 60, '美国职业BIO黄金幼犬发育必备套装 发育宝+钙能量带防伪 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (162, 10, '唯尔康美益肠剂', 21, 720, 'A070604唯尔康美益肠剂 调理肠胃 益生菌 增强食欲 犬猫 单板7粒 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (163, 10, '虱蚤清', 15, 60, '雷米高虱蚤清喷剂60ml ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (220, 15, '垂耳兔', 289, 10, '美国长毛垂耳兔' || chr(10) || '品相等级：优+等（可做种公）' || chr(10) || '颜色：极品紫灰色，运输专用笼方面邮买家自行承担' || chr(10) || '', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (221, 28, '半自动型爬虫孵化器', 2640, 5, '有监测可视观察窗是否被打开传感器,动起停循环风风扇', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (222, 28, '爬行动物节能灯', 58, 20, '本公司出品的UVB节能灯均为国外各大知名品牌的UVB节能灯的OEM原灯，专业品质，光谱质量绝对值得信赖！！', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (223, 23, '小热带鱼', 19.8, 20, '孵鱼的时候，一定要用矿泉水或者自来水，自来水必须晒过或者静置24小时后才可以，其他水都不行', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (224, 24, '珊瑚石/造景石/假山', 80, 10, '放在鱼缸里很漂亮', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (206, 9, '商品', 123, 123, '商品', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (1, 7, '家养新生金毛宝宝', 1000, 2, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (2, 8, '定制狗窝', 320.5, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (3, 9, '特制狗粮', 50, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (4, 10, '狗用去虱剂', 21.6, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (5, 11, '苏格兰折耳猫', 360, 3, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (6, 12, '猫用小窝', 89.9, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (7, 13, '鱼味猫粮', 42.3, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (8, 14, '猫用去虱剂', 12.4, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (9, 15, '天竺鼠', 20, 25, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (10, 16, '豚鼠笼子', 30, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (11, 17, '五谷鼠粮', 23.1, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (12, 18, '小鼠消毒剂', 5.6, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (13, 19, '虎皮鹦鹉', 32, 30, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (14, 20, '鸟笼', 60, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (15, 21, '新鲜鸟食', 30.6, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (16, 22, '鸟用驱虫洗涤剂', 15, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (17, 23, '热带鱼', 12, 54, null, 0, 6);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (18, 24, '鱼缸', 45, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (19, 25, '干制鱼食', 10, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (20, 26, '鱼缸消毒剂', 6.4, 92, null, 0, 8);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (21, 27, '陆龟', 230, 20, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (22, 28, '陆龟观赏缸', 50, 90, null, 0, 10);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (23, 29, '陆龟适用干制蔬菜', 30.7, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (24, 30, '陆龟护眼液', 20.9, 93, null, 1.2, 7);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (63, 7, '微笑天使萨摩耶，幼犬', 3600, 10, '微笑天使萨摩耶，一个月包退换', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (64, 7, '边境牧羊犬', 3388, 20, '边境牧羊犬公的 支持支付宝 宠物幼犬出售 保三月健康Q23 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (66, 7, '约克夏', 2500, 3, '极品约克夏宝宝 包品种包健康 支持支付宝', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (67, 8, '宠物用香波', 9.8, 300, '六维宠物用品 宠物香波沐浴露 护毛除臭(薰衣草香型500ml) 狗香波', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (68, 8, '牵引带', 36, 100, 'B040156自动伸缩牵引带（绳状） 3米/30kg 牵引绳 狗绳子', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (69, 8, '指甲剪', 29, 479, '日本Petio电动宠物自动磨甲器 宠物电动磨甲器 宠物磨甲器 指甲剪 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (70, 8, '狗狗梳子', 38, 5, 'FMJ 美国FURminator福美家 神奇脱毛梳褪毛梳 宠物 狗狗梳子 大号', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (71, 9, '原汁牛皮起司酥心卷', 10, 100, '原汁牛皮起司酥心卷4枚/5.5寸 四种口味 狗狗咬胶/狗狗零食', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (72, 9, '牛皮压骨牛奶', 5.8, 210, '514153 卫仕 牛皮压骨牛奶+胡萝卜咬胶(2支装) 80g', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (73, 9, '珍宝犬粮', 7.5, 101, '秒杀！珍宝犬粮珍宝狗粮3+突破配方叶酸和深海鱼油幼犬/原装500g ', 0, 0);
commit;
prompt 100 records committed...
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (74, 9, '五星片', 24, 500, '风来客汪汪系列-五星片4色混装390g 123085 宠物零食 洁齿磨牙 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (164, 11, '暹罗猫', 900, 5, 'HELLO宠屋，淡紫色暹罗猫，暹逻猫DD、MM都有，南昌可自提 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (165, 11, '英国短毛猫', 3000, 1, '◥★◤CAA永久冠军蓝博后代 2011.5.2出生 英国短毛猫 英短 女 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (166, 11, '美国短毛猫', 80000, 5, 'CFA注册棕虎斑加白美国短毛猫小母猫珠珠', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (167, 11, '波斯猫', 12345, 1, '赛级烟黑色波斯猫妹妹', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (168, 11, '英国短毛三花猫', 2900, 3, '可爱的2个大的小花子', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (169, 11, '苏格兰折耳', 8000, 3, '耳朵超赞、身体超好的苏格兰折耳加白妹妹，小猫王 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (171, 11, '异国短毛猫', 2000, 1, '加菲 异国短毛猫 红虎斑加白 MM', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (172, 11, '喜玛拉雅猫', 6000, 2, '喜玛拉雅猫 六个月，包健康 欢迎上门看猫 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (173, 11, '双色异国短毛猫', 10000, 1, '浅三色异国妹妹' || chr(10) || '' || chr(10) || '三月', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (174, 12, '宠物自动喂食器', 38, 200, '宠物用品/宠物自动喂食器/狗/猫/自动饮水器/喂食器/B050440', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (175, 12, '宠物航空箱', 60, 100, '特价【叁皇冠实体店】宠物航空箱（标准飞机笼/外出笼）', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (176, 12, '猫砂', 15, 300, '【楚胜】宠物用 猫砂5L 实惠土砂', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (177, 12, '猫砂铲', 5, 500, '宠物用品　猫猫用品　猫砂铲 狗粮铲 粮食铲', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (178, 12, '宠物木质窝', 300, 10, '台湾IBIYAYA 依比呀呀宠物木质窝 猫狗栏杆床 FF604', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (179, 12, '蜜蜂装', 6.8, 100, '冲钻特价/宠物衣服/吉娃娃/泰迪/比熊/狗衣服猫衣服/蜜蜂装6.8￥', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (180, 12, '逗猫杆', 5, 124, '非常推荐 鱼形逗猫棒 内附猫薄荷 可调逗小猫逗猫杆 Doggy Man', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (181, 12, '逗猫棒', 6, 475, '宠物玩具/猫玩具/兔毛 彩色 极品逗猫棒 F010927 全国满额包邮', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (182, 13, '猫草种植套装', 7.8, 447, '路加宠物.特价水晶猫草种植套装附1500种子 热销万套', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (183, 13, '伟嘉成猫深海鲜鱼妙鲜包', 1.9, 500, '双皇冠信誉 ★★ 伟嘉成猫深海鲜鱼妙鲜包85g (12包/盒)最新到货', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (184, 13, '猫薄荷', 9.9, 107, '【5.5折秒杀】出口正宗花蕾 猫草 猫薄荷 海外20克超大条装', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (185, 13, '猫用罐头', 7.2, 130, '爱喜雅 玛鲁哈黑罐/黑缶金枪鱼加丁香鱼160克猫用罐头', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (186, 13, '散装木天蓼棍', 3, 810, '猫猫最爱的散装木天蓼棍 3元/包', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (187, 13, '艾尔鱼虾猫罐头', 1.5, 796, '【夏季特价 每人限购20】艾尔鱼虾猫罐头\妙鲜包\湿粮\猫粮 120g', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (188, 13, '猫草种子', 1, 880, '猫草种子（麦粒1包，55-60克，1500粒左右，无法做到精确，但是绝对给够秤', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (189, 14, '猫咪化毛膏', 55, 380, '腐败猫咪之_德国Gimpet骏宝猫咪化毛膏[加强型]*100g', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (190, 14, '皮肤病护理药', 20, 19, '{EHP}宠物药品 猫狗通用 真菌性皮肤病 皮肤病护理药 浴液 250ml', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (191, 14, '猫用驱虫药', 22.8, 80, '宠物用品 德国拜耳猫内虫逃-猫用驱虫药 打虫药一粒 内服', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (192, 14, '猫用三联疫苗', 39, 65, '特价 A010105正品英特威猫用三联疫苗保温运输假一罚百', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (193, 14, '猫肝病特效药', 150, 478, '送喂药棒美国Denosyl丹诺仕猫肝病特效药90mg 正品防伪 全国包邮', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (194, 19, '玄凤鹦鹉', 90, 200, '特价 babybird天堂鸟玄凤鹦鹉鸡尾 手养幼鸟分公母 空运全国包活', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (195, 19, '牡丹鹦鹉', 65, 87, '宠物鹦鹉宠物鸟 红头情侣鹦鹉-美国黄桃脸牡丹鹦鹉', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (45, 7, '纯种健康红贵宾', 1800, 45, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (75, 7, '马尔济斯犬', 25000, 1, 'FCI认证犬舍纯种有芯片及证书的精品马尔济斯帅哥宝宝转让出售 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (76, 7, '大白熊', 1699, 1, '蒙牛犬业出售一只漂亮的大白熊MM', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (77, 7, '威尔士柯基', 1399, 5, '▓ ◣100%纯种威尔士柯基--非常可爱~适合家养◢ ▓支持支付宝 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (78, 7, '西高地梗', 2036, 1, '西高地白梗　西高地家养　西高地梗　西高地犬终身保健康19 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (79, 7, '自家繁殖大白头古牧 ', 2200, 21, '★真实拍照★自家繁殖大白头古牧', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (80, 7, '赛级小比熊', 2500, 5, '振强犬业出售宠物狗狗/赛级小比熊幼犬/比熊犬/纯种白比熊 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (81, 7, '纯种名犬边境牧羊犬幼犬', 4199, 10, '心相印名犬舍出售纯种名犬边境牧羊犬幼犬 宠物狗狗 送狗用品', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (82, 7, '哈士奇', 988, 9, '可爱烟灰色哈士奇幼犬 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (83, 7, '迷你雪纳瑞', 1099, 1, '▉◣迷你雪纳瑞-聪明机敏(公)SCHNAUZER◢▉皇冠信誉！支持支付宝 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (84, 7, '纯种古牧', 5888, 1, '纯种古牧幼犬家养公犬宠物冠军赛级狗支持支付宝', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (300, 15, '茶杯兔', 2999, 5, '【新新小宠】迷你茶杯兔cup rabbit 实物拍摄2011040701 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (299, 17, '成兔粮', 15, 200, 'WEITA宠物兔食品 成兔粮 4个月以上适用', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (298, 16, '兔子手提袋', 90, 50, 'Jolly 兔子手提袋 - 藍色 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (280, 17, '苜蓿草砖', 8, 167, '三冠爬满天下宠物兔子龙猫爱吃的磨牙100%纯天然苜蓿草砖500g', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (270, 16, '小型宠物垫', 12, 80, '竺鼠 龙猫 兔子 小型宠物垫、脚垫防刮伤小宠脚丫 CS12 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (260, 18, '球虫净口服液', 3.99, 540, '新一代球虫净口服液 一支 10ML 兔兔药品 专治球虫病和血便 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (250, 15, '极品龙猫', 900, 3, '宠爱ing 极品龙猫 纯白 900起 具体价格请联系店主 ', 0, 0);
commit;
prompt 150 records loaded
prompt Loading P_USERS...
insert into P_USERS (u_id, u_name, u_pass, u_identity, u_money)
values (10002, 'user2', '111', 1, 500);
insert into P_USERS (u_id, u_name, u_pass, u_identity, u_money)
values (10003, 'user3', '111', 1, 500);
insert into P_USERS (u_id, u_name, u_pass, u_identity, u_money)
values (1, 'Administrator', '123456', 0, 0);
insert into P_USERS (u_id, u_name, u_pass, u_identity, u_money)
values (10001, 'user1', '111', 1, 500);
commit;
prompt 4 records loaded
prompt Loading P_CART...
insert into P_CART (u_id, g_id, i_num)
values (10002, 113, 1);
insert into P_CART (u_id, g_id, i_num)
values (10002, 114, 4);
insert into P_CART (u_id, g_id, i_num)
values (10002, 270, 1);
insert into P_CART (u_id, g_id, i_num)
values (10002, 260, 1);
commit;
prompt 4 records loaded
prompt Loading P_ORDERS...
insert into P_ORDERS (o_id, u_id, o_time, o_receiver, o_address, o_phone, o_state, o_type, o_sum)
values (42, 10002, to_date('03-08-2011 15:35:24', 'dd-mm-yyyy hh24:mi:ss'), 'xuguifeng', '计量', 15158109559, 4, null, 7);
insert into P_ORDERS (o_id, u_id, o_time, o_receiver, o_address, o_phone, o_state, o_type, o_sum)
values (43, 10002, to_date('03-08-2011 15:46:53', 'dd-mm-yyyy hh24:mi:ss'), 'xuguifeng', '计量', 15158109559, 4, null, 67);
insert into P_ORDERS (o_id, u_id, o_time, o_receiver, o_address, o_phone, o_state, o_type, o_sum)
values (44, 10002, to_date('03-08-2011 16:23:22', 'dd-mm-yyyy hh24:mi:ss'), 'xuguifeng', '计量', 15158109559, 4, null, 3454);
insert into P_ORDERS (o_id, u_id, o_time, o_receiver, o_address, o_phone, o_state, o_type, o_sum)
values (45, 10002, to_date('03-08-2011 16:25:23', 'dd-mm-yyyy hh24:mi:ss'), 'xuguifeng', '计量', 15158109559, 4, null, 567);
insert into P_ORDERS (o_id, u_id, o_time, o_receiver, o_address, o_phone, o_state, o_type, o_sum)
values (46, 10002, to_date('03-08-2011 16:26:59', 'dd-mm-yyyy hh24:mi:ss'), 'xuguifeng', '计量', 15158109559, 4, null, 67);
insert into P_ORDERS (o_id, u_id, o_time, o_receiver, o_address, o_phone, o_state, o_type, o_sum)
values (1, 10002, to_date('02-08-2011 15:31:59', 'dd-mm-yyyy hh24:mi:ss'), '黄青嵩', '杭州电子科技大学', 15158114051, 1, 2, 67);
commit;
prompt 6 records loaded
prompt Loading P_ORDERS_INFO...
insert into P_ORDERS_INFO (o_id, g_id, i_num, i_price)
values (43, 133, 1, 103);
insert into P_ORDERS_INFO (o_id, g_id, i_num, i_price)
values (43, 134, 1, 138);
insert into P_ORDERS_INFO (o_id, g_id, i_num, i_price)
values (43, 135, 1, 26.8);
insert into P_ORDERS_INFO (o_id, g_id, i_num, i_price)
values (43, 136, 1, 16);
insert into P_ORDERS_INFO (o_id, g_id, i_num, i_price)
values (44, 125, 1, 15.5);
insert into P_ORDERS_INFO (o_id, g_id, i_num, i_price)
values (44, 126, 1, 8);
insert into P_ORDERS_INFO (o_id, g_id, i_num, i_price)
values (45, 126, 1, 8);
insert into P_ORDERS_INFO (o_id, g_id, i_num, i_price)
values (45, 125, 1, 15.5);
insert into P_ORDERS_INFO (o_id, g_id, i_num, i_price)
values (46, 113, 1, 15);
insert into P_ORDERS_INFO (o_id, g_id, i_num, i_price)
values (42, 133, 1, 103);
insert into P_ORDERS_INFO (o_id, g_id, i_num, i_price)
values (42, 134, 1, 138);
insert into P_ORDERS_INFO (o_id, g_id, i_num, i_price)
values (42, 135, 1, 26.8);
insert into P_ORDERS_INFO (o_id, g_id, i_num, i_price)
values (42, 136, 1, 16);
insert into P_ORDERS_INFO (o_id, g_id, i_num, i_price)
values (1, 126, 1, 8);
insert into P_ORDERS_INFO (o_id, g_id, i_num, i_price)
values (1, 133, 1, 103);
commit;
prompt 15 records loaded
prompt Enabling foreign key constraints for P_GOODS...
alter table P_GOODS enable constraint SYS_C005532;
prompt Enabling foreign key constraints for P_CART...
alter table P_CART enable constraint SYS_C005543;
alter table P_CART enable constraint SYS_C005544;
prompt Enabling foreign key constraints for P_ORDERS...
alter table P_ORDERS enable constraint SYS_C005553;
prompt Enabling foreign key constraints for P_ORDERS_INFO...
alter table P_ORDERS_INFO enable constraint SYS_C005559;
alter table P_ORDERS_INFO enable constraint SYS_C005560;
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
