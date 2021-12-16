package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.DiaChi;
import model.bean.KhachHang;
import model.bean.MatHang;
import model.bo.ShowDetailDonHangBO;
import model.bo.ShowDiaChiBO;
import model.bo.ShowKhachHangBO;

public class AdminDetailDonHangServlet extends HttpServlet {

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
		
		// trong chi tiết đơn hàng có chi tiết các sản phẩm đã đặt và chi tiết thông tin người dùng
		String idDonHang = request.getParameter("idDonHang");
		String idKhachHang = request.getParameter("idKhachHang");
		
		if (idDonHang != null) {
			ShowDetailDonHangBO showDetailMyDonHangBO = new ShowDetailDonHangBO();
			ArrayList<MatHang> listMatHang = showDetailMyDonHangBO.getMatHangByIdHoaDon(idDonHang);
			
			request.setAttribute("detail", "matHang");
			request.setAttribute("listMatHang", listMatHang);
		} else if (idKhachHang != null) {
			ShowKhachHangBO showKhachHangBO = new ShowKhachHangBO();
			ShowDiaChiBO showDiaChiBO = new ShowDiaChiBO();
			ArrayList<DiaChi> listDiaChi = new ArrayList<>();
			KhachHang khachHang = showKhachHangBO.getAccountById(idKhachHang);
			listDiaChi = showDiaChiBO.getDiaChi(idKhachHang);
			khachHang.setDiaChi(listDiaChi);
			
			request.setAttribute("detail", "khachHang");
			request.setAttribute("khachHang", khachHang);
		}
		request.setAttribute("don", request.getAttribute("don"));
		rd = request.getRequestDispatcher("/views/admin/detail_donhang.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
