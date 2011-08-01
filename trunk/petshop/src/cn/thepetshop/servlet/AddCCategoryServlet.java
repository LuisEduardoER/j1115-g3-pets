package cn.thepetshop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.thepetshop.dao.PetDAO;

public class AddCCategoryServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		String addcname = request.getParameter("addCCategory");
		String pidString = request.getParameter("pno");
		int pid = Integer.parseInt(pidString);
		if (addcname.equals("")||addcname==null || pidString.equals("") || pidString==null) {
			request.getRequestDispatcher("ChildrenServlet?parentno="+pid).forward(request, response);
		}else {
			PetDAO petDAO = new PetDAO();
			
			petDAO.addChildrenCategory(pid, addcname);
			request.getRequestDispatcher("ChildrenServlet?parentno="+pid).forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
