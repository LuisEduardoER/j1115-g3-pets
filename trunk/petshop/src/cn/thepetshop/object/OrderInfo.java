package cn.thepetshop.object;

import java.util.List;

public class OrderInfo {
	private Order order;//������Ϣ
	private double sumMoney;//�����ܽ��
	private List<OrderedGoods> goodsList;//��Ʒ�б�
	
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
	
}
