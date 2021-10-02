package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.DeleteDanhMucBO;
import model.bo.DeleteTheLoaiBO;

public class AdminDeleteTheLoaiServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
	
		DeleteTheLoaiBO deleteTheLoaiBO = new DeleteTheLoaiBO();
		String message = "";
		
		String idTheLoai = request.getParameter("idTheLoai");
		
		int check = deleteTheLoaiBO.delete(idTheLoai);
		
		if (check == 0) {
			message = "Đã xóa thành công!";
			
		} else {
			message = "Lỗi không xác định";
			
		}
		
		request.setAttribute("message", message);
		
		rd = request.getRequestDispatcher("/admin/quanLyTheLoai");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
