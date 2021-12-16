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
import model.bo.DanhMucBO;
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
		
		// tìm kiếm trong cơ sở dữ liệu
		ShowSanPhamBO showSanPhamBO = new ShowSanPhamBO();
		ArrayList<SanPham> listSanPham = showSanPhamBO.getSanPhamBySearch(searchText.toLowerCase());
		
		// -------------------Phân trang-----------------------
		int tongSoTrang = 0, batDauSP = 0, ketThucSP = 0;
		int[] listSoTrang;
		
		// set trang hiện tại
		if (trang == null || "".equals(trang)) {
			trang = "1";
		}
		int trangHienTai = Integer.valueOf(trang);
		
		// set list trang
		tongSoTrang = (listSanPham.size() + 9)/10; // 10 sản phẩm 1 trang
		listSoTrang = new int[Math.min(tongSoTrang, 3)]; // hiển thị 3 ô phân trang trên 1 trang -1 2 3-
		
		// - Tổng số trang không lớn hơn 3 thì chắn chắn hiển thị hết ra
		// - Ngược lại
		// + Trang hiện tại là 1 thì hiện 3 trang đầu
		// + Trang hiện tại là cuối phân trang thì hiện 3 trang cuối
		// + Trang hiện tại nằm giữa 1 và cuối thì hiện trang trước, trang hiện tại, trang sau
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
		
		// lấy danh mục phía trên
		DanhMucBO  danhMucBO = new DanhMucBO();
		ShowLoaiSanPhamBO showLoaiSanPhamBO = new ShowLoaiSanPhamBO();
		ArrayList<DanhMucSanPham> listDanhMuc = danhMucBO.getAllDanhMuc();
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
