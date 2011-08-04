package cn.thepetshop.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;

import cn.thepetshop.dao.PetDAO;

public class ModifyAmountAction extends Action {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String userid = (String)request.getSession().getAttribute("userid");
		userid = "2";//¡Ÿ ±
		DynaActionForm maf = (DynaActionForm)form;
		String newnum = (String) maf.get("newnum");
		String goodsid = (String) maf.get("goodsid");
		PetDAO pd = new PetDAO();
		String result = pd.modifyAmount(userid,goodsid,newnum);
		PrintWriter out;
		try {
			out = response.getWriter();
			if("changesuccess".equals(result)){
				out.print("changesuccess");
			}else if("unchange".equals(result)){
				out.print("unchange");
			}else{
				out.print(result);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}