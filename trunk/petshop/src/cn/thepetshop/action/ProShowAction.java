package cn.thepetshop.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		int orderid=Integer.parseInt(request.getParameter("orderid"));
		//HttpSession session=request.getSession();
		//int userId = (Integer)session.getAttribute("userid");
		int userId=2;//¡Ÿ ±µ˜ ‘
		List<OrderInfo> list = new PetDAO().getOrderInfoByUserId(userId);
		for(int i=0;i<list.size();i++){
			OrderInfo orderinfo=list.get(i);
			Order order=orderinfo.getOrder();
			if(order.getOrderId()==orderid){
				request.setAttribute("elist", orderinfo.getGoodsList());
				request.setAttribute("orderid", orderid);
				break;
			}
		}
		return mapping.findForward("pingJia");
	}
}
