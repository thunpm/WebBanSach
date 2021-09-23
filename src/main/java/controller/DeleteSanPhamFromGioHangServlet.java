package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.GioHang;

public class DeleteSanPhamFromGioHangServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		HttpSession session = request.getSession();
		RequestDispatcher rd = null;
		
		String id = request.getParameter("idProduct");
		
		int viTri = 0;
		GioHang cart = (GioHang) session.getAttribute("cart");
		
		for (int i = 0; i < cart.getMatHang().size(); i++) {
			if (cart.getMatHang().get(i).getSanPham().getId().equals(id)) {
				viTri = i;
				break;
			}
		}
		cart.getMatHang().remove(viTri);
		session.setAttribute("cart", cart);
		
		rd = request.getRequestDispatcher("views/user/cart.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
