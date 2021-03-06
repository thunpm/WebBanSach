package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.KhachHang;
import model.bo.CheckRegisterBO;

public class CheckRegisterServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		
		// lấy toàn bộ thông tin đăng ký
		String tenDangNhap = request.getParameter("tenDangNhap");
		String hoTen = request.getParameter("hoTen");
		String soDienThoai = request.getParameter("soDienThoai");
		String email = request.getParameter("email");
		String gioiTinh = request.getParameter("gioiTinh");
		String ngaySinh = request.getParameter("ngaySinh");
		String thangSinh = request.getParameter("thangSinh");
		String namSinh = request.getParameter("namSinh");
		String matKhau = request.getParameter("matKhau");
		String nhapLaiMatKhau = request.getParameter("nhapLaiMatKhau");
		
		String message = "";
		CheckRegisterBO checkRegisterBO = new CheckRegisterBO();
		
		// kiểm tra đăng kí
		int check = checkRegisterBO.checkRegister(tenDangNhap, hoTen, soDienThoai, email, gioiTinh, ngaySinh, thangSinh, namSinh, matKhau, nhapLaiMatKhau);
		
		if (check == 0) {
			rd = request.getRequestDispatcher("showLogin");
		} else {
			if (check == 1) {
				message = "Vui lòng điền đầy đủ thông tin cần thiết!";
			} else if (check == 2) {
				message = "Số điện thoại không hợp lệ!";
			} else if (check == 3) {
				message = "Email không hợp lệ!";
			} else if (check == 4) {
				message = "Ngày tháng năm sinh không hợp lệ!";
			} else if (check == 5) {
				message = "Mật khẩu không khớp!";
			} else if (check == 6) {
				message = "Tên đăng nhập hoặc số điện thoại đã tồn tại!";
			}
			
			// trả về ngày mặc định nếu như khách hàng nhập ngày tháng năm sinh không hợp lệ
			Date date = Date.valueOf("2021-01-01");
			try {
				date = Date.valueOf(namSinh + "-" + thangSinh + "-"  + ngaySinh);
			} catch (Exception e) {
				
			}
			request.setAttribute("message", message);
			request.setAttribute("khachHang", new KhachHang(tenDangNhap, hoTen, soDienThoai, matKhau, email, gioiTinh, date));
			
			rd = request.getRequestDispatcher("views/user/register.jsp");
		}
		
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
