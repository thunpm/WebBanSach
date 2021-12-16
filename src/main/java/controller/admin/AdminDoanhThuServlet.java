package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.ThongKe;
import model.bo.DoanhThuBO;

public class AdminDoanhThuServlet extends HttpServlet {

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
		
		// tính doanh thu trong khoảng thời gian
		String day1 = request.getParameter("ngay1");
		String month1 = request.getParameter("thang1");
		String year1 = request.getParameter("nam1");
		String day2 = request.getParameter("ngay2");
		String month2 = request.getParameter("thang2");
		String year2 = request.getParameter("nam2");
		
		DoanhThuBO doanhThuBO = new DoanhThuBO();
		String message = "";
		int check = doanhThuBO.check(day1, month1, year1, day2, month2, year2);
		
		if (check == 0) {
			ArrayList<ThongKe> listSanPham = doanhThuBO.getSanPhamDaBan(day1, month1, year1, day2, month2, year2);
			
			request.setAttribute("listSanPham", listSanPham);
			rd = request.getRequestDispatcher("/views/admin/doanhthu.jsp");
		} else {
			message = "Ngày tháng đã chọn không hợp lệ!";
			
			request.setAttribute("message", message);
			rd = request.getRequestDispatcher("/views/admin/thongke.jsp");
		}
		request.setAttribute("ngay1", day1);	
		request.setAttribute("thang1", month1);
		request.setAttribute("nam1", year1);
		request.setAttribute("ngay2", day2);
		request.setAttribute("thang2", month2);
		request.setAttribute("nam2", year2);
		
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
