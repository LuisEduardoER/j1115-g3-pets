--商品表增加一列g_score，用于商品评分
alter table p_goods add g_score number(2,1) default 0 check(g_score between 0 and 5) ;
--商品表增加一列g_sold,用于记录商品已卖出的数量
alter table p_goods add g_sold number default 0;
--订单表增加一列o_type,用于记录订单内付款方式
alter table p_orders add o_type number(1) check(o_type between 0 and 2);
--订单表增加一列o_sum，用于记录订单总额
alter table p_orders add o_sum number;