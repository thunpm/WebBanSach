package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.PhanHoiBO;

public class ContactServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		
		// lấy thông tin phản hồi
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String report = request.getParameter("report");
		
		PhanHoiBO phanHoiBO = new PhanHoiBO();
		phanHoiBO.addReport(name, email, phone, report);
		
		// nếu phản hồi thành công thì trả attribute 'done' để xổ hộp thoại thông báo
		request.setAttribute("done", "done");
		
		rd = request.getRequestDispatcher("views/user/contact.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
