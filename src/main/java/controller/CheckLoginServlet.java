package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.DiaChi;
import model.bean.GioHang;
import model.bean.KhachHang;
import model.bean.MatHang;
import model.bo.CartOfUserBO;
import model.bo.CheckLoginBO;
import model.bo.ShowDiaChiBO;
import model.bo.ShowKhachHangBO;

public class CheckLoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html");
		
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		
		// lấy tên đăng nhập và mật khẩu
		String tenDangNhap = request.getParameter("tendangnhap");
		String matKhau = request.getParameter("matkhau");
		
		String message = "";
		CheckLoginBO checkLoginBO = new CheckLoginBO();
		
		// kiểm tra đăng nhập
		int check = checkLoginBO.checkLogin(tenDangNhap, matKhau);
		
		if (check == 0 || check == 2) {
			if (check == 0) {
				message = "Vui lòng điền đầy đủ thông tin!";
			} else {
				message = "Tên đăng nhập hoặc mật khẩu không đúng!";
			}
			
			request.setAttribute("message", message);
			request.setAttribute("user", new KhachHang(tenDangNhap, matKhau));
			
			rd = request.getRequestDispatcher("views/user/login.jsp");	
		} else if (check == 1) {
			ShowKhachHangBO showKhachHangBO = new ShowKhachHangBO();
			ShowDiaChiBO showDiaChiBO = new ShowDiaChiBO();
			ArrayList<DiaChi> diaChiKH = new ArrayList<>();
			
			// đăng nhập thành công thì lấy toàn bộ thông tin và địa chỉ
			KhachHang khachHang = showKhachHangBO.getAccount(tenDangNhap);
			diaChiKH = showDiaChiBO.getDiaChi(khachHang.getId());
			khachHang.setDiaChi(diaChiKH);
			
			session.setAttribute("user", khachHang);
			
			// update giỏ hàng session vô giỏ hàng của mình nè
			CartOfUserBO cartOfUserBO = new CartOfUserBO();
			GioHang cartUser = (GioHang) cartOfUserBO.getCart(khachHang.getId()); // giỏ hàng trong csdl
			GioHang cartClient = (GioHang) session.getAttribute("cart"); // giỏ hàng trong session
			
			if (cartUser == null) {
				cartUser = new GioHang();
			}
			
			if (cartClient != null && cartClient.getMatHang().size() > 0) {
				boolean daCo = false;
				
				// chạy lần lượt kiểm tra coi sản phẩm trong giỏ hàng session đã có trong giỏ hàng csdl chưa
				for (int i = 0; i < cartClient.getMatHang().size(); i++) {
					for (int j = 0; j < cartUser.getMatHang().size(); j++) {
						// có rồi thì cộng thêm vô
						if (cartClient.getMatHang().get(i).getSanPham().getId().equals(cartUser.getMatHang().get(j).getSanPham().getId())) {
							int soLuong = cartUser.getMatHang().get(j).getSoLuong() + cartClient.getMatHang().get(i).getSoLuong();
							
							if (cartUser.getMatHang().get(j).getSanPham().getSoLuongCo() > soLuong) { 
								cartOfUserBO.updateCart(khachHang.getId(), cartClient.getMatHang().get(i).getSanPham().getId(), soLuong);
								
								cartUser.getMatHang().get(j).setSoLuong(soLuong);
							} else {
								message = "Số lượng sản phẩm " + cartClient.getMatHang().get(i).getSanPham().getTenSanPham() + " không đủ để mua thêm!";
							}
							
							daCo = true;
						}
					}
					
					if (daCo == false) {
						if (cartClient.getMatHang().get(i).getSanPham().getSoLuongCo() > 1) {
							MatHang matHang = new MatHang(cartClient.getMatHang().get(i).getSanPham(), cartClient.getMatHang().get(i).getSoLuong(), cartClient.getMatHang().get(i).getSanPham().getGia(), cartClient.getMatHang().get(i).getSanPham().getKhuyenMai());
							
							cartOfUserBO.insertCart(khachHang.getId(), cartClient.getMatHang().get(i).getSanPham().getId());
							
							cartUser.getMatHang().add(matHang);
						} else {
							message = "Số lượng sản phẩm " + cartClient.getMatHang().get(i).getSanPham().getTenSanPham() + " không đủ để mua thêm!";
						}
					}
				}
			}
			session.setAttribute("cart", cartUser);
			
			rd = request.getRequestDispatcher("showIndex");
		}
		
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
