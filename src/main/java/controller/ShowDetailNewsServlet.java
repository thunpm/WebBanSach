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
import model.bean.TinTuc;
import model.bo.ShowDanhMucBO;
import model.bo.ShowLoaiSanPhamBO;
import model.bo.ShowSanPhamBO;
import model.bo.ShowTinTucBO;

public class ShowDetailNewsServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		
		ShowTinTucBO showTinTucBO = new ShowTinTucBO();
		
		// lấy tin tức
		String idTinTuc = request.getParameter("idTinTuc");
		TinTuc tinTuc = showTinTucBO.getTinTucById(idTinTuc);
		
		request.setAttribute("tinTuc", tinTuc);
		
		rd = request.getRequestDispatcher("views/user/detail_news.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
