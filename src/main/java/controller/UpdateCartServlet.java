package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.GioHang;

public class UpdateCartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		
		String soLuong;
		GioHang gioHang = (GioHang) session.getAttribute("cart");
		
		for (int i = 0; i < gioHang.getMatHang().size(); i++) {
			String id = gioHang.getMatHang().get(i).getSanPham().getId();
			soLuong = request.getParameter(id);
			
			System.out.println(soLuong);
			
			gioHang.getMatHang().get(i).setSoLuong(Integer.valueOf(soLuong));
		}
		
		session.setAttribute("cart", gioHang);
		
		rd = request.getRequestDispatcher("views/user/cart.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
