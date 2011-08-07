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
import javax.servlet.http.HttpSession;

import cn.thepetshop.dao.PetDAO;

public class LoginFilter implements Filter {

	public void destroy() {
		
	}

	public void doFilter(ServletRequest sreq, ServletResponse sres,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) sreq;
		HttpServletResponse response = (HttpServletResponse) sres;
		HttpSession session = request.getSession();
		String userid = null;
		boolean b = false;
		
		//对于一些普通的页面则直接给予放行，这里给出不过滤的类型
//		if(request.getServletPath().matches(regex)){//正则判断页面是否需要过滤
		b = true;
		
		if(session.getAttribute("username")!=null){
			b = true;//session 存在用户名，则表示用户已经登录，放行
		}else{
			Cookie[] cs = request.getCookies();
			if(cs != null){
				String username = null;
				String password = null;
				for (Cookie c : cs) {//得到cookies里的用户名和密码
					if ("username".equals(c.getName())) {
						username = c.getValue();
//						System.out.println(username);
					} else if ("password".equals(c.getName())) {
						password = c.getValue();
//						System.out.println(password);
					}
				}
				if( username!=null && password!=null ){//判断是否从cookies得到了用户信息
					PetDAO ed = new PetDAO();
					userid = ed.login(username, password);//尝试用cookies的信息进行登录验证
//					System.out.println(userid);
					if(userid != null){//登录验证通过，将username 和 userid 写入 session 并且放行
						session.setAttribute("username", username);
						session.setAttribute("userid", userid);
						b = true;//放行
					}else{
						session.setAttribute("username", null);
						session.setAttribute("userid", null);
					}
				}
			}
		}
//		
//		if(request.getRequestURI().matches("^.*admin.*$|^.*Admin.*$")){//正则判断页面是否需要过滤
//			if(userid.length()<5){
//				b = true;
//			}else{
//				b = false;
//			}
//		}
		
		if(b){
			chain.doFilter(request, response);
		}else{
//			session.setAttribute("preurl", request.getRequestURL().toString());
			//将url存入session中，名字为preurl，以便登录成功后跳回登录前的的网页，
			//需要在登录action实现判断是否存在preurlattribute如果存在则进行跳转，否则就返回默认页面
			response.sendRedirect("IndexView");//登入界面
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
