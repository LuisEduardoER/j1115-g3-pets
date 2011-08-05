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
import cn.thepetshop.object.Goods;

public class ListGoodsAction extends Action {

	private static final int PAGEROW = 16;

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		DynaActionForm gf = (DynaActionForm) form;
		PetDAO pd = new PetDAO();
		String category = (String) gf.get("category");
		int page = 1;
		int start=1;
		int end=start+PAGEROW-1;
		
		List<Goods> goodsList = pd.listGoods(category, start ,end);
		if(goodsList.size()==0){
			goodsList = null;
		}
		
		request.setAttribute("goodsList", goodsList);
		request.setAttribute("category", category);
		request.setAttribute("page", page);
		return new ActionForward("GoodsListView");
	}
}