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
import model.bo.CheckLoginBO;
import model.bo.ShowDiaChiBO;
import model.bo.ShowKhachHangBO;

public class CheckLoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		
		String tenDangNhap = request.getParameter("tendangnhap");
		String matKhau = request.getParameter("matkhau");
		
		String message = "";
		CheckLoginBO checkLoginBO = new CheckLoginBO();
		int check = checkLoginBO.checkLogin(tenDangNhap, matKhau);
		
		if (check == 0 || check == 2) {
			if (check == 0) {
				message = "Vui lòng điền đầy đủ thông tin!";
			} else {
				message = "Tên đăng nhập hoặc mật khẩu không đúng!";
			}
			
			request.setAttribute("message", message);
			request.setAttribute("user", new KhachHang(tenDangNhap, matKhau));
			
			rd = request.getRequestDispatcher("views/user/login.jsp");	
		} else if (check == 1) {
			ShowKhachHangBO showKhachHangBO = new ShowKhachHangBO();
			ShowDiaChiBO showDiaChiBO = new ShowDiaChiBO();
			ArrayList<DiaChi> diaChiKH = new ArrayList<>();
			KhachHang khachHang = showKhachHangBO.getAccount(tenDangNhap);
			diaChiKH = showDiaChiBO.getDiaChi(khachHang.getId());
			khachHang.setDiaChi(diaChiKH);
			session.setAttribute("user", khachHang);
			
			rd = request.getRequestDispatcher("showIndex");
		}
		
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
