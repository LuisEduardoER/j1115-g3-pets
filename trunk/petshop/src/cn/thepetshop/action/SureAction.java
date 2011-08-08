package cn.thepetshop.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import cn.thepetshop.dao.PetDAO;

public class SureAction extends Action {

	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {


		int orderid= Integer.parseInt(request.getParameter("orderid"));
		new PetDAO().updateOrderSatatus(orderid, 3);
		return new ActionForward("/trading.do",true);
	}
}
