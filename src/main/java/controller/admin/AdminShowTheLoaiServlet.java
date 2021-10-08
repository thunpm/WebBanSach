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
import model.bean.LoaiSanPham;
import model.bo.ShowDanhMucBO;
import model.bo.ShowLoaiSanPhamBO;

public class AdminShowTheLoaiServlet extends HttpServlet {

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
		
		ShowDanhMucBO  showDanhMucBO = new ShowDanhMucBO();
		ArrayList<DanhMucSanPham> listDanhMuc = showDanhMucBO.getAllDanhMuc();
		ShowLoaiSanPhamBO  showTheLoaiBO = new ShowLoaiSanPhamBO();
		ArrayList<LoaiSanPham> listTheLoai;
		
		for (int i = 0; i < listDanhMuc.size(); i++) {
			listTheLoai = showTheLoaiBO.getListLoaiSanPham(listDanhMuc.get(i).getId());
			listDanhMuc.get(i).setListLoaiSanPham(listTheLoai);
		}
		
		request.setAttribute("listDanhMuc", listDanhMuc);
		
		rd = request.getRequestDispatcher("/views/admin/list_theloai.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
