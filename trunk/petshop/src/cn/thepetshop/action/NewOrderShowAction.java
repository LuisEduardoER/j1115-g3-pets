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
import cn.thepetshop.object.OrderInfo;

public class NewOrderShowAction extends Action {
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession session=request.getSession();
		String uid = (String) session.getAttribute("userid");
		int userId = Integer.parseInt(uid);
		List<OrderInfo> list = new PetDAO().getOrderInfoByUserId(userId);
		request.setAttribute("list", list);
		
		return new ActionForward("NewOrderShowView");
	}

}