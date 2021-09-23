package controller;

import java.io.IOException;

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

public class ShowKhachHangServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		
		String tenDangNhap = request.getParameter("tenDangNhap");
		String key = request.getParameter("key");
		
		ShowKhachHangBO showKhachHangBO = new ShowKhachHangBO();
		ShowDiaChiBO showDiaChiBO = new ShowDiaChiBO();
		DiaChi diaChiKH = new DiaChi();
		
		KhachHang khachHang = showKhachHangBO.getAccount(tenDangNhap);
		diaChiKH = showDiaChiBO.getDiaChi(khachHang.getId());
		khachHang.setDiaChi(diaChiKH);
		session.setAttribute("user", khachHang);
		
		if (key == null || "".equals(key)) {
			key = "information";
		}
		request.setAttribute("key", key);
		if ("information".equals(key)) {
			rd = request.getRequestDispatcher("views/user/update_information_user.jsp");
		} else if ("password".equals(key)) {
			rd = request.getRequestDispatcher("views/user/update_password_user.jsp");
		} else if ("address".equals(key)) {
			rd = request.getRequestDispatcher("views/user/update_address_user.jsp");
		}
		
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
