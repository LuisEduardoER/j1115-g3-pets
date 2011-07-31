package cn.thepetshop.object;

import java.util.List;

public class OrderInfo {
	private Order order;//������Ϣ
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
	/**
	 * ��ȡ�������ܽ��
	 * @return �������
	 */
	public double getSumMoney(){
		double sum = 0;
		for(int i=0;i<goodsList.size();i++){
			OrderedGoods og = goodsList.get(i);
			sum += og.getGoodsPrice()*og.getQuantity();//��Ʒ��*��Ʒ����
		}
		return 0;
	}
}
