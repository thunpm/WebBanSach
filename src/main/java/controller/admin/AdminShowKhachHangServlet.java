package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.DiaChi;
import model.bean.KhachHang;
import model.bo.ShowDiaChiBO;
import model.bo.ShowKhachHangBO;

public class AdminShowKhachHangServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		
		ShowKhachHangBO showKhachHangBO = new ShowKhachHangBO();
		ShowDiaChiBO showDiaChiBO = new ShowDiaChiBO();
		DiaChi diaChiKH = new DiaChi();
		ArrayList<KhachHang> listKhachHang = new ArrayList<KhachHang>();
		
		listKhachHang = showKhachHangBO.getAllKhachHang();
		for (int i = 0; i < listKhachHang.size(); i++) {
			diaChiKH = new DiaChi();
			
			diaChiKH = showDiaChiBO.getDiaChi(listKhachHang.get(i).getId());
			listKhachHang.get(i).setDiaChi(diaChiKH);
		}
		
		request.setAttribute("listKhachHang", listKhachHang);
		
		rd = request.getRequestDispatcher("/views/admin/list_khach_hang.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
