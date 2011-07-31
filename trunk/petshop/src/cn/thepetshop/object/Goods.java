package cn.thepetshop.object;

public class Goods {
	private int goodsid;//商品id
	private int goodsCategory;//商品分类
	private String goodsName;//商品名称
	private double goodsPrice;//商品单价
	private int goodsLeftNum;//商品剩余数目
	private String goodsBrief;//商品简介
	
	public int getGoodsid() {
		return goodsid;
	}
	public void setGoodsid(int goodsid) {
		this.goodsid = goodsid;
	}
	public int getGoodsCategory() {
		return goodsCategory;
	}
	public void setGoodsCategory(int goodsCategory) {
		this.goodsCategory = goodsCategory;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public double getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(double goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public int getGoodsLeftNum() {
		return goodsLeftNum;
	}
	public void setGoodsLeftNum(int goodsLeftNum) {
		this.goodsLeftNum = goodsLeftNum;
	}
	public String getGoodsBrief() {
		return goodsBrief;
	}
	public void setGoodsBrief(String goodsBrief) {
		this.goodsBrief = goodsBrief;
	}
	
}
