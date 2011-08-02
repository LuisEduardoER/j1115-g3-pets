package cn.thepetshop.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.thepetshop.dao.PetDAO;

public class LoginFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest sreq, ServletResponse sres,
			FilterChain chain) throws IOException, ServletException {

		// System.out.println("doFilter.....");
		HttpServletRequest request = (HttpServletRequest) sreq;
		HttpServletResponse response = (HttpServletResponse) sres;
		Cookie[] cs = request.getCookies();

		String username = null;
		String password = null;

		if (cs != null) {
			for (Cookie c : cs) {
				if ("username".equals(c.getName())) {
					username = c.getValue(); // 接收Cookie信息
					System.out.println(username);
				} else if ("password".equals(c.getName())) {
					password = c.getValue(); // 接收Cookie信息
					System.out.println(password);
				}
			}
			PetDAO ed = new PetDAO();
			String userid = ed.login(username, password);
			if (userid != null) {

				// System.out.println("过滤成功！");
				request.getSession().setAttribute("username", username);
				request.getSession().setAttribute("userid", userid);

				// 如果是登录的action,则不做拦截.
				String url = request.getRequestURI();
				if (url.matches("/index.do")) {
					chain.doFilter(request, response);
					response.sendRedirect("IndexViewAlreadyLogin");
				}

			}
		 
		 else {
			// System.out.println("过滤失败！");
			chain.doFilter(request, response);
		}
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
