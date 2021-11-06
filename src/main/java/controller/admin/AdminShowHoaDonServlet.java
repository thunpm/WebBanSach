package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.HoaDon;
import model.bo.ShowDonHangBO;

public class AdminShowHoaDonServlet extends HttpServlet {

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
		ShowDonHangBO showDonHangBO = new ShowDonHangBO();
		ArrayList<HoaDon> listHoaDon = null;
		String don = request.getParameter("don");
		
		if ("mua".equals(don)) {
			listHoaDon = showDonHangBO.getAllDonMoi();
		} else if ("huy".equals(don)) {
			listHoaDon = showDonHangBO.getAllDonHuy();
		} else {
			listHoaDon = showDonHangBO.getAllHoaDon();
		}
		
		String thuTuSapXep = request.getParameter("thuTuSapXep");
		
		if (thuTuSapXep == null) {
			thuTuSapXep = "az";
		}
		
		listHoaDon = showDonHangBO.sapXep(thuTuSapXep, listHoaDon);
		
		if ("za".equals(thuTuSapXep)) {
			thuTuSapXep = "Cũ nhất";
		} else if ("az".equals(thuTuSapXep)) {
			thuTuSapXep = "Mới nhất";
		}
		
		request.setAttribute("don", don);
		request.setAttribute("thuTuSapXep", thuTuSapXep);
		request.setAttribute("listHoaDon", listHoaDon);
		
		rd = request.getRequestDispatcher("/views/admin/list_hoadon.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
