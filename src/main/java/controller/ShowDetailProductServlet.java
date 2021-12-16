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
import model.bo.ShowDetailSanPhamBO;
import model.bo.ShowLoaiSanPhamBO;
import model.bo.ShowSanPhamBO;

public class ShowDetailProductServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		ShowDetailSanPhamBO showDetailSanPhamBO = new ShowDetailSanPhamBO();
		ShowSanPhamBO showSanPhamBO = new ShowSanPhamBO();
		
		String id = request.getParameter("idProduct");
		
		// lấy thông tin sản phẩm thông qua id
		SanPham sanPham = showDetailSanPhamBO.getSanPhamById(id);
		ArrayList<SanPham> listSanPham = showSanPhamBO.getAllSanPhamByLoai(sanPham.getIdTheLoai());
		int ketThucSP = Math.min(6, listSanPham.size());
		
		// lấy danh mục
		DanhMucBO  danhMucBO = new DanhMucBO();
		ShowLoaiSanPhamBO showLoaiSanPhamBO = new ShowLoaiSanPhamBO();
		ArrayList<DanhMucSanPham> listDanhMuc = danhMucBO.getAllDanhMuc();
		ArrayList<LoaiSanPham> listLoaiSanPham = null;
		for (int i = 0; i < listDanhMuc.size(); i++) {
			listLoaiSanPham = showLoaiSanPhamBO.getListLoaiSanPham(listDanhMuc.get(i).getId());
			listDanhMuc.get(i).setListLoaiSanPham(listLoaiSanPham);
		}
		
		request.setAttribute("sanPham", sanPham);
		request.setAttribute("listSanPham", listSanPham);
		request.setAttribute("ketThucSP", ketThucSP);
		request.setAttribute("listDanhMuc", listDanhMuc);
		
		rd = request.getRequestDispatcher("views/user/detail_product.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
