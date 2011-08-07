package cn.thepetshop.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;

import cn.thepetshop.dao.PetDAO;

import cn.thepetshop.object.User;
import cn.thepetshop.object.Order;
import cn.thepetshop.object.OrderInfo;

public class PayAction extends Action {
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			
			request.setAttribute("pagetitle", "我的订单- 结账");
			
			double sum=0;
			PetDAO pd = new PetDAO();
			DynaActionForm payform=(DynaActionForm)form;
			String value=(String)payform.get("paytype");
			String orderid=((String)payform.get("orderid")).trim();
			HttpSession session=request.getSession();
			String uid = (String)session.getAttribute("userid");
			int userId= Integer.parseInt(uid);
			if(Integer.parseInt(value)==0){
				return mapping.findForward("GoPayView");
			}
			else if(Integer.parseInt(value)==1){
				List<OrderInfo> list = pd.getOrderInfoByUserId(userId);
				for(int i=0;i<list.size();i++){
					OrderInfo order=list.get(i);
					Order od=order.getOrder();
					if(od.getOrderId()==Integer.parseInt(orderid)){
						sum=od.getMoney();
						break;
					}
				}
				User user=pd.findUserById(Integer.toString(userId));
				double usermoney = Double.parseDouble(user.getMoney());
				if(usermoney>=sum){
					double money=usermoney-sum;
					pd.updateOrderSatatus(Integer.parseInt(orderid), 1);
					pd.updateusermoney(userId,money);
					return new ActionForward("PaySucceedView");
				}else{
					request.setAttribute("msg","余额不足，请先充值再购买");
					return new ActionForward("PayFailView");
				}	
			}else{
				pd.updateOrderSatatus(Integer.parseInt(orderid), 2);
				return new ActionForward("PaySucceedView");
			}
	}
}