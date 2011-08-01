package cn.thepetshop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.thepetshop.dao.PetDAO;


public class DelCCategoryServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PetDAO petDAO = new PetDAO();
		
		String[] cjbno = request.getParameterValues("cjbnos");
		String pid = request.getParameter("parno");
		if (cjbno==null || cjbno.length<=0) {
			request.getRequestDispatcher("ChildrenServlet?parentno="+pid).forward(request, response);
		}
		if(cjbno!=null && cjbno.length>0) {
			petDAO.deleteChildrenCategory(cjbno);
			request.getRequestDispatcher("ChildrenServlet?parentno="+pid).forward(request, response);
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
