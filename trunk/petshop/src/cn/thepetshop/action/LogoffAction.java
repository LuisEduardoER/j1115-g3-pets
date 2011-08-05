/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package cn.thepetshop.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


public class LogoffAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		Cookie[] cs = request.getCookies();
		cs = null;
		Cookie cid = new Cookie("username", null);
		Cookie cpass = new Cookie("password", null);
		
		cid.setMaxAge(0);
		cpass.setMaxAge(0);
		response.addCookie(cid);
		response.addCookie(cpass);
		//System.out.println(request.getCookies());
		
		HttpSession session=request.getSession();
        session.setAttribute("username", null);
        session.setAttribute("userid", null);
        session.setAttribute("goodsnumincart", "0");
       // System.out.println("ע���ɹ���");
        
        
        return new ActionForward("/index.do",true);
	}
}