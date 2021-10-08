package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.DanhMucSanPham;
import model.bo.AddDanhMucBO;
import model.bo.AddTheLoaiBO;
import model.bo.ShowDanhMucBO;

public class AdminAddTheLoaiServlet extends HttpServlet {

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
		
		String tenTheLoai = request.getParameter("tenTheLoai");
		String idDanhMuc = request.getParameter("idDanhMuc");
		String message = "";
		AddTheLoaiBO addTheLoaiBO = new AddTheLoaiBO();
		ShowDanhMucBO  showDanhMucBO = new ShowDanhMucBO();
		ArrayList<DanhMucSanPham> listDanhMuc = showDanhMucBO.getAllDanhMuc();
		request.setAttribute("listDanhMuc", listDanhMuc);
		
		int check = addTheLoaiBO.add(tenTheLoai, idDanhMuc);
		
		if (check == 0) {
			message = "Đã thêm thành công!";
			
			rd = request.getRequestDispatcher("/admin/quanLyTheLoai");
		} else {
			if (check == 1) {
				message = "Vui lòng nhập đầy đủ!";
			} else {
				message = "Lỗi không xác định!";
			}
			request.setAttribute("tenTheLoai", tenTheLoai);
			request.setAttribute("idDanhMuc", idDanhMuc);
			rd = request.getRequestDispatcher("/views/admin/add_theloai.jsp");
		}
		request.setAttribute("message", message);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
