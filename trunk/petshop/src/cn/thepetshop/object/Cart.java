package cn.thepetshop.object;

import java.text.DecimalFormat;
import java.text.NumberFormat;
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
	public String getSumMoney(){
		double sum = 0;
		for(int i=0; i<goodsList.size();i++){
			OrderedGoods og = goodsList.get(i);
			sum += og.getGoodsPrice()*og.getNum();
		}
		DecimalFormat dformat = (DecimalFormat)(NumberFormat.getInstance());
		dformat.applyPattern("#.00");
		return dformat.format(sum);
	}
}
