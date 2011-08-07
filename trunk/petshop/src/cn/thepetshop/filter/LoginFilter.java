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
		
		//����һЩ��ͨ��ҳ����ֱ�Ӹ�����У�������������˵�����
//		if(request.getServletPath().matches(regex)){//�����ж�ҳ���Ƿ���Ҫ����
		b = true;
		
		if(session.getAttribute("username")!=null){
			b = true;//session �����û��������ʾ�û��Ѿ���¼������
		}else{
			Cookie[] cs = request.getCookies();
			if(cs != null){
				String username = null;
				String password = null;
				for (Cookie c : cs) {//�õ�cookies����û���������
					if ("username".equals(c.getName())) {
						username = c.getValue();
//						System.out.println(username);
					} else if ("password".equals(c.getName())) {
						password = c.getValue();
//						System.out.println(password);
					}
				}
				if( username!=null && password!=null ){//�ж��Ƿ��cookies�õ����û���Ϣ
					PetDAO ed = new PetDAO();
					userid = ed.login(username, password);//������cookies����Ϣ���е�¼��֤
//					System.out.println(userid);
					if(userid != null){//��¼��֤ͨ������username �� userid д�� session ���ҷ���
						session.setAttribute("username", username);
						session.setAttribute("userid", userid);
						b = true;//����
					}else{
						session.setAttribute("username", null);
						session.setAttribute("userid", null);
					}
				}
			}
		}
//		
//		if(request.getRequestURI().matches("^.*admin.*$|^.*Admin.*$")){//�����ж�ҳ���Ƿ���Ҫ����
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
			//��url����session�У�����Ϊpreurl���Ա��¼�ɹ������ص�¼ǰ�ĵ���ҳ��
			//��Ҫ�ڵ�¼actionʵ���ж��Ƿ����preurlattribute��������������ת������ͷ���Ĭ��ҳ��
			response.sendRedirect("IndexView");//�������
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
