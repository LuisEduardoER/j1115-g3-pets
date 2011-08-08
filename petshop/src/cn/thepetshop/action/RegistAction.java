package cn.thepetshop.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import cn.thepetshop.dao.PetDAO;
import cn.thepetshop.form.UserForm;


/**
 * ◊¢ ÕAction
 * @author Administrator
 *
 */
public class RegistAction extends Action {
	
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
			
			request.setAttribute("pagetitle", "”√ªß◊¢≤·");
			
			UserForm userForm = (UserForm)form;
			
			String username = userForm.getUsername();
			String password = userForm.getPassword();
			
			PetDAO petdao = new PetDAO();
			boolean b = petdao.register(username,password);
			if(b){
				return new ActionForward("/jsp/regsuccess.jsp");
			}
			else{
				request.setAttribute("regmsg", "◊¢≤· ß∞‹£¨«Î÷ÿ ‘");
				return new ActionForward("/jsp/zhuce.jsp");
			}
		}
}
