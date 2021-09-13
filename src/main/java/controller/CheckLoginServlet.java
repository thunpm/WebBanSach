package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.KhachHang;
import model.bo.CheckLoginBO;

public class CheckLoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		String tenDangNhap = request.getParameter("tendangnhap");
		String matKhau = request.getParameter("matkhau");
		
		String message = "";
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		
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
			rd.forward(request, response);
		} else if (check == 1) {
			
			session.setAttribute("user", new KhachHang(tenDangNhap, matKhau));
			
			rd = request.getRequestDispatcher("showIndex");
			rd.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
