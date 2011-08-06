prompt PL/SQL Developer import file
prompt Created on 2011��8��6�� by HQS
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
values (102, 7, '��ʨ', 1800, 5, '��ʨ������Ȯ ֧��֧���� ���ﹷ������ �������˻�', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (103, 7, '����ʿ�»�', 5500, 3, '����ʿ�»�/���ֿ»���Ȯ/CKU��֤Ȯ��KG9I', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (104, 7, '����˹��', 3000, 5, 'ALO4���۴��ְ���˹��ѩ��Ȯһ�� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (105, 7, '����������', 899, 19, '��100%��������������~�ɰ�����-�������ʹ�������֧�����ſ��� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (107, 7, '����', 6500, 100, '���Ƽ�������ֱ�� ʨͷ���� ������֤ ֧��ȫ������ZA162 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (108, 7, 'Ŧ��������Ȯ', 1699, 20, '��100%���ֵ�Ŧ��������Ȯ-���������ῴ��-ĸ��֧�����ſ��� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (109, 7, '�����ǹ�', 1500, 5, '����ֱ�� �����ǹ� �ڱ� ���� �¹�����Ȯ ��Ȯ���ֽ��� ֧���� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (110, 7, '�ո�������Ȯ', 1688, 3, '�ո�������Ȯ���Ĺ��� ������Ȯ���� ֧��֧�������� ��������', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (111, 7, '������ţȮ', 1500, 10, '������ţȮ ���ﹷ�� ���� ��Ȯ���ۣ�����Ʒ�� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (112, 7, '̩����Ȯ', 2800, 50, '���� ̩����Ȯ ���ۡ�˫��������̩��Ȯ ����Ȯ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (113, 8, 'С�����·�', 15, 100, '�����·�С�����·� ��װ�ؼ�̩�ϰ��� С�۷�%С���ӱ���� ', 4.5, 2);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (114, 8, '�Ľ�����', 26.5, 210, '�����·������·� ����װ�¿����� ���Ʊ������¿��Ľ����� ��� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (115, 8, '������ë��', 65.8, 60, '����������Ƽ�rfcz999 ������ë�� ��ë���綯���Ӱ�����������', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (117, 8, '������ˮ', 15, 320, 'С��� ������ˮ ���� ���� ����', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (118, 8, '����ë��', 3.9, 880, '�ؼ� ��Ʒ��Ͱװ ��ë�� ����ë��/��¹Ƥ/��ǿ��ˮë��/���ݽ� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (119, 8, '������', 18, 542, '������ �Խ�ʽ������ ��ë�� �������� Բ�� ���� ������ͷ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (120, 8, '��ָ�׼�', 13.5, 260, '�ؼۣ���������ָ�׼� ��ָ��� ��ָ�׼� ָ��ǯ ��� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (121, 8, '�ζ�ëǯ', 22, 390, '����ζ�ëǯ ֱ/���ëǯֹѪǯ14CM(�ζ�ë,�������)', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (122, 8, '����ʳ��', 14.4, 210, '����B050106�߼����᲻��� ��������ʳ�� ����ʳ�� ���� ˮ�� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (123, 8, '����ϯ������', 15.9, 100, '��ˬ�ļ��ر� ���Ѳ������� ����ϯ������ ��ϴ���滻�� ����b ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (124, 8, '���ﴵ���', 65, 80, '�ؼ۲��� �߼����ﴵ��� ��������� �紵�� 1000w ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (125, 8, '������', 15.5, 460, 'RC01������������Ȯ��դ��ʽ������ �������� 7������ ȫȮ���� ', 4, 3);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (126, 8, '����Ȧ', 8, 371, '������Ȧ �������������������� èȦ ����Ȧ �������� ', 4, 3);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (127, 8, '������ˮ��ͷ', 7.5, 264, '�ؼ� ��Яʽ��ˮ�� ������ˮ��ͷ �ɽӿ�Ȫˮƿ��ˮ���� ���ʹ� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (128, 8, 'Ͳʽ����', 75, 140, '���� Ͳʽ������� ����� Ͳʽ���� è�� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (129, 8, 'ư�����װ ', 8.8, 220, '�����ﶬ�����·� �����·� è�·�è���·�ư�����װ ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (130, 9, 'ɢװ500g����', 9, 50, '�ؼ� C050107�����ʼ�A3��Ȯ�� ɢװ500g���� �������� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (131, 9, '���ܹ���', 7.6, 100, '���ܹ���~����������Ȯ�����׷�500g��ɢװ��-��10�� ���� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (132, 9, '���¶����Ȯ��', 26.8, 27, '�ٷ�EVO���¶����Ȯ�� ����С�����߶���Ȼ����500g ̩�� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (133, 9, '��Ľ˼�ſ�', 103, 360, '����- �л�����͢��Ľ˹��Ľ˼�ſ�С��Ȯ��Ȯ����3kg-���㻦���� ', 4, 13);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (134, 9, '�䱦����', 138, 254, '����� ʮ��ʡ���� �䱦������Ȯ��������15kg ��2���������ð� ', 4, 13);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (135, 9, '��·', 26.8, 123, '��· ���� ��С��Ȯ��Ȯ��ţ��1.8kg ', 4, 13);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (136, 9, '����ţ���', 16, 354, '�� HACCP��׼ �������� ����ţ��� 800�� ������ʳ ������ʳ ', 4, 13);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (137, 9, '���Ｆ��', 24.95, 120, '��ʹ� �ؼۼ�Ʒ���Ｆ����֦�������ü�С�����800�˹�����ʳ ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (138, 9, 'ţ��ζ��ݹ�', 1, 769, '������ʳ/����ʳ/������/ţ��ζ��ݹ�/2.5��/��֧ ��ҧ�� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (139, 9, '��ζ���������', 7, 157, '������ʳ ��ҧ�� ��ζ���������Լ10��װ����С�е㲻һ�� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (140, 9, '�㳦', .45, 697, '$/����ʳ/����/�㳦/���ȳ�/è����ʳ/�����㳦/��20��7Ԫ ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (141, 9, '�߸�ţ���', 6, 393, '��15Ԫ��ѡ3���߸�ţ��� ��ݹ���ʳ �ɰ��������� ĥ�����ڳ� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (142, 9, '���⴮ţƤ��', 4.8, 125, '���⴮ţƤ��100g ĥ�����ҧ�� ���ﹷ����ʳ ���� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (143, 9, '����ţβ��', 1, 628, '���� ���� ��Ȼ ����ţβ��һԪһ�� ��Ƕ� �ͳ� ĥ��������ʳ ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (144, 10, '�ζ�Һ', 1.4, 254, '���� �����Ƭ �ζ�Һ ������Ч /��60ƿ���� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (145, 10, 'Ƥ�ط����', 27, 120, '��ʱ�ۿ� �Ͼ���� Ƥ�ط����100ML �������Ƥ������� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (146, 10, '�����Ѳ���', 29, 100, '�ʹ�����A100525 �����Ѳ��� ���ԣ�Ȯ�ѿ����� 2-3���Ч�� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (147, 10, '��ƷѢ����', 4.3, 456, '����ɱ�ۡ��°�װ ��ƷѢ����/����Ƥ��������-Y886���� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (148, 10, '������ �μ�', 46, 20, '�ؼ� ������ �μ� ��Ч ��ǿ�� ����Ȯ(20-40kg) ��֧ ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (149, 10, '�γ��', 3.6, 234, '�谮һ�����������ʭ�γ��/ɱ�𹷹�����/����ʭ�ӵȼ�����', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (150, 10, '������¡������', 53, 80, '��Ʒ���� Ч������ ������������ ���� ���� ������¡������10g ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (151, 10, '����ר������', 22, 90, '[�ʹ����� ��һ���] ��ʭ������ר������500ML ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (152, 10, '�������Ƽ�', 3.3, 900, '��ڴ��� EHP��θ���������Ƽ�����θ���� ���ﳦ��ֹк ���� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (153, 10, '����÷����6������', 26, 652, '20127����ʹ� �ؼ� ����÷����6������/֧ ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (154, 10, '�ݳ���Ȯ������ҩ', 18, 320, '040301�¹��ݶ�DrontalPlus�ݳ���Ȯ������ҩ��Ƭ����18Ԫ ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (155, 10, '����ֽ��װ ', 24.5, 430, 'ZH2541����Ȯ���Ȳ���+ȮϸС��������ֽ��װ ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (156, 10, '��ṷ��Ƭ', 29.5, 542, '��ṷ��Ƭ���ţ���Ƭ458Ƭ�����Ƭ è�䱣��Ʒ��������', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (157, 10, '���̷�', 72, 70, '�ؼۣ����̷� ����Bothɽ���̷�450g �����̷� ��Ȯ�̷� è�̷�', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (158, 10, '������ë��', 11, 320, '������ ������� ������ë�� ��ë�� �������¹�����ë��500g ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (159, 10, '������ëƬ', 15, 120, '���㻦��68���� �����������ﹷ��������ëƬ 200Ƭ ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (160, 10, 'ǿ����ά��', 12, 100, '��ҩ ���� ǿ����ά�� ��Ч��ǿ�ֿ��� �ٽ�������ܷ�չ 500g/�� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (161, 10, '������+������', 83, 60, '����ְҵBIO�ƽ���Ȯ�����ر���װ ������+����������α ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (162, 10, 'Ψ�������泦��', 21, 720, 'A070604Ψ�������泦�� ����θ ������ ��ǿʳ�� Ȯè ����7�� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (163, 10, 'ʭ����', 15, 60, '���׸�ʭ�������60ml ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (220, 15, '������', 289, 10, '������ë������' || chr(10) || 'Ʒ��ȼ�����+�ȣ������ֹ���' || chr(10) || '��ɫ����Ʒ�ϻ�ɫ������ר����������������ге�' || chr(10) || '', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (221, 28, '���Զ������������', 2640, 5, '�м����ӹ۲촰�Ƿ񱻴򿪴�����,����ͣѭ�������', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (222, 28, '���ж�����ܵ�', 58, 20, '����˾��Ʒ��UVB���ܵƾ�Ϊ�������֪��Ʒ�Ƶ�UVB���ܵƵ�OEMԭ�ƣ�רҵƷ�ʣ�������������ֵ����������', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (223, 23, 'С�ȴ���', 19.8, 20, '�����ʱ��һ��Ҫ�ÿ�Ȫˮ��������ˮ������ˮ����ɹ�����߾���24Сʱ��ſ��ԣ�����ˮ������', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (224, 24, 'ɺ��ʯ/�쾰ʯ/��ɽ', 80, 10, '����������Ư��', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (206, 9, '��Ʒ', 123, 123, '��Ʒ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (1, 7, '����������ë����', 1000, 2, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (2, 8, '���ƹ���', 320.5, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (3, 9, '���ƹ���', 50, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (4, 10, '����ȥʭ��', 21.6, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (5, 11, '�ո����۶�è', 360, 3, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (6, 12, 'è��С��', 89.9, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (7, 13, '��ζè��', 42.3, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (8, 14, 'è��ȥʭ��', 12.4, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (9, 15, '������', 20, 25, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (10, 16, '��������', 30, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (11, 17, '�������', 23.1, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (12, 18, 'С��������', 5.6, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (13, 19, '��Ƥ����', 32, 30, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (14, 20, '����', 60, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (15, 21, '������ʳ', 30.6, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (16, 22, '��������ϴ�Ӽ�', 15, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (17, 23, '�ȴ���', 12, 54, null, 0, 6);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (18, 24, '���', 45, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (19, 25, '������ʳ', 10, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (20, 26, '���������', 6.4, 92, null, 0, 8);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (21, 27, '½��', 230, 20, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (22, 28, '½����͸�', 50, 90, null, 0, 10);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (23, 29, '½�����ø����߲�', 30.7, 100, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (24, 30, '½�껤��Һ', 20.9, 93, null, 1.2, 7);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (63, 7, '΢Ц��ʹ��ĦҮ����Ȯ', 3600, 10, '΢Ц��ʹ��ĦҮ��һ���°��˻�', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (64, 7, '�߾�����Ȯ', 3388, 20, '�߾�����Ȯ���� ֧��֧���� ������Ȯ���� �����½���Q23 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (66, 7, 'Լ����', 2500, 3, '��ƷԼ���ı��� ��Ʒ�ְ����� ֧��֧����', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (67, 8, '�������㲨', 9.8, 300, '��ά������Ʒ �����㲨��ԡ¶ ��ë����(޹�²�����500ml) ���㲨', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (68, 8, 'ǣ����', 36, 100, 'B040156�Զ�����ǣ��������״�� 3��/30kg ǣ���� ������', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (69, 8, 'ָ�׼�', 29, 479, '�ձ�Petio�綯�����Զ�ĥ���� ����綯ĥ���� ����ĥ���� ָ�׼� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (70, 8, '��������', 38, 5, 'FMJ ����FURminator������ ������ë����ë�� ���� �������� ���', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (71, 9, 'ԭ֭ţƤ��˾���ľ�', 10, 100, 'ԭ֭ţƤ��˾���ľ�4ö/5.5�� ���ֿ�ζ ����ҧ��/������ʳ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (72, 9, 'ţƤѹ��ţ��', 5.8, 210, '514153 ���� ţƤѹ��ţ��+���ܲ�ҧ��(2֧װ) 80g', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (73, 9, '�䱦Ȯ��', 7.5, 101, '��ɱ���䱦Ȯ���䱦����3+ͻ���䷽Ҷ����������Ȯ/ԭװ500g ', 0, 0);
commit;
prompt 100 records committed...
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (74, 9, '����Ƭ', 24, 500, '����������ϵ��-����Ƭ4ɫ��װ390g 123085 ������ʳ ���ĥ�� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (164, 11, '����è', 900, 5, 'HELLO���ݣ�����ɫ����è������èDD��MM���У��ϲ������� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (165, 11, 'Ӣ����ëè', 3000, 1, '���﨏CAA���ùھ�������� 2011.5.2���� Ӣ����ëè Ӣ�� Ů ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (166, 11, '������ëè', 80000, 5, 'CFAע���ػ��߼Ӱ�������ëèСĸè����', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (167, 11, '��˹è', 12345, 1, '�����̺�ɫ��˹è����', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (168, 11, 'Ӣ����ë����è', 2900, 3, '�ɰ���2�����С����', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (169, 11, '�ո����۶�', 8000, 3, '���䳬�ޡ����峬�õ��ո����۶��Ӱ����ã�Сè�� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (171, 11, '�����ëè', 2000, 1, '�ӷ� �����ëè �컢�߼Ӱ� MM', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (172, 11, 'ϲ������è', 6000, 2, 'ϲ������è �����£������� ��ӭ���ſ�è ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (173, 11, '˫ɫ�����ëè', 10000, 1, 'ǳ��ɫ�������' || chr(10) || '' || chr(10) || '����', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (174, 12, '�����Զ�ιʳ��', 38, 200, '������Ʒ/�����Զ�ιʳ��/��/è/�Զ���ˮ��/ιʳ��/B050440', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (175, 12, '���ﺽ����', 60, 100, '�ؼۡ����ʹ�ʵ��꡿���ﺽ���䣨��׼�ɻ���/�������', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (176, 12, 'èɰ', 15, 300, '����ʤ�������� èɰ5L ʵ����ɰ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (177, 12, 'èɰ��', 5, 500, '������Ʒ��èè��Ʒ��èɰ�� ������ ��ʳ��', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (178, 12, '����ľ����', 300, 10, '̨��IBIYAYA ����ѽѽ����ľ���� è�����˴� FF604', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (179, 12, '�۷�װ', 6.8, 100, '�����ؼ�/�����·�/������/̩��/����/���·�è�·�/�۷�װ6.8��', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (180, 12, '��è��', 5, 124, '�ǳ��Ƽ� ���ζ�è�� �ڸ�è���� �ɵ���Сè��è�� Doggy Man', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (181, 12, '��è��', 6, 475, '�������/è���/��ë ��ɫ ��Ʒ��è�� F010927 ȫ���������', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (182, 13, 'è����ֲ��װ', 7.8, 447, '·�ӳ���.�ؼ�ˮ��è����ֲ��װ��1500���� ��������', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (183, 13, 'ΰ�γ�è��������ʰ�', 1.9, 500, '˫�ʹ����� ��� ΰ�γ�è��������ʰ�85g (12��/��)���µ���', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (184, 13, 'è����', 9.9, 107, '��5.5����ɱ���������ڻ��� è�� è���� ����20�˳�����װ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (185, 13, 'è�ù�ͷ', 7.2, 130, '��ϲ�� ��³���ڹ�/����ǹ��Ӷ�����160��è�ù�ͷ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (186, 13, 'ɢװľ��ޤ��', 3, 810, 'èè���ɢװľ��ޤ�� 3Ԫ/��', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (187, 13, '������Ϻè��ͷ', 1.5, 796, '���ļ��ؼ� ÿ���޹�20��������Ϻè��ͷ\���ʰ�\ʪ��\è�� 120g', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (188, 13, 'è������', 1, 880, 'è�����ӣ�����1����55-60�ˣ�1500�����ң��޷�������ȷ�����Ǿ��Ը�����', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (189, 14, 'è�仯ë��', 55, 380, '����è��֮_�¹�Gimpet����è�仯ë��[��ǿ��]*100g', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (190, 14, 'Ƥ��������ҩ', 20, 19, '{EHP}����ҩƷ è��ͨ�� �����Ƥ���� Ƥ��������ҩ ԡҺ 250ml', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (191, 14, 'è������ҩ', 22.8, 80, '������Ʒ �¹��ݶ�è�ڳ���-è������ҩ ���ҩһ�� �ڷ�', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (192, 14, 'è����������', 39, 65, '�ؼ� A010105��ƷӢ����è���������籣�������һ����', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (193, 14, 'è�β���Чҩ', 150, 478, '��ιҩ������Denosyl��ŵ��è�β���Чҩ90mg ��Ʒ��α ȫ������', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (194, 19, '��������', 90, 200, '�ؼ� babybird�������������ļ�β ��������ֹ�ĸ ����ȫ������', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (195, 19, 'ĵ������', 65, 87, '�������ĳ����� ��ͷ��������-����������ĵ������', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (45, 7, '���ֽ�������', 1800, 45, null, 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (75, 7, '�����˹Ȯ', 25000, 1, 'FCI��֤Ȯ�ᴿ����оƬ��֤��ľ�Ʒ�����˹˧�籦��ת�ó��� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (76, 7, '�����', 1699, 1, '��ţȮҵ����һֻƯ���Ĵ����MM', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (77, 7, '����ʿ�»�', 1399, 5, '�� ��100%��������ʿ�»�--�ǳ��ɰ�~�ʺϼ����� ��֧��֧���� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (78, 7, '���ߵع�', 2036, 1, '���ߵذ׹������ߵؼ��������ߵع������ߵ�Ȯ��������19 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (79, 7, '�Լҷ�ֳ���ͷ���� ', 2200, 21, '����ʵ���ա��Լҷ�ֳ���ͷ����', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (80, 7, '����С����', 2500, 5, '��ǿȮҵ���۳��ﹷ��/����С������Ȯ/����Ȯ/���ְױ��� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (81, 7, '������Ȯ�߾�����Ȯ��Ȯ', 4199, 10, '����ӡ��Ȯ����۴�����Ȯ�߾�����Ȯ��Ȯ ���ﹷ�� �͹���Ʒ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (82, 7, '��ʿ��', 988, 9, '�ɰ��̻�ɫ��ʿ����Ȯ ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (83, 7, '����ѩ����', 1099, 1, '��������ѩ����-��������(��)SCHNAUZER�����ʹ�������֧��֧���� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (84, 7, '���ֹ���', 5888, 1, '���ֹ�����Ȯ������Ȯ����ھ�������֧��֧����', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (300, 15, '�豭��', 2999, 5, '������С�衿����豭��cup rabbit ʵ������2011040701 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (299, 17, '������', 15, 200, 'WEITA������ʳƷ ������ 4������������', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (298, 16, '���������', 90, 50, 'Jolly ��������� - �{ɫ ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (280, 17, '��ޣ��ש', 8, 167, '�����������³���������è���Ե�ĥ��100%����Ȼ��ޣ��ש500g', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (270, 16, 'С�ͳ����', 12, 80, '���� ��è ���� С�ͳ���桢�ŵ������С���Ѿ CS12 ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (260, 18, '��澻�ڷ�Һ', 3.99, 540, '��һ����澻�ڷ�Һ һ֧ 10ML ����ҩƷ ר����没��Ѫ�� ', 0, 0);
insert into P_GOODS (g_id, c_id, g_name, g_price, g_num, g_brief, g_score, g_sold)
values (250, 15, '��Ʒ��è', 900, 3, '�谮ing ��Ʒ��è ���� 900�� ����۸�����ϵ���� ', 0, 0);
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
values (42, 10002, to_date('03-08-2011 15:35:24', 'dd-mm-yyyy hh24:mi:ss'), 'xuguifeng', '����', 15158109559, 4, null, 7);
insert into P_ORDERS (o_id, u_id, o_time, o_receiver, o_address, o_phone, o_state, o_type, o_sum)
values (43, 10002, to_date('03-08-2011 15:46:53', 'dd-mm-yyyy hh24:mi:ss'), 'xuguifeng', '����', 15158109559, 4, null, 67);
insert into P_ORDERS (o_id, u_id, o_time, o_receiver, o_address, o_phone, o_state, o_type, o_sum)
values (44, 10002, to_date('03-08-2011 16:23:22', 'dd-mm-yyyy hh24:mi:ss'), 'xuguifeng', '����', 15158109559, 4, null, 3454);
insert into P_ORDERS (o_id, u_id, o_time, o_receiver, o_address, o_phone, o_state, o_type, o_sum)
values (45, 10002, to_date('03-08-2011 16:25:23', 'dd-mm-yyyy hh24:mi:ss'), 'xuguifeng', '����', 15158109559, 4, null, 567);
insert into P_ORDERS (o_id, u_id, o_time, o_receiver, o_address, o_phone, o_state, o_type, o_sum)
values (46, 10002, to_date('03-08-2011 16:26:59', 'dd-mm-yyyy hh24:mi:ss'), 'xuguifeng', '����', 15158109559, 4, null, 67);
insert into P_ORDERS (o_id, u_id, o_time, o_receiver, o_address, o_phone, o_state, o_type, o_sum)
values (1, 10002, to_date('02-08-2011 15:31:59', 'dd-mm-yyyy hh24:mi:ss'), '������', '���ݵ��ӿƼ���ѧ', 15158114051, 1, 2, 67);
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
