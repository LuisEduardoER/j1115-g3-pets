package cn.thepetshop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.thepetshop.dao.PetDAO;

public class ModPCategoryServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		String cid = request.getParameter("cjbnos");
		String newcname = request.getParameter("newCategory");
		System.out.println(cid);
		System.out.println(newcname);
		if (cid==null||cid.equals("")||newcname==null||newcname.equals("")) {
				request.getRequestDispatcher("/getParentCategory.do").forward(request, response);
		}else {
			System.out.println(cid);
			System.out.println(newcname);
			int cidnum = Integer.parseInt(cid);
			PetDAO pDao = new PetDAO();
			pDao.modParentCategory(cidnum, newcname);
			request.getRequestDispatcher("/getParentCategory.do").forward(request, response);
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
