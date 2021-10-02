package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.DanhMucSanPham;
import model.bo.ShowDanhMucBO;

public class AdminShowUpdateDanhMucServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		
		String idDanhMuc = request.getParameter("idDanhMuc");
		
		ShowDanhMucBO showDanhMucBO = new ShowDanhMucBO();
		
		DanhMucSanPham danhMuc = showDanhMucBO.getDanhMucById(idDanhMuc);
		
		request.setAttribute("danhMuc", danhMuc);		
		
		rd = request.getRequestDispatcher("/views/admin/update_danhmuc.jsp");
		rd.forward(request, response);		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
