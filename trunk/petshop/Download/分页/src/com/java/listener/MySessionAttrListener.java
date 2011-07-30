package com.java.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

// session 中 属性监听器 
public class MySessionAttrListener implements HttpSessionAttributeListener{

	// 对于属性的添加，此 方法会被触发
	public void attributeAdded(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		HttpSession session = event.getSession();
		session.setAttribute("a", "a1");
		 
		System.out.println("add......");
	}

	// 属性移除时，触发此方法
	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub
		System.out.println("remove......");
	}

	// 属性更改时，触发。
	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub
		System.out.println("replace......");
	}

}

//网站访问数量的统计，屏蔽页面刷新会增加访问数量。 
//统计： 当前在线人数，总访问人数。  如果有会员功能：还需要增加，在线游客数量，和在线会员数量。
//注意：服务器重启，总访问人数也不能清零。需要数据保存。
