package cn.thepetshop.object;

public class OrderShow {
	
	private int  orderId;					//������ţ�
	private int[] proid;					//��Ʒ��ţ���������ƷͼƬ
	private String[] proName;				//��Ʒ���ƣ�
	private int userId ;					//�û�id
	private double[] price;					//��Ʒ���ۣ�
	private int[] numb;						//��Ʒ������
	private double sumMoney;				//�ܵļ�Ǯ��
	private String xiaDanDate;				//�µ�ʱ�䣻
	private int tradeStatus;				//����״̬
	
	
	
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
