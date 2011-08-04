/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
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

public class GoodsAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		int orderid=Integer.parseInt(request.getParameter("orderid"));
		//HttpSession session=request.getSession();
		//int userId = (Integer)session.getAttribute("userid");
		int userId=2;
		List<OrderInfo> list = new PetDAO().getOrderInfoByUserId(userId);
		for(int i=0;i<list.size();i++){
			OrderInfo orderinfo=list.get(i);
			Order order=orderinfo.getOrder();
			if(order.getOrderId()==orderid){
				request.setAttribute("elist", orderinfo.getGoodsList());
				break;
			}
		}
		return mapping.findForward("goodslist");
	}
}