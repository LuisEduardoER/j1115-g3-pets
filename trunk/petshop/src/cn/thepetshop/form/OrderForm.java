package cn.thepetshop.form;

import org.apache.struts.action.ActionForm;

public class OrderForm extends ActionForm {
	
	private String receiver;
	private String address;
	private String phone;
	
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
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
}
