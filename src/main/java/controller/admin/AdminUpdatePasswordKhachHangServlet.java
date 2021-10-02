package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.DiaChi;
import model.bean.KhachHang;
import model.bo.ShowDiaChiBO;
import model.bo.ShowKhachHangBO;
import model.bo.UpdateKhachHangBO;

public class AdminUpdatePasswordKhachHangServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		
		UpdateKhachHangBO updateKhachHangBO = new UpdateKhachHangBO();
		String message = "";
		
		String idKhachHang = request.getParameter("idKhachHang");
		String matKhau = request.getParameter("matKhau");
		String nhapLaiMatKhau = request.getParameter("nhapLaiMatKhau");
		
		int check = updateKhachHangBO.updatePassword(idKhachHang, matKhau, nhapLaiMatKhau);
		
		if (check == 0) {
			message = "Đã update mật khẩu cho khách hàng " + idKhachHang;
			
			System.out.println(message);
			rd = request.getRequestDispatcher("/admin/quanLyKhachHang");
		} else {
			if (check == 1) {
				message = "Vui lòng nhập đầy đủ thông tin!";
			} else if (check == 2) {
				message = "Mật khẩu không khớp!";
			} else {
				message = "Lỗi không xác định";
			}
			rd = request.getRequestDispatcher("/views/admin/update_password_user.jsp");
		}
		
		request.setAttribute("message", message);

		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
