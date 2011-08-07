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


public class GetParentCategoryAction extends Action {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		PetDAO pdao = new PetDAO();
		List list = pdao.getCategoryList();
		request.setAttribute("parentList", list);
		
//		HttpSession session =request.getSession();
//		session.setAttribute("parentList", list);
		request.setAttribute("pagetitle", "管理中心 - 分类管理");
		return new ActionForward("AdminParentCategoryListView");
	}
}