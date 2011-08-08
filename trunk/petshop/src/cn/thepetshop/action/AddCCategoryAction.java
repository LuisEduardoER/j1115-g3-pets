/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package cn.thepetshop.action;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import cn.thepetshop.dao.PetDAO;
import cn.thepetshop.form.AddCCategoryForm;
import cn.thepetshop.object.Menu;


public class AddCCategoryAction extends Action {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
	
		AddCCategoryForm addCCategoryForm = (AddCCategoryForm) form;
		String addcname = addCCategoryForm.getAddCCategory();
//		System.out.println("AddCCategoryAction"+addcname);
		String pidString = request.getParameter("pno");
		int pid = Integer.parseInt(pidString);
		if (addcname.equals("")||addcname==null || pidString.equals("") || pidString==null) {
			return new ActionForward("/children.do?parentno="+pid);
		}else {
			PetDAO petDAO = new PetDAO();
			petDAO.addChildrenCategory(pid, addcname);
			List<Menu> categoryMenuList = petDAO.getMenuList();
			request.getSession().setAttribute("categoryMenuList", categoryMenuList);
			return new ActionForward("/children.do?parentno="+pid);
		}
	}
}