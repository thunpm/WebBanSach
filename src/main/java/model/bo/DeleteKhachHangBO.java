package model.bo;

import model.dao.KhachHangDAO;

public class DeleteKhachHangBO {
	KhachHangDAO khachHangDAO = new KhachHangDAO();

	public int deleteKhachHang(String idKhachHang) {
		return khachHangDAO.deleteKhachHang(idKhachHang);
	}
}
