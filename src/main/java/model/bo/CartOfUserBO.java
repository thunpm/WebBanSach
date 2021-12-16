package model.bo;

import model.bean.GioHang;
import model.dao.CartDAO;

// giỏ hàng người dùng
public class CartOfUserBO {
	CartDAO cartDAO = new CartDAO();
	
	public GioHang getCart(String idKhachHang) {
		return cartDAO.getCart(idKhachHang);
	}

	public void updateCart(String idKhachHang, String idHangHoa, int soLuong) {
		cartDAO.updateCart(idKhachHang, idHangHoa, soLuong);
	}

	public void insertCart(String idKhachHang, String idHangHoa) {
		cartDAO.insertCart(idKhachHang, idHangHoa);
	}

	public void remove(String idKhachHang, String idHangHoa) {
		cartDAO.remove(idKhachHang, idHangHoa);
	}

	public void removeAll(String idKhachHang) {
		cartDAO.removeAll(idKhachHang);
	}

}
