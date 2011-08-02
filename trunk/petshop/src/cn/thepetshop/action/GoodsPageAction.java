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

public class GoodsPageAction extends Action {

	private static final int PAGEROW = 16;

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		DynaActionForm gf = (DynaActionForm) form;
		PetDAO pd = new PetDAO();
		int page = 1;
		String category = (String) gf.get("category");
		String nowpage = (String) gf.get("nowPage");
		if (nowpage != null && !"".equals(nowpage)) {
			page = Integer.parseInt(nowpage);
		}
		int count = pd.getRowCount(category);
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
		List<Goods> goodsList = pd.listGoods(category, start, end);
		request.setAttribute("goodsList", goodsList);
		request.setAttribute("category", category);
		request.setAttribute("page", page);
		request.setAttribute("endPage", pageCount);
		return new ActionForward("GoodListView");
	}
}