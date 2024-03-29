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
import org.apache.struts.action.DynaActionForm;

import cn.thepetshop.dao.PetDAO;


public class ShowAllOrderAction extends Action {
	private static final int PAGEROW=10;
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		DynaActionForm gf = (DynaActionForm) form;
		PetDAO pd = new PetDAO();
		int page = 1;
		String nowpage = (String) gf.get("nPage");
		if (nowpage != null && !"".equals(nowpage)) {
			page = Integer.parseInt(nowpage);
		}
		int count = pd.getOrderCount();
		int pageCount = count / PAGEROW;
		if (count % PAGEROW != 0) {
			pageCount += 1;
		}
		if (page < 1) {
			page = 1;
		}
		if (page > pageCount) {
			page = pageCount;
		}
		int start = (page - 1) * PAGEROW + 1;
		int end = start + PAGEROW - 1;
		
		if (request.isRequestedSessionIdValid()) {
			request.removeAttribute("allorderlist");
		}
		List list = pd.getAllOrderList(start,end);
		request.setAttribute("allorderlist", list);
		request.setAttribute("orderpage", page);
		request.setAttribute("orderendPage", pageCount);
		request.setAttribute("pagetitle", "管理中心 - 订单管理");
		return new ActionForward("AdminOrderListView");
	}
}