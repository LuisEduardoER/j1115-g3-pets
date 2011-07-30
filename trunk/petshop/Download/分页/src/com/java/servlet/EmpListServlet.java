package com.java.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.dao.EmpDao;

public class EmpListServlet extends HttpServlet {

	private static final int PAGEROW = 4;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		EmpDao ed = new EmpDao();
		int page = 1;
		String nowPage = request.getParameter("nowPage");
		if(nowPage!=null && !"".equals(nowPage)){
			page = Integer.parseInt(nowPage);
		}
		int count = ed.getRowCount();
	
		
		//int pageCount = count%PAGEROW==0?count/PAGEROW:count/PAGEROW+1;
		int pageCount = count/PAGEROW;
		
		if(count%PAGEROW!=0){
			pageCount += 1;
		}
		if(page<1){
			page = 1;
		}
		if(page > pageCount){
			page = pageCount;
		}
		
		int start = (page-1) * PAGEROW + 1;
		int end = start + PAGEROW - 1;
		
		
		List elist = ed.findEmpList(start,end);

		request.setAttribute("elist", elist);
		request.setAttribute("page", page);
		request.setAttribute("endPage", pageCount);

		RequestDispatcher dispatcher = request.getRequestDispatcher("main.jsp");
		dispatcher.forward(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
