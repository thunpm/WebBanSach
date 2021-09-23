package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.KhachHang;
import model.bean.MatHang;
import model.bo.ShowDetailMyDonHangBO;

public class ShowDetailMyDonHangServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		
		String idDonHang = request.getParameter("idDonHang");
		
		ShowDetailMyDonHangBO showDetailMyDonHangBO = new ShowDetailMyDonHangBO();
		KhachHang khachHang = (KhachHang) session.getAttribute("user");
		ArrayList<MatHang> listMatHang = showDetailMyDonHangBO.getMatHangByIdHoaDon(idDonHang);
		
		request.setAttribute("listMatHang", listMatHang);
		
		rd = request.getRequestDispatcher("views/user/detail_my_order.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
