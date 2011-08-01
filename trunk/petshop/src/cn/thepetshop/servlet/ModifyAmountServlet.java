package cn.thepetshop.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.thepetshop.dao.PetDAO;

public class ModifyAmountServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		String userid = (String)request.getSession().getAttribute("userid");
		userid = "2";//¡Ÿ ±
		String newnum = request.getParameter("newnum");
		String goodsid = request.getParameter("goodsid");
		PetDAO pd = new PetDAO();
		String result = pd.modifyAmount(userid,goodsid,newnum);
		PrintWriter out = response.getWriter();
		if("changesuccess".equals(result)){
			out.print("changesuccess");
		}else if("unchange".equals(result)){
			out.print("unchange");
		}else{
			out.print(result);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
