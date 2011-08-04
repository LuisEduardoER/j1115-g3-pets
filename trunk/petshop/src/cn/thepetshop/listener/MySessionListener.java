package cn.thepetshop.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class MySessionListener implements HttpSessionListener{

	public void sessionCreated(HttpSessionEvent arg0) {
		arg0.getSession().setAttribute("goodsnumincart", "0");
	}

	public void sessionDestroyed(HttpSessionEvent arg0) {
		
	}
}
