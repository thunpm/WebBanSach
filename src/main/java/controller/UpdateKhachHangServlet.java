package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.KhachHang;
import model.bo.ShowKhachHangBO;
import model.bo.UpdateKhachHangBO;

public class UpdateKhachHangServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		String key = request.getParameter("key");
		String tenDangNhap = request.getParameter("tenDangNhap");

		UpdateKhachHangBO updateKhachHangBO = new UpdateKhachHangBO();
		ShowKhachHangBO showKhachHangBO = new ShowKhachHangBO();
		int check = 0;
		String message = "";
		HttpSession session = request.getSession();
		KhachHang khachHang;
		request.setAttribute("key", key);
		if ("information".equals(key)) {
			String hoTen = request.getParameter("hoTen");
			String soDienThoai = request.getParameter("soDienThoai");
			String email = request.getParameter("email");
			String gioiTinh = request.getParameter("gioiTinh");
			String ngaySinh = request.getParameter("ngaySinh");
			String thangSinh = request.getParameter("thangSinh");
			String namSinh = request.getParameter("namSinh");
			check = updateKhachHangBO.checkUpdateInformation(tenDangNhap, hoTen, soDienThoai, email, gioiTinh, ngaySinh, thangSinh, namSinh);
			if (check == 0) {
				message = "Đã cập nhật thành công!";
				khachHang = showKhachHangBO.getAccount(tenDangNhap);
				session.setAttribute("user", khachHang);	
			} else {
				if (check == 1) {
					message = "Vui lòng điền đầy đủ thông tin cần thiết!";
				} else if (check == 2) {
					message = "Số điện thoại không hợp lệ!";
				} else if (check == 3) {
					message = "Email không hợp lệ!";
				} else if (check == 4) {
					message = "Ngày tháng năm sinh không hợp lệ!";
				} else if (check == 6) {
					message = "Đã xảy ra lỗi, vui lòng thử lại!";
				}
			}
			request.setAttribute("message", message);
			rd = request.getRequestDispatcher("views/user/update_information_user.jsp");
		} else if ("password".equals(key)) {
			String matKhauCu = request.getParameter("matKhauCu");
			String matKhauMoi = request.getParameter("matKhauMoi");
			String nhapLaiMatKhau = request.getParameter("nhapLaiMatKhau"); 
			
			check = updateKhachHangBO.checkUpdateInformation(tenDangNhap, matKhauCu, matKhauMoi, nhapLaiMatKhau);
			if (check == 0) {
				session.removeAttribute("user");	
				rd = request.getRequestDispatcher("views/user/login.jsp");
			} else {
				if (check == 1) {
					message = "Vui lòng điền đầy đủ thông tin cần thiết!";
				} else if (check == 6) {
					message = "Mật khẩu cũ không đúng, vui lòng thử lại!";
				}
				request.setAttribute("message", message);
				rd = request.getRequestDispatcher("views/user/update_password_user.jsp");
			}	
		} else if ("address".equals(key)) {
			// tính sau
		}
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
