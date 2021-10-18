package controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

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

public class AdminSearchKHServlet extends HttpServlet {

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
		
		String searchText = request.getParameter("searchText");
		ShowKhachHangBO showKhachHangBO = new ShowKhachHangBO();
		ShowDiaChiBO showDiaChiBO = new ShowDiaChiBO();
		DiaChi diaChiKH = new DiaChi();
		ArrayList<KhachHang> listTemp = new ArrayList<KhachHang>();
		
		listTemp = showKhachHangBO.getAllKhachHang();
		
		
		for (int i = 0; i < listTemp.size(); i++) {
			diaChiKH = new DiaChi();
			
			diaChiKH = showDiaChiBO.getDiaChi(listTemp.get(i).getId());
			listTemp.get(i).setDiaChi(diaChiKH);
		}
		
		ArrayList<KhachHang> listKhachHang = new ArrayList<KhachHang>();
		for (int i = 0; i < listTemp.size(); i++) {
			KhachHang kh = listTemp.get(i);
			searchText = searchText.toLowerCase();
			if ((kh.getHoTen().toLowerCase().contains(searchText)) 
				|| (kh.getId().toLowerCase().contains(searchText))
				|| (kh.getTenDangNhap().toLowerCase().contains(searchText)) 
				|| (kh.getSoDienThoai().toLowerCase().contains(searchText)) 
				|| (kh.getNgaySinh() != null && kh.getNgaySinh().toString().toLowerCase().contains(searchText))
				|| (kh.getGioiTinh() != null && kh.getGioiTinh().toLowerCase().contains(searchText)) 
				|| (kh.getDiaChi() != null && kh.getDiaChi().getXa() != null && kh.getDiaChi().getXa().toLowerCase().contains(searchText)) 
				|| (kh.getDiaChi() != null && kh.getDiaChi().getHuyen() != null && kh.getDiaChi().getHuyen().toLowerCase().contains(searchText)) 
				|| (kh.getDiaChi() != null && kh.getDiaChi().getTinh() != null && kh.getDiaChi().getTinh().toLowerCase().contains(searchText)) 
				|| (kh.getDiaChi() != null && kh.getDiaChi().getDiaChi() != null && kh.getDiaChi().getDiaChi().toLowerCase().contains(searchText))) {
				listKhachHang.add(kh);
			}
			
		}
		
		request.setAttribute("listKhachHang", listKhachHang);
		request.setAttribute("searchText", searchText);
		
		rd = request.getRequestDispatcher("/views/admin/list_khach_hang.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
