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

public class AdminShowKhachHangServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");

		RequestDispatcher rd = null;
		HttpSession session = request.getSession();

		if (session.getAttribute("admin") == null) {
			rd = request.getRequestDispatcher("/admin");
			rd.forward(request, response);
		}

		String sapXep = request.getParameter("sapXep");
		ShowKhachHangBO showKhachHangBO = new ShowKhachHangBO();
		ShowDiaChiBO showDiaChiBO = new ShowDiaChiBO();
		ArrayList<DiaChi> listDiaChi = new ArrayList<>();
		ArrayList<KhachHang> listKhachHang = new ArrayList<KhachHang>();

		listKhachHang = showKhachHangBO.getAllKhachHang();

		for (int i = 0; i < listKhachHang.size(); i++) {
			listDiaChi = showDiaChiBO.getDiaChi(listKhachHang.get(i).getId());
			listKhachHang.get(i).setDiaChi(listDiaChi);
		}

		request.setAttribute("listKhachHang", listKhachHang);
		request.setAttribute("sapXep", sapXep);

		rd = request.getRequestDispatcher("/views/admin/list_khach_hang.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

//	public class SortMoiNhat implements Comparator<KhachHang>{
//
//		@Override
//		public int compare(KhachHang arg0, KhachHang arg1) {
//			if (arg0.getId().compareTo(arg1.getId()) < 0) {
//				return -1;
//			} else if (arg0.getId().compareTo(arg1.getId()) < 0) {
//				return 1;
//			}
//			return 0;
//		}
//	}

}
