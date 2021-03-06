package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.MatHang;
import model.bo.ShowDetailDonHangBO;

public class ShowDetailDonHangServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		// lấy chi tiết đơn hàng của khách hàng
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		
		if (session.getAttribute("user") == null) {
			rd = request.getRequestDispatcher("showLogin");
			rd.forward(request, response);
		} 
		String idDonHang = request.getParameter("idDonHang");
		
		ShowDetailDonHangBO showDetailMyDonHangBO = new ShowDetailDonHangBO();
		ArrayList<MatHang> listMatHang = showDetailMyDonHangBO.getMatHangByIdHoaDon(idDonHang);
		
		request.setAttribute("listMatHang", listMatHang);
		
		rd = request.getRequestDispatcher("views/user/detail_my_order.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
