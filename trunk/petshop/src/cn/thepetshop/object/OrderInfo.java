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
	/**
	 * 获取订单的总金额
	 * @return 订单金额
	 */
	public double getSumMoney(){
		double sum = 0;
		for(int i=0;i<goodsList.size();i++){
			OrderedGoods og = goodsList.get(i);
			sum += og.getGoodsPrice()*og.getQuantity();//商品数*商品单价
		}
		return 0;
	}
}
