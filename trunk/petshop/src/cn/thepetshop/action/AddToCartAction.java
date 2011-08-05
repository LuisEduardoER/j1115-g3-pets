package cn.thepetshop.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;

import cn.thepetshop.dao.PetDAO;

public class AddToCartAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		DynaActionForm df = (DynaActionForm) form;
		String goodsamount = (String) df.get("goodsamount");
		String goodsid = (String) df.get("goodsid");
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		
		PrintWriter out;
		
		try {
			out = response.getWriter();
			if (userid == null) {//用户未登录的情况
				out.println("请先登录");
			} else {
				PetDAO pd = new PetDAO();
				boolean b = pd.addGoodsToCart(userid, goodsid, goodsamount);
				if (b) {
					String num = pd.getNumInCart(userid);
					session.setAttribute("goodsnumincart", num);
					out.print(num);
				} else {
					out.println("添加失败");
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}