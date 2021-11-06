package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.DanhMucSanPham;
import model.bean.LoaiSanPham;
import model.bean.SanPham;
import model.bo.ShowDanhMucBO;
import model.bo.ShowLoaiSanPhamBO;
import model.bo.ShowSanPhamBO;

public class SearchSanPhamServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		
		String searchText = request.getParameter("searchText");
		String trang = request.getParameter("trangHienTai");
		
		ShowSanPhamBO showSanPhamBO = new ShowSanPhamBO();
		ArrayList<SanPham> listSanPham = showSanPhamBO.getSanPhamBySearch(searchText.toLowerCase());		
		int tongSoTrang = 0, batDauSP = 0, ketThucSP = 0;
		int[] listSoTrang;
		
		// đánh số trang
		if (trang == null || "".equals(trang)) {
			trang = "1";
		}
		int trangHienTai = Integer.valueOf(trang);
		tongSoTrang = (listSanPham.size() + 9)/10;
		listSoTrang = new int[Math.min(tongSoTrang, 3)];
		
		if (tongSoTrang <= 3) {
			for (int i = 0; i < tongSoTrang; i++) {
				listSoTrang[i] = i + 1;
			}
		} else {
			if (trangHienTai == 1) {
				for (int i = 0; i < 3; i++) {
					listSoTrang[i] = i + 1;
				}
			} else if (trangHienTai == tongSoTrang) {
				for (int i = 0; i < 3; i++) {
					listSoTrang[i] = trangHienTai - 2 + i;
				}
			} else {
				for (int i = 0; i < 3; i++) {
					listSoTrang[i] = (trangHienTai - 1) + i;
				}
			}
		}
		
		// tìm số thứ tự sản phẩm trong trang
		batDauSP = (trangHienTai - 1)*10;
		ketThucSP = trangHienTai*10 - 1;
		if (ketThucSP >= listSanPham.size()) {
			ketThucSP = Math.max(listSanPham.size() - 1, 0);
		}
		
		ShowDanhMucBO  showDanhMucBO = new ShowDanhMucBO();
		ShowLoaiSanPhamBO showLoaiSanPhamBO = new ShowLoaiSanPhamBO();
		ArrayList<DanhMucSanPham> listDanhMuc = showDanhMucBO.getAllDanhMuc();
		ArrayList<LoaiSanPham> listLoaiSanPham = null;
		for (int i = 0; i < listDanhMuc.size(); i++) {
			listLoaiSanPham = showLoaiSanPhamBO.getListLoaiSanPham(listDanhMuc.get(i).getId());
			listDanhMuc.get(i).setListLoaiSanPham(listLoaiSanPham);
		}
		
		request.setAttribute("listDanhMuc", listDanhMuc);

		request.setAttribute("listSanPham", listSanPham);
		request.setAttribute("trangHienTai", trangHienTai);
		request.setAttribute("tongSoTrang", tongSoTrang);
		request.setAttribute("batDauSP", batDauSP);
		request.setAttribute("ketThucSP", ketThucSP);
		request.setAttribute("listSoTrang", listSoTrang);
		request.setAttribute("searchText", searchText);
		
		rd = request.getRequestDispatcher("views/user/product_search.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
