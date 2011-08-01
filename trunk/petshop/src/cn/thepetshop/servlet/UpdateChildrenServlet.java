package cn.thepetshop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.thepetshop.dao.PetDAO;

public class UpdateChildrenServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");	
		String cnoString = request.getParameter("cno");
		String pnoString = request.getParameter("pno");
		String newname = request.getParameter("newChidName");
		int pno = Integer.parseInt(pnoString);
		System.out.println("newname:"+newname);
		System.out.println("pnoString:"+pnoString);
		System.out.println("cnoString:"+cnoString);
		if ( newname==null ||newname.equals("")) {
			System.out.println("........");
			request.getRequestDispatcher("ChildrenServlet?parentno="+cnoString).forward(request, response);
		}else {
			PetDAO petDAO = new PetDAO();
			petDAO.modChildrenCategory(pno,newname);
			request.getRequestDispatcher("ChildrenServlet?parentno="+cnoString).forward(request, response);
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
