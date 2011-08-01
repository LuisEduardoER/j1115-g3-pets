package cn.thepetshop.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.thepetshop.dao.PetDAO;
import cn.thepetshop.object.Cart;

public class GetCartServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		String userid = (String)request.getSession().getAttribute("userid");
		userid = "2";//¡Ÿ ±
		PetDAO pd = new PetDAO();
		Cart cart = pd.getShoppingCart(userid);
		request.setAttribute("cart", cart);
//		System.out.println(cart.getSumMoney());
		request.getRequestDispatcher("/shoppingcart/mycart.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
