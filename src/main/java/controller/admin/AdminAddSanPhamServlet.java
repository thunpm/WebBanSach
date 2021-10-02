package controller.admin;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.bean.LoaiSanPham;
import model.bean.SanPham;
import model.bo.AddSanPhamBO;
import model.bo.ShowLoaiSanPhamBO;

@MultipartConfig
public class AdminAddSanPhamServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		
		String filename = "";
		try {
			Part part = request.getPart("hinhAnh");
			String realPath = request.getServletContext().getRealPath("/views/images");
			filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
			
			if (Files.exists(Paths.get(realPath))) {
				if (Files.exists(Paths.get(realPath + "/" + filename))) {
					filename = "1" + filename;
				}
				part.write(realPath + "/" + filename);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String tenSanPham = request.getParameter("tenSanPham");
		String tacGia = request.getParameter("tacGia");
		String hinhAnh = filename;
		String nhaXuatBan = request.getParameter("nhaXuatBan");
		String gia = request.getParameter("gia");
		String khuyenMai = request.getParameter("khuyenMai");
		String soLuongCo = request.getParameter("soLuongCo");
		String moTa = request.getParameter("moTa");
		String idTheLoai = request.getParameter("idTheLoai");
		String message = "";
		
		AddSanPhamBO addSanPhamBO = new AddSanPhamBO();
		
		int check = addSanPhamBO.add(tenSanPham, tacGia, hinhAnh, nhaXuatBan, gia, khuyenMai, soLuongCo, moTa, idTheLoai);
		
		if (check == 0) {
			message = "Đã thêm thành công!";
			
			rd = request.getRequestDispatcher("/admin/quanLySanPham");
		} else {
			if (check == 1) {
				message = "Vui lòng nhập đủ thông tin!";
			}else if (check == 2) {
				message = "Lỗi thêm ảnh!";
			} else if (check == 3) {
				message = "Lỗi định dạng giá tiền, phần trăm khuyến mãi hoặc số lượng!";
			} else if (check == 6) {
				message = "Lỗi không xác định!";
			}
			
			request.setAttribute("tenSanPham", tenSanPham);
			request.setAttribute("tacGia", tacGia);
			request.setAttribute("nhaXuatBan", nhaXuatBan);
			request.setAttribute("gia", gia);
			request.setAttribute("khuyenMai", khuyenMai);
			request.setAttribute("soLuongCo", soLuongCo);
			request.setAttribute("moTa", moTa);
			request.setAttribute("idTheLoai", idTheLoai);
			
			ShowLoaiSanPhamBO showLoaiSanPhamBO = new ShowLoaiSanPhamBO();
			ArrayList<LoaiSanPham> listTheLoai = showLoaiSanPhamBO.getAllLoaiSanPham();
			request.setAttribute("listTheLoai", listTheLoai);
			
			rd = request.getRequestDispatcher("/views/admin/add_sanpham.jsp");
		}
		request.setAttribute("message", message);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
