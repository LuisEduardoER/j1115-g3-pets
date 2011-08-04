package cn.thepetshop.action;

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
 * ע��Action
 * @author Administrator
 *
 */
public class RegistAction extends Action {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
	
			UserForm userForm = (UserForm)form;
			
			String username = userForm.getUsername();
			String password = userForm.getPassword();
			
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			session.setAttribute("password",password);
			PetDAO petdao = new PetDAO();
			boolean b = petdao.register(username,password);
			if(b){
				return new ActionForward("/index.do");
			}
			else{
				return null;
			}
		}

}
