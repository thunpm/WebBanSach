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

public class ShowIndexServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		
		ShowDanhMucBO  showDanhMucBO = new ShowDanhMucBO();
		ShowLoaiSanPhamBO showLoaiSanPhamBO = new ShowLoaiSanPhamBO();
		ShowSanPhamBO showSanPhamBO = new ShowSanPhamBO();
		
		ArrayList<DanhMucSanPham> listDanhMuc = showDanhMucBO.getAllDanhMuc();
		ArrayList<LoaiSanPham> listLoaiSanPham = null;
		ArrayList<SanPham> listSanPhamBanChay = showSanPhamBO.getAllSanPhamBanChay();
		ArrayList<SanPham> listSanPhamMoi = showSanPhamBO.getAllSanPhamMoi();
		ArrayList<SanPham> listSanPhamKhuyenMai = showSanPhamBO.getAllSanPhamKhuyenMai();
		
		for (int i = 0; i < listDanhMuc.size(); i++) {
			listLoaiSanPham = showLoaiSanPhamBO.getListLoaiSanPham(listDanhMuc.get(i).getId());
			listDanhMuc.get(i).setListLoaiSanPham(listLoaiSanPham);
		}
		
		request.setAttribute("listDanhMuc", listDanhMuc);
		request.setAttribute("listSanPhamBanChay", listSanPhamBanChay);
		request.setAttribute("listSanPhamMoi", listSanPhamMoi);
		request.setAttribute("listSanPhamKhuyenMai", listSanPhamKhuyenMai);
		
		rd = request.getRequestDispatcher("views/user/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
