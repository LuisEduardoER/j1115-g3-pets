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
import cn.thepetshop.form.AddPCategoryForm;
import cn.thepetshop.object.Menu;


public class AddPCategoryAction extends Action {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		//String addcname = request.getParameter("addCategory");
		AddPCategoryForm addpcform = (AddPCategoryForm)form;
		String addcname = addpcform.getAddCategory();
		if (addcname.equals("")||addcname==null ) {
			return new ActionForward("/getParentCategory.do");
			
		}else {
			PetDAO petDAO = new PetDAO();
			petDAO.addParentCategory(addcname);
			
			List<Menu> categoryMenuList = petDAO.getMenuList();
			request.getSession().setAttribute("categoryMenuList", categoryMenuList);
			
			return new ActionForward("/getParentCategory.do");
		}
	}
}