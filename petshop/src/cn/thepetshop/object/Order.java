package cn.thepetshop.object;

import java.util.Date;

public class Order {

	private int orderId;// ����id
	private Date time;// �µ�ʱ��
	private String receiver;// �ջ���
	private String address;// �ջ���ַ
	private String phone;// �ջ��˵绰
	private int state;// ����״̬
	private int pay;//֧����ʽ 0-���� / 1-��� / 2-��������
	private double money;//�����ܼ�

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
}
