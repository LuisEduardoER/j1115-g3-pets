package cn.thepetshop.object;

public class OrderShow {
	
	private int  orderId;					//订单编号；
	private int[] proid;					//商品编号，用来找商品图片
	private String[] proName;				//商品名称；
	private int userId ;					//用户id
	private double[] price;					//商品单价；
	private int[] numb;						//商品数量；
	private double sumMoney;				//总的价钱；
	private String xiaDanDate;				//下单时间；
	private int tradeStatus;				//交易状态
	
	
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public double getSumMoney() {
		return sumMoney;
	}
	public void setSumMoney(double sumMoney) {
		this.sumMoney = sumMoney;
	}
	public String getXiaDanDate() {
		return xiaDanDate;
	}
	public void setXiaDanDate(String xiaDanDate) {
		this.xiaDanDate = xiaDanDate;
	}
	public int getTradeStatus() {
		return tradeStatus;
	}
	public void setTradeStatus(int tradeStatus) {
		this.tradeStatus = tradeStatus;
	}
	public void setProid(int[] proid) {
		this.proid = proid;
	}
	public int[] getProid() {
		return proid;
	}
	public void setProName(String[] proName) {
		this.proName = proName;
	}
	public String[] getProName() {
		return proName;
	}
	public void setPrice(double[] price) {
		this.price = price;
	}
	public double[] getPrice() {
		return price;
	}
	public void setNumb(int[] numb) {
		this.numb = numb;
	}
	public int[] getNumb() {
		return numb;
	}


}
