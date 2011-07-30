package com.java.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;

public class MyServletContextAttrListener implements ServletContextAttributeListener{

	//
	public void attributeAdded(ServletContextAttributeEvent event) {
		// TODO Auto-generated method stub
		ServletContext application = event.getServletContext();
		application.setAttribute("", "");
	}

	@Override
	public void attributeRemoved(ServletContextAttributeEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void attributeReplaced(ServletContextAttributeEvent arg0) {
		// TODO Auto-generated method stub
		
	}

}
