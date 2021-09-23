package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.SanPham;
import model.bo.ShowDetailSanPhamBO;

public class ShowDetailProductServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		ShowDetailSanPhamBO showDetailSanPhamBO = new ShowDetailSanPhamBO();
		
		String id = request.getParameter("idProduct");
		
		SanPham sanPham = showDetailSanPhamBO.getSanPhamById(id);
		
		request.setAttribute("sanPham", sanPham);
		
		rd = request.getRequestDispatcher("views/user/detail_product.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
