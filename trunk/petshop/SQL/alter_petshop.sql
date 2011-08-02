--商品表增加一列g_score，用于商品评分
alter table p_goods add g_score number(2,1) default 0 check(g_score between 0 and 5) ;
