package cn.thepetshop.action;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import cn.thepetshop.dao.PetDAO;
import cn.thepetshop.object.OrderShow;

public class OrderShowAction extends Action {
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession session=request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		List<OrderShow> list = new PetDAO().getOrdersByUserId(userId);
		request.setAttribute("list", list);
		
		return mapping.findForward("show");
	}

}
