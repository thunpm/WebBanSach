package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.DanhMucSanPham;
import model.bo.ShowDanhMucBO;

public class AdminSearchDHServlet extends HttpServlet {

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
		ShowDanhMucBO  showDanhMucBO = new ShowDanhMucBO();
		ArrayList<DanhMucSanPham> listTemp = showDanhMucBO.getAllDanhMuc();
		
		ArrayList<DanhMucSanPham> listDanhMuc = new ArrayList<>();
		for (int i = 0; i < listTemp.size(); i++) {
			DanhMucSanPham dm = listTemp.get(i);
			searchText = searchText.toLowerCase();
			if ((dm.getId().toLowerCase().contains(searchText)) 
				|| (dm.getTenDanhMuc().toLowerCase().contains(searchText))) {
				listDanhMuc.add(dm);
			}
			
		}
		
		request.setAttribute("listDanhMuc", listDanhMuc);
		request.setAttribute("searchText", searchText);
		
		rd = request.getRequestDispatcher("/views/admin/list_danh_muc.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
