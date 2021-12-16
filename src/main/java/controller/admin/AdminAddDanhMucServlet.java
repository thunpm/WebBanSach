package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.DanhMucBO;

public class AdminAddDanhMucServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		
		if (session.getAttribute("admin") == null) {
			rd = request.getRequestDispatcher("/admin");
			rd.forward(request, response);
		} 
		
		if (session.getAttribute("admin") == null) {
			rd = request.getRequestDispatcher("admin");
			rd.forward(request, response);
		} 
		
		String tenDanhMuc = request.getParameter("tenDanhMuc");
		String message = "";
		DanhMucBO danhMucBO = new DanhMucBO();
		
		int check = danhMucBO.add(tenDanhMuc);
		
		if (check == 0) {
			message = "Đã thêm thành công!";
			
			request.setAttribute("message", message);
			rd = request.getRequestDispatcher("/admin/quanLyDanhMuc");
		} else {
			if (check == 1) {
				message = "Vui lòng nhập đầy đủ!";
			} else {
				message = "Lỗi không xác định!";
			}
			
			request.setAttribute("message", message);
			rd = request.getRequestDispatcher("/views/admin/add_danhmuc.jsp");
		}
		
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
