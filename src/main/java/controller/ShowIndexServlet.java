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

public class ShowIndexServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		
		DanhMucBO  danhMucBO = new DanhMucBO();
		ShowLoaiSanPhamBO showLoaiSanPhamBO = new ShowLoaiSanPhamBO();
		ShowSanPhamBO showSanPhamBO = new ShowSanPhamBO();
	
		int tongSoTrang = 0, batDauSP = 0, ketThucSP = 0;
		ArrayList<DanhMucSanPham> listDanhMuc = danhMucBO.getAllDanhMuc();
		ArrayList<LoaiSanPham> listLoaiSanPham = null;
		ArrayList<SanPham> listSanPham = null;
		
		String sapXep = request.getParameter("sanPham");
		String trang = request.getParameter("trangHienTai");
		
		// lấy danh mục
		for (int i = 0; i < listDanhMuc.size(); i++) {
			listLoaiSanPham = showLoaiSanPhamBO.getListLoaiSanPham(listDanhMuc.get(i).getId());
			listDanhMuc.get(i).setListLoaiSanPham(listLoaiSanPham);
		}
		
		// lấy sản phẩm 
		if (sapXep == null || "".equals(sapXep)) {
			sapXep = "sanPhamMoi";
		}
		if ("sanPhamMoi".equals(sapXep)) {
			listSanPham = showSanPhamBO.getAllSanPhamMoi();
		} else if ("sanPhamBanChay".equals(sapXep)) {
			listSanPham = showSanPhamBO.getAllSanPhamBanChay();
		} else if ("sanPhamKhuyenMai".equals(sapXep)) {
			listSanPham = showSanPhamBO.getAllSanPhamKhuyenMai();
		}
		
		// đánh số trang
		if (trang == null || "".equals(trang)) {
			trang = "1";
		}
		int trangHienTai = Integer.valueOf(trang);
		tongSoTrang = (listSanPham.size() + 14)/15;
		int[] listSoTrang = new int[Math.min(tongSoTrang, 3)];
		
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
		batDauSP = (trangHienTai - 1)*15;
		ketThucSP = trangHienTai*15 - 1;
		if (ketThucSP >= listSanPham.size()) {
			ketThucSP = listSanPham.size() - 1;
		}
		
		request.setAttribute("listDanhMuc", listDanhMuc);
		request.setAttribute("listSanPham", listSanPham);
		request.setAttribute("trangHienTai", trangHienTai);
		request.setAttribute("tongSoTrang", tongSoTrang);
		request.setAttribute("batDauSP", batDauSP);
		request.setAttribute("ketThucSP", ketThucSP);
		request.setAttribute("listSoTrang", listSoTrang);
		request.setAttribute("sanPham", sapXep);
		
		rd = request.getRequestDispatcher("views/user/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
