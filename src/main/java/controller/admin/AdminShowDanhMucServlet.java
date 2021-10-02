package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.DanhMucSanPham;
import model.bo.ShowDanhMucBO;

public class AdminShowDanhMucServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		
		ShowDanhMucBO  showDanhMucBO = new ShowDanhMucBO();
		ArrayList<DanhMucSanPham> listDanhMuc = showDanhMucBO.getAllDanhMuc();
		
		request.setAttribute("listDanhMuc", listDanhMuc);
		
		rd = request.getRequestDispatcher("/views/admin/list_danh_muc.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
