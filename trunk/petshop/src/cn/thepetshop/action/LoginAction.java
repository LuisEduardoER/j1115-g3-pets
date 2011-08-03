/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package cn.thepetshop.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import cn.thepetshop.dao.PetDAO;
import cn.thepetshop.form.UserForm;

/**
 * 登录Action
 * 
 * @author Administrator
 * 
 */
public class LoginAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		UserForm userForm = (UserForm) form;

		String username = userForm.getUsername();
		String password = userForm.getPassword();
		// System.out.println(userForm.isRemember());

		PetDAO petdao = new PetDAO();
		String userid = petdao.login(username, password);

		// ActionMessages messages = new ActionMessages();
		if (userid == null) {
			ActionMessages messages = new ActionMessages();
			messages.add("username", new ActionMessage("error.logon"));
			this.saveErrors(request, messages);
			return new ActionForward("/jsp/login.jsp");
		}

		HttpSession session = request.getSession();
		session.setAttribute("username", username);
		session.setAttribute("userid", userid);

		if (userForm.isRemember()) {
			int savetime = 360000;// 有效时间为3600秒
			System.out.println("logining.......");
			Cookie cid = new Cookie("username", username);
			Cookie cpass = new Cookie("password", password);

			cid.setMaxAge(savetime);
			cpass.setMaxAge(savetime);

			response.addCookie(cid);
			response.addCookie(cpass);
		}

		return new ActionForward("IndexView");

	}
}