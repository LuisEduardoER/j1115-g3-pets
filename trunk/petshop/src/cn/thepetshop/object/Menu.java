package cn.thepetshop.object;

import java.util.List;

public class Menu {
	private String pname;
	private String cid;
	private List<Category> subcategoryList;
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public List<Category> getSubcategoryList() {
		return subcategoryList;
	}
	public void setSubcategoryList(List<Category> subcategory) {
		this.subcategoryList = subcategory;
	}
	
}
