package cn.thepetshop.object;

import java.util.List;

public class Cart {
	private List<OrderedGoods> goodsList;

	public List<OrderedGoods> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<OrderedGoods> goodsList) {
		this.goodsList = goodsList;
	}
	/**
	 * 获取购物车里的商品总金额
	 * @return 购物车的商品总金额
	 */
	public double getSumMoney(){
		double sum = 0;
		for(int i=0; i<goodsList.size();i++){
			OrderedGoods og = goodsList.get(i);
			sum += og.getGoodsPrice()*og.getNum();
		}
		return sum;
	}
}
