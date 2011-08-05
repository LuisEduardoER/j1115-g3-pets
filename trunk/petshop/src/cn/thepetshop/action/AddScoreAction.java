package cn.thepetshop.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import cn.thepetshop.dao.PetDAO;

public class AddScoreAction extends Action{

	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		for(int i=0; ;i++)
		{
			if(request.getParameter(""+i)==null)
				{break;}
			
			int goodsId = Integer.parseInt(request.getParameter("pro"+i));
			int score = Integer.parseInt(request.getParameter(i+""));
			System.out.println(goodsId+"----------"+score);
			String[] str=new PetDAO().getGoodsScore(Integer.toString(goodsId));
			double oldscore=Double.valueOf(str[0]);
			int oldsold=Integer.parseInt(str[1]);
			System.out.println("从数据库取出的分数:"+oldscore +"---------"+"从数据库取出的购买人数:" +oldsold);
			double newscore=(oldscore*oldsold+score)/(oldsold+1);
			int newsold=oldsold+1;
			System.out.println("写入数据库的分数："+newscore+"---------"+"写入数据库的购买人数："+newsold);
			new PetDAO().addEvalute(goodsId, newscore, newsold);
 		}
		String orderid=request.getParameter("orderid");
		new PetDAO().updateOrderSatatus(Integer.parseInt(orderid), 4);
		return mapping.findForward("suceess");
	}
}
