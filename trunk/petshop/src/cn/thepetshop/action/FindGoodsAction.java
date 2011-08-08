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

public class FindGoodsAction extends Action {
	
	private static final int PAGEROW = 16;
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		DynaActionForm gf = (DynaActionForm) form;
		String searchkey=(String) gf.get("searchkey");
		//System.out.println("action get:"+searchkey);
		String searchcategory=(String) gf.get("searchcategory");
		String nowpage = (String) gf.get("nowPage");
		PetDAO pd=new PetDAO();
		int page = 1;
		if (nowpage != null && !"".equals(nowpage)) {
			page = Integer.parseInt(nowpage);
		}
		int count = pd.getCountOfFindGoods(searchcategory,searchkey);
//		System.out.println("getCountOfFindGoods::"+searchcategory);
		int pageCount = count / PAGEROW;
		//System.out.println("pageCount::"+pageCount);
		if (count % PAGEROW != 0) {
			pageCount += 1;
		}
		if (page < 1) {
			page = 1;
		}
		if (page > pageCount) {
			page = pageCount;
		}
		int firstPage=1;
		int start = (page - 1) * PAGEROW + 1;
		//System.out.println("start:"+start);
		int end = start + PAGEROW - 1;
		List goodsList=pd.findGoods(searchkey,searchcategory,start,end);
		request.setAttribute("goodsList", goodsList);
		request.setAttribute("searchcategory", searchcategory);
		request.setAttribute("page", page);
		request.setAttribute("endPage", pageCount);
		request.setAttribute("firstPage", firstPage);
		request.setAttribute("searchkey", searchkey);
		return new ActionForward("FindGoodsView");
	}
}