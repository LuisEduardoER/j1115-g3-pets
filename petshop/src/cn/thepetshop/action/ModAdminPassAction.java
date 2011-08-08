/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package cn.thepetshop.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import cn.thepetshop.dao.PetDAO;
import cn.thepetshop.form.ModAdminPassForm;


public class ModAdminPassAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ModAdminPassForm modAdminPassForm = (ModAdminPassForm) form;
		String oldPass = modAdminPassForm.getOldPass();
		String newPass1 = modAdminPassForm.getNewPass1();
		String newPass2 = modAdminPassForm.getNewPass2();
		String userid = (String) request.getSession().getAttribute("userid");
		if (newPass1.endsWith(newPass2) == false) {
			request.setAttribute("msg", "���벻ƥ��");
			return new ActionForward("ModAdminPassView");
		}else {
			PetDAO petDAO = new PetDAO();
			String msg =petDAO.updateAdministratorPass(oldPass, newPass1,userid);
			request.setAttribute("msg", msg);
			return new ActionForward("ModAdminPassView");
		}
		
	}
}