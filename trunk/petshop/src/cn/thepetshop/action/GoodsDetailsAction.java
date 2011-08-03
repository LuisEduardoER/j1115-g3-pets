package cn.thepetshop.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;

import cn.thepetshop.dao.GetAllGoods;
import cn.thepetshop.dao.PetDAO;

public class GoodsDetailsAction extends Action {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		DynaActionForm gf = (DynaActionForm) form;
		PetDAO pd=new PetDAO();
		int goodsid=Integer.valueOf((String)gf.get("goodsid"));
		GetAllGoods goods=pd.getGoodsListByGid(goodsid);
		request.setAttribute("goods", goods);
		return new ActionForward("GoodsDetailsView");
	}
}