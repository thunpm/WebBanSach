package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Admin;
import model.bo.CheckLoginAdminBO;

public class AdminCheckLoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		
		String tenDangNhap = request.getParameter("tendangnhap");
		String matKhau = request.getParameter("matkhau");
		
		String message = "";
		CheckLoginAdminBO checkLoginAdminBO = new CheckLoginAdminBO();
		int check = checkLoginAdminBO.checkLogin(tenDangNhap, matKhau);
		
		if (check == 1 || check == 2) {
			if (check == 1) {
				message = "Vui lòng điền đầy đủ thông tin!";
			} else {
				message = "Tên đăng nhập hoặc mật khẩu không đúng!";
			}
			
			request.setAttribute("message", message);
			request.setAttribute("admin", new Admin(tenDangNhap, matKhau));
			
			rd = request.getRequestDispatcher("/views/admin/login.jsp");	
		} else if (check == 0) {
			
			session.setAttribute("admin", new Admin(tenDangNhap, matKhau));
			
			rd = request.getRequestDispatcher("/admin/trangchu");
		}
		
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
