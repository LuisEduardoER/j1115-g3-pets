package com.java.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


//过滤器
public class MyFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("destroy.......");
	}

	@Override
	public void doFilter(ServletRequest sreq, ServletResponse sres,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		System.out.println("doFilter.........");
		HttpServletRequest request = (HttpServletRequest)sreq;
		HttpServletResponse response = (HttpServletResponse)sres;
		HttpSession session = request.getSession();
		Object u = session.getAttribute("user");
		String path = request.getServletPath(); //获得所要访问地址的最后路径名
		System.out.println(path);
		if(u!=null || path.endsWith("login.jsp") || path.endsWith("LoginServlet") ){
			chain.doFilter(sreq, sres);// 放行
		}else{
			response.sendRedirect("login.jsp");
		}
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("init........");
	}

}
