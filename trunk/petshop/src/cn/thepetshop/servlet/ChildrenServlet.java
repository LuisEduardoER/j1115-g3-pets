package cn.thepetshop.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.thepetshop.dao.PetDAO;

public class ChildrenServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PetDAO pdao = new PetDAO();
		String cidstring = request.getParameter("parentno");
		if (cidstring==null || cidstring.equals("")) {
			request.getRequestDispatcher("/admin/ccategory.jsp").forward(request, response);
		}else {
			int cid = Integer.parseInt(cidstring);
			List clist = pdao.getChildrenCategory(cid);
			request.setAttribute("childrenList", clist);
			request.getRequestDispatcher("/admin/ccategory.jsp").forward(request, response);
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
