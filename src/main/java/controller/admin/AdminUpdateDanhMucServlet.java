package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.DanhMucSanPham;
import model.bo.UpdateDanhMucBO;

public class AdminUpdateDanhMucServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		
		if (session.getAttribute("admin") == null) {
			rd = request.getRequestDispatcher("/admin");
			rd.forward(request, response);
		} 
		
		UpdateDanhMucBO updateDanhMucBO = new UpdateDanhMucBO();
		String message = "";
		
		String id = request.getParameter("idDanhMuc");
		String tenDanhMuc = request.getParameter("tenDanhMuc");
		DanhMucSanPham danhMuc = new DanhMucSanPham(id, tenDanhMuc);
		int check = updateDanhMucBO.update(id, tenDanhMuc);
		
		if (check == 0) {
			message = "Đã update danh mục " + id;
			
			rd = request.getRequestDispatcher("/admin/quanLyDanhMuc");
		} else {
			if (check == 1) {
				message = "Vui lòng nhập đầy đủ thông tin!";
			} else {
				message = "Lỗi không xác định!";
			}
			request.setAttribute("danhMuc", danhMuc);
			
			rd = request.getRequestDispatcher("/views/admin/update_danhmuc.jsp");
		}
		
		request.setAttribute("message", message);

		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
