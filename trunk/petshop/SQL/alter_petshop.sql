--��Ʒ������һ��g_score��������Ʒ����
alter table p_goods add g_score number(2,1) default 0 check(g_score between 0 and 5) ;
