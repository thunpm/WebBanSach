package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.DeleteKhachHangBO;
import model.bo.UpdateKhachHangBO;

public class AdminDeleteKhachHangServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
	
		DeleteKhachHangBO deleteKhachHangBO = new DeleteKhachHangBO();
		String message = "";
		
		String idKhachHang = request.getParameter("idKhachHang");
		
		int check = deleteKhachHangBO.deleteKhachHang(idKhachHang);
		
		if (check == 0) {
			message = "Đã xóa thành công!";
			
		} else {
			message = "Lỗi không xác định";
			
		}
		
		request.setAttribute("message", message);
		
		rd = request.getRequestDispatcher("/admin/quanLyKhachHang");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
