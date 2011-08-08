/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package cn.thepetshop.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import cn.thepetshop.dao.PetDAO;
import cn.thepetshop.form.OrderForm;
import cn.thepetshop.object.OrderInfo;
import cn.thepetshop.object.OrderedGoods;

public class SubmitOrderAction extends Action {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("pagetitle", "订单 - 付款方式");
		
		OrderForm of = (OrderForm)form;
		PetDAO pd = new PetDAO();
		Object obj = request.getSession().getAttribute("userid");
		String userid = (String) obj;
		List<OrderedGoods> list = pd.checkNumInCart(userid);
		
		for(int i=0;i<list.size();i++){
			if(list.get(i).getNum()>list.get(i).getGoodsLeftNum()){
				request.setAttribute("goodsmsg"+list.get(i).getGoodsid(), "超过库存数量");
				return new ActionForward("/getCart.do");
			}
		}
		OrderInfo oi = pd.createOrder(userid,of.getReceiver(),of.getAddress(),of.getPhone());
		request.setAttribute("orderedGoodsList", oi.getGoodsList());
		request.setAttribute("hqs_orderid", oi.getOrder().getOrderId());
		request.setAttribute("orderMoney", oi.getSumMoney());
		request.getSession().setAttribute("goodsnumincart", "0");
		return new ActionForward("GoPayView");
	}
}