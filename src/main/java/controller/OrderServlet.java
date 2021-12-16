package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.DiaChi;
import model.bean.GioHang;
import model.bean.KhachHang;
import model.bo.ShowDiaChiBO;
import model.bo.ShowKhachHangBO;
import model.bo.CartOfUserBO;
import model.bo.ChiTietHoaDonBO;
import model.bo.HoaDonBO;

public class OrderServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		
		// chưa đăng nhập thì bắt đăng nhập
		if (session.getAttribute("user") == null) {
			rd = request.getRequestDispatcher("showLogin");
			rd.forward(request, response);
		} 
		
		// chưa có giỏ hàng
		if (session.getAttribute("cart") == null) {
			rd = request.getRequestDispatcher("showIndex");
			rd.forward(request, response);
		}
		
		// lấy thông tin giỏ hàng, khách hàng, địa chỉ
		GioHang gioHang = (GioHang) session.getAttribute("cart");
		KhachHang khachHang = (KhachHang) session.getAttribute("user");
		String message = "";
		ShowDiaChiBO showDiaChiBO = new ShowDiaChiBO();
		DiaChi diaChiKH = showDiaChiBO.getDiaChiById(request.getParameter("diaChiMacDinh"));
		
		// lấy thông tin tổng tiền, tổng thanh toán từ request
		String tongTien = request.getParameter("tongTien");
		String tongThanhToan = request.getParameter("tongThanhToan");
		
		// chưa cập nhật địa chỉ
		if (diaChiKH == null || diaChiKH.getId() == 0 || diaChiKH.getTinh() == "" || diaChiKH.getHuyen() == "" 
				|| diaChiKH.getXa() == "" || diaChiKH.getDiaChi() == "") {
			message = "Bạn chưa cập nhật địa chỉ để chúng tôi giao hàng tới! Vui lòng cập nhật thông tin và quay lại mua nhé!";
			
			request.setAttribute("message", message);
			request.setAttribute("tongTien", tongTien);
			request.setAttribute("tongThanhToan", tongThanhToan);
			
			rd = request.getRequestDispatcher("views/user/order.jsp");
		} else {
			String check;		
			HoaDonBO hoaDonBO = new HoaDonBO();
			ShowKhachHangBO showKhachHangBO = new ShowKhachHangBO();
			khachHang = showKhachHangBO.getAccount(khachHang.getTenDangNhap());
			Timestamp thoiGian = new Timestamp(System.currentTimeMillis());
			check = hoaDonBO.insertHoaDon(khachHang.getId(), thoiGian, "Đang chờ xác nhận");
			
			// lỗi
			if ("6".equals(check)) {
				message = "Đã xảy ra lỗi, vui lòng thử lại sau!";
				
				request.setAttribute("message", message);
				
				rd = request.getRequestDispatcher("views/user/order.jsp");
				rd.forward(request, response);
			// không lỗi
			} else {
				// thêm vào bảng chi tiết đơn hàng các sản phẩm của đơn hàng vừa đặt
				ChiTietHoaDonBO chiTietHoaDonBO = new ChiTietHoaDonBO();
				for (int i = 0; i < gioHang.getMatHang().size(); i++) {
					System.out.println(gioHang.getMatHang().get(i).getDonGia() + gioHang.getMatHang().get(i).getKhuyenMai());
					chiTietHoaDonBO.insertChiTietHoaDon(check, gioHang.getMatHang().get(i).getSanPham(), gioHang.getMatHang().get(i).getSoLuong(), gioHang.getMatHang().get(i).getDonGia(), gioHang.getMatHang().get(i).getKhuyenMai());
				}
			}
			
			// hủy giỏ hàng đi
			CartOfUserBO cartOfUserBO = new CartOfUserBO();
			cartOfUserBO.removeAll(khachHang.getId());
			
			session.removeAttribute("cart");
			rd = request.getRequestDispatcher("showDonHang");		
		}
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
