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
import model.bo.UpdateChiTietHoaDonBO;
import model.bo.UpdateHoaDonBO;

public class OrderServlet extends HttpServlet {

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
		
		GioHang gioHang = (GioHang) session.getAttribute("cart");
		KhachHang khachHang = (KhachHang) session.getAttribute("user");
		String message = "";
		ShowDiaChiBO showDiaChiBO = new ShowDiaChiBO();
		DiaChi diaChiKH = showDiaChiBO.getDiaChi(khachHang.getId());
		
		// chưa cập nhật địa chỉ
		if (diaChiKH == null || diaChiKH.getId() == 0 || diaChiKH.getTinh() == "" || diaChiKH.getHuyen() == "" 
				|| diaChiKH.getXa() == "" || diaChiKH.getDiaChi() == "") {
			message = "Bạn chưa cập nhật địa chỉ để chúng tôi giao hàng tới! Vui lòng cập nhật thông tin và quay lại mua nhé!";
			
			request.setAttribute("message", message);
			
			rd = request.getRequestDispatcher("views/user/order.jsp");
		} else {
		
			int check;		
			UpdateHoaDonBO updateHoaDonBO = new UpdateHoaDonBO();
			ShowKhachHangBO showKhachHangBO = new ShowKhachHangBO();
			khachHang = showKhachHangBO.getAccount(khachHang.getTenDangNhap());
			Timestamp thoiGian = new Timestamp(System.currentTimeMillis());
			System.out.print(thoiGian);
			check = updateHoaDonBO.insertHoaDon(khachHang.getId(), thoiGian, "Đang chờ xác nhận");
			
			if (check == 6) {
				message = "Đã xảy ra lỗi, vui lòng thử lại sau!";
				
				request.setAttribute("message", message);
				
				rd = request.getRequestDispatcher("views/user/order.jsp");
				rd.forward(request, response);
			} else {
			
				UpdateChiTietHoaDonBO updateChiTietHoaDonBO = new UpdateChiTietHoaDonBO();
				for (int i = 0; i < gioHang.getMatHang().size(); i++) {
					updateChiTietHoaDonBO.insertChiTietHoaDon(gioHang.getMatHang().get(i).getSanPham(), gioHang.getMatHang().get(i).getSoLuong());
				}
			}
			
			session.removeAttribute("cart");
			rd = request.getRequestDispatcher("showDonHang");		
		}
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
