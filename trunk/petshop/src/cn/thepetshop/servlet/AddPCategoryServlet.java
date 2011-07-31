package cn.thepetshop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.thepetshop.dao.PetDAO;

public class AddPCategoryServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		String addcname = request.getParameter("addCategory");
		if (addcname.equals("")||addcname==null) {
			request.getRequestDispatcher("GetParentCategory").forward(request, response);
		}else {
			PetDAO petDAO = new PetDAO();
			petDAO.addParentCategory(addcname);
			request.getRequestDispatcher("GetParentCategory").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
