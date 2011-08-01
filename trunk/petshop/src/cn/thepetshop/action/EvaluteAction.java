package cn.thepetshop.action;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import cn.thepetshop.dao.PetDAO;

public class EvaluteAction extends Action {

	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			ServletRequest request, ServletResponse response) throws Exception {


		int goodsid= Integer.parseInt(request.getParameter("goodsid"));
		int orderid= Integer.parseInt(request.getParameter("orderid"));
		int score = Integer.parseInt(request.getParameter("score"));
		new PetDAO().addEvalute(goodsid, score);
		new PetDAO().updateOrderSatatus(orderid,4);
		return mapping.findForward("evalute");
	}
}
