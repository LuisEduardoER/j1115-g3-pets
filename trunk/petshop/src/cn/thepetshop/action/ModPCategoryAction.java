
package cn.thepetshop.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import cn.thepetshop.dao.PetDAO;


public class ModPCategoryAction extends Action {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String cid = request.getParameter("cjbnos");
		String newcname = request.getParameter("newCategory");
		if (cid==null||cid.equals("")||newcname==null||newcname.equals("")) {
			return new ActionForward("/getParentCategory");
			
		}else {
			System.out.println(cid);
			System.out.println(newcname);
			int cidnum = Integer.parseInt(cid);
			PetDAO pDao = new PetDAO();
			pDao.modParentCategory(cidnum, newcname);
			return new ActionForward("/getParentCategory");
	}
	}
}