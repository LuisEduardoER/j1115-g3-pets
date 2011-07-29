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
			
			PetDAO petdao = new PetDAO();
			boolean b = petdao.register(username,password);
			if(b){
				//˵��ע��ɹ�������ʾ�Ƿ�Ҫ��¼
				System.out.println("rigist  succeed........");
				return new ActionForward("/index.jsp");
			}else{
				//����������ʾ
				System.out.println("rigist...fail.....");
				return new ActionForward("/index.jsp");
			}
			
			
			
		}

}
