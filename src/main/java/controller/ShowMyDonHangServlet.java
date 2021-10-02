package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.HoaDon;
import model.bean.KhachHang;
import model.bo.ShowKhachHangBO;
import model.bo.ShowDonHangBO;

public class ShowMyDonHangServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		
		String tenDangNhap = request.getParameter("tenDangNhap");
		
		ShowKhachHangBO showKhachHangBO = new ShowKhachHangBO();
		ShowDonHangBO showDonHangBO = new ShowDonHangBO();
		
		KhachHang khachHang = showKhachHangBO.getAccount(tenDangNhap);
		ArrayList<HoaDon> listHoaDon = showDonHangBO.getHoaDonByIdKhachHang(khachHang.getId());
		
		request.setAttribute("listHoaDon", listHoaDon);
		session.setAttribute("user", khachHang);
		
		rd = request.getRequestDispatcher("views/user/my_order.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
