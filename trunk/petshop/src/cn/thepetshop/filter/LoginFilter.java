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
					username = c.getValue(); // ����Cookie��Ϣ
					System.out.println(username);
				} else if ("password".equals(c.getName())) {
					password = c.getValue(); // ����Cookie��Ϣ
					System.out.println(password);
				}
			}
			PetDAO ed = new PetDAO();
			String userid = ed.login(username, password);
			if (userid != null) {

				// System.out.println("���˳ɹ���");
				request.getSession().setAttribute("username", username);
				request.getSession().setAttribute("userid", userid);

				// ����ǵ�¼��action,��������.
				String url = request.getRequestURI();
				if (url.matches("/index.do")) {
					chain.doFilter(request, response);
					response.sendRedirect("IndexViewAlreadyLogin");
				}

			}
		 
		 else {
			// System.out.println("����ʧ�ܣ�");
			chain.doFilter(request, response);
		}
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
