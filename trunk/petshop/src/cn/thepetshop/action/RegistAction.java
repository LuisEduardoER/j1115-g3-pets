package cn.thepetshop.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import cn.thepetshop.dao.PetDAO;
import cn.thepetshop.form.UserForm;


/**
 * 注释Action
 * @author Administrator
 *
 */
public class RegistAction extends Action {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
	
			UserForm userForm = (UserForm)form;
			
			String username = userForm.getUsername();
			String password = userForm.getPassword();
			
			PetDAO petdao = new PetDAO();
			boolean b = petdao.register(username,password);
			if(b){
				//说明注册成功，并提示是否要登录
				System.out.println("rigist  succeed........");
				return new ActionForward("/index.jsp");
			}else{
				//弹出错误提示
				System.out.println("rigist...fail.....");
				return new ActionForward("/index.jsp");
			}
			
			
			
		}

}
