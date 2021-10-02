package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.AddDanhMucBO;

public class AdminAddDanhMucServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		
		String tenDanhMuc = request.getParameter("tenDanhMuc");
		String message = "";
		AddDanhMucBO addDanhMucBO = new AddDanhMucBO();
		
		int check = addDanhMucBO.add(tenDanhMuc);
		
		if (check == 0) {
			message = "Đã thêm thành công!";
			
			rd = request.getRequestDispatcher("/admin/quanLyDanhMuc");
		} else {
			if (check == 1) {
				message = "Vui lòng nhập đầy đủ!";
			} else {
				message = "Lỗi không xác định!";
			}
			
			rd = request.getRequestDispatcher("/views/admin/add_danhmuc.jsp");
		}
		
		rd = request.getRequestDispatcher("/admin/quanLyDanhMuc");
		
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
