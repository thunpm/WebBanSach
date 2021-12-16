package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.GioHang;
import model.bean.KhachHang;
import model.bean.MatHang;
import model.bean.SanPham;
import model.bo.CartOfUserBO;
import model.bo.ShowSanPhamBO;

public class AddToCartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		
		// lấy id của sản phẩm được thêm
		String id = request.getParameter("idProduct");
		
		// lấy thông tin sản phẩm được thêm bằng id
		ShowSanPhamBO showSanPhamBo = new ShowSanPhamBO();
		SanPham sanPham = showSanPhamBo.getSanPhamById(id);
		
		//-------------- tiến hành thêm vào giỏ hàng-------------------
		GioHang cart = null;
		String message = "";

		// Neu nguoi dung da dang nhap thi lay gio hang cua nguoi dung
		if (session.getAttribute("user") != null) {
			// lấy thông tin đăng nhập của khách hàng
			KhachHang khachHang = (KhachHang) session.getAttribute("user");
			
			// lấy sản phẩm trong giỏ hàng của khách hàng từ csdl
			CartOfUserBO cartOfUserBO = new CartOfUserBO();
			cart = (GioHang) cartOfUserBO.getCart(khachHang.getId());
			
			boolean daCo = false;
			// kiểm coi mặt hàng đã có trong giỏ hàng hay chưa
			for (int i = 0; i < cart.getMatHang().size(); i++) {
				// có rồi thì cộng lên 1
				if (cart.getMatHang().get(i).getSanPham().getId().equals(id)) {
					int soLuong = cart.getMatHang().get(i).getSoLuong() + 1;
					// nếu số lượng hiện có đủ mới cộng, không thì thôi
					if (sanPham.getSoLuongCo() > soLuong) { 
						cartOfUserBO.updateCart(khachHang.getId(), cart.getMatHang().get(i).getSanPham().getId(), soLuong);
						cart.getMatHang().get(i).setSoLuong(soLuong);
					} else {
						message = "Số lượng sản phẩm " + sanPham.getTenSanPham() + " không đủ để mua thêm!";
					}
					daCo = true;
				}
			}
			// chưa có thì thêm vô
			if (daCo == false) {
				if (sanPham.getSoLuongCo() > 1) {
					MatHang matHang = new MatHang(sanPham, 1, sanPham.getGia(), sanPham.getKhuyenMai());
					
					cartOfUserBO.insertCart(khachHang.getId(), sanPham.getId());
					cart.getMatHang().add(matHang);
				} else {
					message = "Số lượng sản phẩm " + sanPham.getTenSanPham() + " không đủ để mua thêm!";
				}
			}
		// nếu người dùng chưa đăng nhập thì lưu giỏ hàng vào session	
		} else {
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
					if (sanPham.getSoLuongCo() > soLuong) { 
						cart.getMatHang().get(i).setSoLuong(soLuong);
					} else {
						message = "Số lượng sản phẩm " + sanPham.getTenSanPham() + " không đủ để mua thêm!";
					}
					daCo = true;
				}
			}
			if (daCo == false) {
				if (sanPham.getSoLuongCo() > 1) {
					MatHang matHang = new MatHang(sanPham, 1, sanPham.getGia(), sanPham.getKhuyenMai());
					cart.getMatHang().add(matHang);
				} else {
					message = "Số lượng sản phẩm " + sanPham.getTenSanPham() + " không đủ để mua thêm!";
				}
			}
		}
		
		session.setAttribute("cart", cart);
		request.setAttribute("message", message);
		
		rd = request.getRequestDispatcher("showCart");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
