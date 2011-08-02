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
import cn.thepetshop.object.Cart;
import cn.thepetshop.object.OrderedGoods;

public class InputCustomerInfoAction extends Action {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String userid = (String)(request.getSession().getAttribute("userid"));
		userid = "2";//��ʱ�û�
		PetDAO pd = new PetDAO();
		Cart cart = pd.getShoppingCart(userid);
		String summoney = cart.getSumMoney();
		List<OrderedGoods> orderedGoodsList = cart.getGoodsList();
		
		request.setAttribute("orderedGoodsList", orderedGoodsList);
		request.setAttribute("summoney", summoney);
//		System.out.println(orderedGoodsList.size());
//		System.out.println(summoney);
		return new ActionForward("/shoppingcart/submitorder.jsp");
	}
}