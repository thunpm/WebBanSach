package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.GioHang;
import model.bean.MatHang;
import model.bean.SanPham;
import model.bo.ShowSanPhamBO;

public class AddToCartServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		
		String id = request.getParameter("idProduct");
		
		ShowSanPhamBO showSanPhamBo = new ShowSanPhamBO();
		SanPham sanPham = showSanPhamBo.getSanPhamById(id);
		GioHang cart = null;
		
		if (session.getAttribute("cart") == null) {
			cart = new GioHang();
		} else {
			cart = (GioHang) session.getAttribute("cart");
		}
	
		boolean daCo = false;
		// kiểm coi mặt hàng đã có trong giỏ hàng hay chưa
		for (int i = 0; i < cart.getMatHang().size(); i++) {
			// có rồi thì cộng lên 1
			if (cart.getMatHang().get(i).getSanPham().getId().equals(id)) {
				int soLuong = cart.getMatHang().get(i).getSoLuong() + 1;
				cart.getMatHang().get(i).setSoLuong(soLuong);
				daCo = true;
			}
		}
		if (daCo == false) {
			MatHang matHang = new MatHang(sanPham, 1);
			cart.getMatHang().add(matHang);
		}
		
		session.setAttribute("cart", cart);
		
		rd = request.getRequestDispatcher("views/user/cart.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
