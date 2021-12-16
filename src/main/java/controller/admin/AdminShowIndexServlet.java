package controller.admin;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.DoanhThuBO;
import model.bo.ShowDonHangBO;
import model.bo.ShowKhachHangBO;
import model.bo.ShowPhanHoiBO;
import model.bo.ShowSanPhamBO;

public class AdminShowIndexServlet extends HttpServlet {
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
		
		ShowSanPhamBO showSanPhamBO = new ShowSanPhamBO();
		ShowKhachHangBO showKhachHangBO = new ShowKhachHangBO();
		ShowDonHangBO showDonHangBO = new ShowDonHangBO();
		ShowPhanHoiBO showPhanHoiBO = new ShowPhanHoiBO();
		
		int tongSanPham = showSanPhamBO.getAllSanPhamMoi().size();
		int tongKhachHang = showKhachHangBO.getAllKhachHang().size();
		int tongDonHang = showDonHangBO.getAllHoaDon().size();
		int tongPhanHoi = showPhanHoiBO.getAllPhanHoi().size();
		
		request.setAttribute("tongSanPham", tongSanPham);
		request.setAttribute("tongKhachHang", tongKhachHang);
		request.setAttribute("tongDonHang", tongDonHang);
		request.setAttribute("tongPhanHoi", tongPhanHoi);
		
		rd = request.getRequestDispatcher("/views/admin/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
