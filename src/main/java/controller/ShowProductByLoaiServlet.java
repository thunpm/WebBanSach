package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.SanPham;
import model.bo.ShowSanPhamBO;

public class ShowProductByLoaiServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		String maLoai = request.getParameter("maLoai");
		String tenLoai = request.getParameter("tenLoai");
		ShowSanPhamBO showSanPhamBO = new ShowSanPhamBO();
		
		ArrayList<SanPham> listSanPham = showSanPhamBO.getAllSanPhamByLoai(maLoai);
		
		request.setAttribute("listSanPham", listSanPham);
		request.setAttribute("tenLoai", tenLoai);
		request.setAttribute("maLoai", maLoai);
		
		rd = request.getRequestDispatcher("views/user/product.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
