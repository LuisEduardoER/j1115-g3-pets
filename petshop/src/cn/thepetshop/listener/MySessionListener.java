package cn.thepetshop.listener;

import java.util.List;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import cn.thepetshop.dao.PetDAO;
import cn.thepetshop.object.Menu;

public class MySessionListener implements HttpSessionListener{

	public void sessionCreated(HttpSessionEvent arg0) {
		arg0.getSession().setAttribute("goodsnumincart", "0");
		
		PetDAO pd = new PetDAO();
		List<Menu> categoryMenuList = pd.getMenuList();
		
		arg0.getSession().setAttribute("categoryMenuList", categoryMenuList);
		arg0.getSession().setAttribute("pagetitle","The Pet Shop");
	}
	
	public void sessionDestroyed(HttpSessionEvent arg0) {
		
	}
}
