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
import model.bean.SanPham;
import model.bo.ShowDanhMucBO;
import model.bo.ShowSanPhamBO;

public class AdminShowSanPhamServlet extends HttpServlet {

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
		
		String cotSapXep = request.getParameter("cotSapXep");
		String thuTuSapXep = request.getParameter("thuTuSapXep");
		
		if (cotSapXep == null) {
			cotSapXep = "id";
		}
		
		if (thuTuSapXep == null) {
			thuTuSapXep = "az";
		}
		
		ShowSanPhamBO showSanPhamBO = new ShowSanPhamBO();
		ArrayList<SanPham> listSanPham = showSanPhamBO.getAllSanPhamMoi(cotSapXep, thuTuSapXep);
		String message = request.getParameter("message");
		
		if ("id".equals(cotSapXep)) {
			cotSapXep = "Id";
		} else if ("tenSanPham".equals(cotSapXep)) {
			cotSapXep = "Tên sản phẩm";
		} else if ("gia".equals(cotSapXep)) {
			cotSapXep = "Giá";
		} else if ("khuyenMai".equals(cotSapXep)) {
			cotSapXep = "Khuyến mãi";
		}
		
		if ("az".equals(thuTuSapXep)) {
			thuTuSapXep = "Thấp đến cao";
		} else if ("za".equals(thuTuSapXep)) {
			thuTuSapXep = "Cao đến thấp";
		}

		request.setAttribute("cotSapXep", cotSapXep);
		request.setAttribute("thuTuSapXep", thuTuSapXep);
		request.setAttribute("listSanPham", listSanPham);
		request.setAttribute("message", message);
		
		rd = request.getRequestDispatcher("/views/admin/list_sanpham.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
