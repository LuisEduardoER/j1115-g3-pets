package cn.thepetshop.object;

import java.util.List;

public class OrderInfo {
	private Order order;//订单信息
	private List<OrderedGoods> goodsList;//商品列表
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public List<OrderedGoods> getGoodsList() {
		return goodsList;
	}
	public void setGoodsList(List<OrderedGoods> goodsList) {
		this.goodsList = goodsList;
	}
}
