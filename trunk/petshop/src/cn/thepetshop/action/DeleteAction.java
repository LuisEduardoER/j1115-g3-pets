package cn.thepetshop.action;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import cn.thepetshop.dao.PetDAO;

public class DeleteAction extends Action {

	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			ServletRequest request, ServletResponse response) throws Exception {


		int orderid= Integer.parseInt(request.getParameter("orderid"));
		new PetDAO().deleteOreder(orderid);
		return mapping.findForward("deleteSucceed");
	}
}
