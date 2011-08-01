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
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		DynaActionForm gf=(DynaActionForm)form;
		PetDAO pd=new PetDAO();		
		String str=(String)gf.get("good");
		List<Goods> goodsList=pd.listGoods(str);
		//System.out.println(goodsList);
		request.setAttribute("goodsList",goodsList);
		return new ActionForward("GoodListView");
	}
}