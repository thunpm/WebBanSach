package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.KhachHang;
import model.bo.ShowKhachHangBO;

public class ShowKhachHangServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		String tenDangNhap = request.getParameter("tendangnhap");
		System.out.println(tenDangNhap);
		
		ShowKhachHangBO showKhachHangBO = new ShowKhachHangBO();
		RequestDispatcher rd = null;
		
		KhachHang khachHang = showKhachHangBO.getAccount(tenDangNhap);
		
		request.setAttribute("khachHang", khachHang);
		
		rd = request.getRequestDispatcher("views/user/show-user.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
