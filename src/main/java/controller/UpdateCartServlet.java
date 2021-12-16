package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.GioHang;
import model.bean.KhachHang;
import model.bean.SanPham;
import model.bo.CartOfUserBO;
import model.bo.ShowSanPhamBO;

public class UpdateCartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		
		// chưa có giỏ hàng
		if (session.getAttribute("cart") == null) {
			rd = request.getRequestDispatcher("showIndex");
			rd.forward(request, response);
		}
		
		String id = request.getParameter("id");
		String doi = request.getParameter("doi"); // loại thay đổi: giảm, tăng, nhập trực tiếp
		String soLuong = request.getParameter("soLuong"); // số lượng đã được thay đổi
		GioHang gioHang = (GioHang) session.getAttribute("cart");
		
		for (int i = 0; i < gioHang.getMatHang().size(); i++) {
			String idTemp = gioHang.getMatHang().get(i).getSanPham().getId();
			if (idTemp.equals(id)) {
				if ("xoa".equals(doi)) {
					gioHang.getMatHang().remove(i); // xóa mặt hàng khỏi session cart
					
					// xóa mặt hàng trong giỏ hàng csdl
					if (session.getAttribute("user") != null) {
						KhachHang khachHang = (KhachHang) session.getAttribute("user");
						CartOfUserBO cartOfUserBO = new CartOfUserBO();
						
						cartOfUserBO.remove(khachHang.getId(), id);
					}
					
					break;
				} else {
					ShowSanPhamBO showSanPhamBO = new ShowSanPhamBO();
					SanPham sanPham = showSanPhamBO.getSanPhamById(id);
					int curSoLuong = gioHang.getMatHang().get(i).getSoLuong(), changeSoLuong = 0;
					if ("nhap".equals(doi)) {
						try {
							changeSoLuong = Integer.valueOf(soLuong);
							if (changeSoLuong > 0) { // số lượng nhập vào phải là số dương
								if (sanPham.getSoLuongCo() < changeSoLuong) {
									request.setAttribute("message", "Mặt hàng bạn vừa thay đổi chỉ còn " + sanPham.getSoLuongCo() + " sản phẩm, vui lòng chọn lại!");
								} else if (changeSoLuong > 5) {
									request.setAttribute("message", "Đơn bán lẻ chỉ cho phép mua tối đa 5 sản phẩm/1 mặt hàng!");
								} else {
									gioHang.getMatHang().get(i).setSoLuong(changeSoLuong); // hợp lệ thì đổi trong session
									
									// và đổi trong csdl
									if (session.getAttribute("user") != null) {
										KhachHang khachHang = (KhachHang) session.getAttribute("user");
										CartOfUserBO cartOfUserBO = new CartOfUserBO();
										
										cartOfUserBO.updateCart(khachHang.getId(), id, changeSoLuong);
									}
									
								}
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					} else if ("giam".equals(doi)) {
						if (curSoLuong > 1) {
							gioHang.getMatHang().get(i).setSoLuong(curSoLuong - 1);
							
							if (session.getAttribute("user") != null) {
								KhachHang khachHang = (KhachHang) session.getAttribute("user");
								CartOfUserBO cartOfUserBO = new CartOfUserBO();
								
								cartOfUserBO.updateCart(khachHang.getId(), id, curSoLuong - 1);
							}
						}
					} else if ("tang".equals(doi)) {
						if (sanPham.getSoLuongCo() < curSoLuong + 1) {
							request.setAttribute("message", "Mặt hàng bạn vừa thay đổi chỉ còn " + sanPham.getSoLuongCo() + " sản phẩm, vui lòng chọn lại!");
						} else if (curSoLuong > 4) {
							request.setAttribute("message", "Đơn bán lẻ chỉ cho phép mua tối đa 5 sản phẩm/1 mặt hàng!");
						} else {
							gioHang.getMatHang().get(i).setSoLuong(curSoLuong + 1);
							
							if (session.getAttribute("user") != null) {
								KhachHang khachHang = (KhachHang) session.getAttribute("user");
								CartOfUserBO cartOfUserBO = new CartOfUserBO();
								
								cartOfUserBO.updateCart(khachHang.getId(), id, curSoLuong + 1);
							}
						}
					}
				}
				
				break;
			}
		}
		
		session.setAttribute("cart", gioHang);
		
		rd = request.getRequestDispatcher("showCart");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
