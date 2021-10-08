package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.LoaiSanPham;
import model.bo.UpdateLoaiSanPhamBO;

public class AdminUpdateTheLoaiServlet extends HttpServlet {

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
		
		UpdateLoaiSanPhamBO updateLoaiSanPhamBO = new UpdateLoaiSanPhamBO();
		String message = "";
		
		String id = request.getParameter("id");
		String tenTheLoai = request.getParameter("tenTheLoai");
		String idDanhMuc = request.getParameter("idDanhMuc");
		
		LoaiSanPham loaiSanPham = new LoaiSanPham(id, tenTheLoai, idDanhMuc);
		int check = updateLoaiSanPhamBO.update(id, tenTheLoai, idDanhMuc);
		
		if (check == 0) {
			message = "Đã update loại sản phẩm " + id;
			
			rd = request.getRequestDispatcher("/admin/quanLyTheLoai");
		} else {
			if (check == 1) {
				message = "Vui lòng nhập đầy đủ thông tin!";
			} else {
				message = "Lỗi không xác định!";
			}
			request.setAttribute("loaiSanPham", loaiSanPham);
			
			rd = request.getRequestDispatcher("/views/admin/update_theloai.jsp");
		}
		
		request.setAttribute("message", message);

		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
