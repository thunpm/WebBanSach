package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ShowOrderServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		
		if (session.getAttribute("user") == null) {
			rd = request.getRequestDispatcher("showLogin");
			rd.forward(request, response);
		} 
		
		String tongTien = request.getParameter("tongTien");
		
		request.setAttribute("tongTien", tongTien);
		
		if (session.getAttribute("user") == null) {
			rd = request.getRequestDispatcher("views/user/login.jsp");
		} else {
			rd = request.getRequestDispatcher("views/user/order.jsp");
		}
		
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
