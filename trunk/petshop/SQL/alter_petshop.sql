--��Ʒ������һ��g_score��������Ʒ����
alter table p_goods add g_score number(2,1) default 0 check(g_score between 0 and 5) ;
--��Ʒ������һ��g_sold,���ڼ�¼��Ʒ������������
alter table p_goods add g_sold number default 0;
--����������һ��o_type,���ڼ�¼�����ڸ��ʽ
alter table p_orders add o_type number(1) check(o_type between 0 and 2);
--����������һ��o_sum�����ڼ�¼�����ܶ�
alter table p_orders add o_sum number;