package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.HoaDonBO;

public class AdminDeleteDonHangServlet extends HttpServlet {

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
	
		HoaDonBO donHangBO = new HoaDonBO();
		String message = "";
		
		String id = request.getParameter("idDonHang");
		
		int check = donHangBO.delete(id);
		
		if (check == 0) {
			message = "Đã xóa thành công!";
			
		} else {
			message = "Lỗi không xác định";
			
		}
		
		request.setAttribute("message", message);
		request.setAttribute("don", request.getAttribute("don"));
		
		rd = request.getRequestDispatcher("/admin/quanLyHoaDon");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
