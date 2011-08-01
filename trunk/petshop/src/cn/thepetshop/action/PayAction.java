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
import cn.thepetshop.form.User;
import cn.thepetshop.object.Order;
import cn.thepetshop.object.OrderInfo;
import cn.thepetshop.object.OrderShow;

public class PayAction extends Action {
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			double sum=0;
			HttpSession session=request.getSession();
			int userId = (Integer)session.getAttribute("userId");
		
			String orderid=request.getParameter("orderid");
			List<OrderInfo> list = new PetDAO().getOrderInfoByUserId(userId);
			for(int i=0;i<list.size();i++){
				OrderInfo order=list.get(1);
				Order od=order.getOrder();
				if(od.getOrderId()==Integer.parseInt(orderid)){
					sum=order.getSumMoney();
					break;
				}
			}
			User user=new PetDAO().findUserById(Integer.toString(userId));
			int usermoney=Integer.parseInt(user.getMoney());
			if(usermoney>=sum){
				double money=usermoney-sum;
				new PetDAO().updateOrderSatatus(Integer.parseInt(orderid), 1);
				new PetDAO().updateusermoney(userId,money);
				return mapping.findForward("paySucceed");
			}else{
				request.setAttribute("msg","”‡∂Ó≤ª◊„£¨«Îœ»≥‰÷µ‘Ÿπ∫¬Ú");
				return mapping.findForward("payfailed");
			}	
	}

}