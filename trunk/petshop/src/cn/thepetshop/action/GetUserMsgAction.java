/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package cn.thepetshop.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import cn.thepetshop.dao.PetDAO;
import cn.thepetshop.form.User;
import cn.thepetshop.form.UserForm;


public class GetUserMsgAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		UserForm userForm = (UserForm)form;
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("userid");
		PetDAO petdao = new PetDAO();
		User user = petdao.findUserById(userid);
		request.setAttribute("user", user);
		return new ActionForward("/jsp/usermsg.jsp");
		
	}
}