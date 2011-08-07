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
import cn.thepetshop.object.Order;
import cn.thepetshop.object.OrderInfo;

public class ProShowAction extends Action{

	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setAttribute("pagetiele","我的订单 - 商品评价");
		String orderid = request.getParameter("orderid");
		HttpSession session=request.getSession();
		String uid = (String)session.getAttribute("userid");
		int userId=Integer.parseInt(uid);
		PetDAO pd = new PetDAO();
		
		request.setAttribute("elist", pd.getOrderedGoods(Integer.parseInt(orderid)));
		request.setAttribute("orderid", orderid);
			
		return new ActionForward("PingJiaView");
	}
}
