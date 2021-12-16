package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.DiaChi;
import model.bean.KhachHang;
import model.bo.ShowDiaChiBO;
import model.bo.ShowKhachHangBO;
import model.bo.UpdateDiaChiBO;
import model.bo.UpdateKhachHangBO;

public class UpdateKhachHangServlet extends HttpServlet {
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
		
		String key = request.getParameter("key");

		int check = 0;
		String message = "";
		KhachHang khachHang = (KhachHang) session.getAttribute("user");
		
		if ("information".equals(key)) { // thông tin cá nhân
			UpdateKhachHangBO updateKhachHangBO = new UpdateKhachHangBO();
			
			String tenDangNhap = request.getParameter("tenDangNhap");
			String hoTen = request.getParameter("hoTen");
			String soDienThoai = request.getParameter("soDienThoai");
			String email = request.getParameter("email");
			String gioiTinh = request.getParameter("gioiTinh");
			String ngaySinh = request.getParameter("ngaySinh");
			String thangSinh = request.getParameter("thangSinh");
			String namSinh = request.getParameter("namSinh");
			check = updateKhachHangBO.checkUpdateInformation(tenDangNhap, hoTen, soDienThoai, email, gioiTinh, ngaySinh, thangSinh, namSinh);
			if (check == 0) { // hợp lệ thì tiến hành cập nhật lại thông tin trong session
				ShowKhachHangBO showKhachHangBO = new ShowKhachHangBO();
				ShowDiaChiBO showDiaChiBO = new ShowDiaChiBO();
				ArrayList<DiaChi> diaChiKH = new ArrayList<>();
				
				khachHang = showKhachHangBO.getAccount(tenDangNhap);
				diaChiKH = showDiaChiBO.getDiaChi(khachHang.getId());
				khachHang.setDiaChi(diaChiKH);
				
				session.setAttribute("user", khachHang);
				message = "Đã cập nhật thành công!";
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
			
			rd = request.getRequestDispatcher("views/user/update_information_user.jsp");
			
		} else if ("password".equals(key)) {
			UpdateKhachHangBO updateKhachHangBO = new UpdateKhachHangBO();
			
			String tenDangNhap = request.getParameter("tenDangNhap");
			String matKhauCu = request.getParameter("matKhauCu");
			String matKhauMoi = request.getParameter("matKhauMoi");
			String nhapLaiMatKhau = request.getParameter("nhapLaiMatKhau"); 
			
			check = updateKhachHangBO.checkUpdateInformation(tenDangNhap, matKhauCu, matKhauMoi, nhapLaiMatKhau);
			if (check == 0) { // đổi mật khẩu thành công thì đăng xuất để đăng nhập lại
				session.removeAttribute("user");	
				rd = request.getRequestDispatcher("views/user/login.jsp");
			} else {
				if (check == 1) {
					message = "Vui lòng điền đầy đủ thông tin cần thiết!";
				} else if (check == 5) {
					message = "Mật khẩu không khớp!";
				} else if (check == 6) {
					message = "Mật khẩu cũ không đúng, vui lòng thử lại!";
				}

				rd = request.getRequestDispatcher("views/user/update_password_user.jsp");
				
			}	
		} else if ("address".equals(key)) {
			UpdateDiaChiBO updateDiaChiBO = new UpdateDiaChiBO();
			
			String action = request.getParameter("action");
			String idKhachHang = request.getParameter("idKhachHang");
			String tinh = request.getParameter("tinh");
			String huyen = request.getParameter("huyen");
			String xa = request.getParameter("xa");
			String diaChi = request.getParameter("diaChi");
			
			if ("add".equals(action)) { // thêm địa chỉ
				if (khachHang.getDiaChi().size() == 0) { // nếu chưa có địa chỉ nào thì địa chỉ vừa thêm sẽ là mặc định
					check = updateDiaChiBO.insertDiaChi(idKhachHang, tinh, huyen, xa, diaChi, 1);
				} else {
					check = updateDiaChiBO.insertDiaChi(idKhachHang, tinh, huyen, xa, diaChi, 0);
				}
				
				if (check == 0) {
					message = "Đã thêm thành công!";
					
					ShowKhachHangBO showKhachHangBO = new ShowKhachHangBO();
					ShowDiaChiBO showDiaChiBO = new ShowDiaChiBO();
					ArrayList<DiaChi> diaChiKH = new ArrayList<>();
					khachHang = showKhachHangBO.getAccountById(idKhachHang);
					diaChiKH = showDiaChiBO.getDiaChi(khachHang.getId());
					khachHang.setDiaChi(diaChiKH);
					session.setAttribute("user", khachHang);
					
				} else {
					if (check == 1) {
						message = "Vui lòng điền đầy đủ thông tin cần thiết!";
					} else if (check == 6) {
						message = "Đã xảy ra lỗi, vui lòng thử lại sau!";
					}
					
				}
			} else if ("update".equals(action)) {
				String idDiaChi = request.getParameter("idDiaChi");
				
				check = updateDiaChiBO.updateDiaChi(idDiaChi, tinh, huyen, xa, diaChi);
	
				if (check == 0) {
					message = "Đã cập nhật thành công!";
					
					ShowKhachHangBO showKhachHangBO = new ShowKhachHangBO();
					ShowDiaChiBO showDiaChiBO = new ShowDiaChiBO();
					ArrayList<DiaChi> diaChiKH = new ArrayList<>();
					khachHang = showKhachHangBO.getAccountById(idKhachHang);
					diaChiKH = showDiaChiBO.getDiaChi(khachHang.getId());
					khachHang.setDiaChi(diaChiKH);
					session.setAttribute("user", khachHang);
					
				} else {
					if (check == 1) {
						message = "Vui lòng điền đầy đủ thông tin cần thiết!";
					} else if (check == 6) {
						message = "Đã xảy ra lỗi, vui lòng thử lại sau!";
					}
					
				}
			} else if ("delete".equals(action)) {
				String idDiaChi = request.getParameter("idDiaChi");
				
				check = updateDiaChiBO.deleteDiaChi(idDiaChi);
	
				if (check == 0) {
					message = "Đã xóa thành công!";
					
					ShowKhachHangBO showKhachHangBO = new ShowKhachHangBO();
					ShowDiaChiBO showDiaChiBO = new ShowDiaChiBO();
					ArrayList<DiaChi> diaChiKH = new ArrayList<>();
					khachHang = showKhachHangBO.getAccountById(idKhachHang);
					diaChiKH = showDiaChiBO.getDiaChi(khachHang.getId());
					khachHang.setDiaChi(diaChiKH);
					session.setAttribute("user", khachHang);
					
				} else {
					message = "Đã xảy ra lỗi, vui lòng thử lại sau!";
					
				}
			} else if ("setDefault".equals(action)) { // set địa chỉ mặc định
				String idDiaChi = request.getParameter("idDiaChi");
				
				check = updateDiaChiBO.updateDiaChi(idDiaChi, 1);
	
				if (check == 0) {
					message = "Đã cập nhật thành công!";
					
					ShowKhachHangBO showKhachHangBO = new ShowKhachHangBO();
					ShowDiaChiBO showDiaChiBO = new ShowDiaChiBO();
					ArrayList<DiaChi> diaChiKH = new ArrayList<>();
					khachHang = showKhachHangBO.getAccountById(idKhachHang);
					diaChiKH = showDiaChiBO.getDiaChi(khachHang.getId());
					khachHang.setDiaChi(diaChiKH);
					session.setAttribute("user", khachHang);
					
				} else {
					message = "Đã xảy ra lỗi, vui lòng thử lại sau!";
				}
			}
			rd = request.getRequestDispatcher("views/user/update_address_user.jsp");
			
		}
		
		request.setAttribute("message", message);
		request.setAttribute("key", key);
		
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
