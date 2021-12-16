package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.HoaDonBO;


public class AdminUpdateDonHangServlet extends HttpServlet {

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
		
		String id = request.getParameter("id");
		String trangThai = request.getParameter("trangThai");
		
		// update trạng thái đơn hàng
		if ("2".equals(trangThai)) {
			trangThai = "Đang chuẩn bị hàng";
		} else if ("3".equals(trangThai)) {
			trangThai = "Đang giao";
		} else if ("4".equals(trangThai)) {
			trangThai = "Đã giao";
		}
		
		HoaDonBO updateHoaDonBO = new HoaDonBO();
		updateHoaDonBO.updateTrangThai(id, trangThai);
		
		request.setAttribute("don", request.getAttribute("don"));
		
		rd = request.getRequestDispatcher("/admin/quanLyHoaDon");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
