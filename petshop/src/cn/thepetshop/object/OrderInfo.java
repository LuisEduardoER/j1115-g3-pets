package cn.thepetshop.object;

import java.util.List;

public class OrderInfo {
	private Order order;//订单信息
	private double sumMoney;//订单总金额
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
	public double getSumMoney() {
		return sumMoney;
	}
	public void setSumMoney(double sumMoney) {
		this.sumMoney = sumMoney;
	}
	public void calculateSumMoney(){
		int s = 0;
		for(int i = 0;i<goodsList.size();i++){
			OrderedGoods og = goodsList.get(i);
			s += og.getNum()*og.getGoodsPrice();
		}
		sumMoney = s;
	}
}
