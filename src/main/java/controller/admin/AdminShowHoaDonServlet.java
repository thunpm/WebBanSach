package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.HoaDon;
import model.bo.ShowDonHangBO;

public class AdminShowHoaDonServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		ShowDonHangBO showDonHangBO = new ShowDonHangBO();

		ArrayList<HoaDon> listHoaDon = showDonHangBO.getAllHoaDon();
		
		request.setAttribute("listHoaDon", listHoaDon);
		
		rd = request.getRequestDispatcher("/views/admin/list_hoadon.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
