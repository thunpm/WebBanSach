package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.LoaiSanPham;
import model.bean.SanPham;
import model.bo.ShowLoaiSanPhamBO;
import model.bo.ShowSanPhamBO;

public class AdminShowUpdateSanPhamServlet extends HttpServlet {

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
		
		String id = request.getParameter("idSanPham");
		
		ShowSanPhamBO showSanPhamBO = new ShowSanPhamBO();
		
		SanPham sanPham = showSanPhamBO.getSanPhamById(id);
		
		ShowLoaiSanPhamBO showLoaiSanPhamBO = new ShowLoaiSanPhamBO();
		ArrayList<LoaiSanPham> listTheLoai = showLoaiSanPhamBO.getAllLoaiSanPham();
		request.setAttribute("listTheLoai", listTheLoai);	
		
		request.setAttribute("tenSanPham", sanPham.getTenSanPham());
		request.setAttribute("hinhAnh", sanPham.getAnhSanPham());
		request.setAttribute("tacGia", sanPham.getTacGia());
		request.setAttribute("nhaXuatBan", sanPham.getNhaXuatBan());
		request.setAttribute("gia", sanPham.getGia());
		request.setAttribute("khuyenMai", sanPham.getKhuyenMai());
		request.setAttribute("soLuongCo", sanPham.getSoLuongCo());
		request.setAttribute("moTa", sanPham.getMoTa());
		request.setAttribute("idTheLoai", sanPham.getIdTheLoai());
		
		rd = request.getRequestDispatcher("/views/admin/update_sanpham.jsp");
		rd.forward(request, response);		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
