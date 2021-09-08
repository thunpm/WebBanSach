package model.bo;

import model.bean.KhachHang;
import model.dao.KhachHangDAO;

public class ShowKhachHangBO {
	KhachHangDAO khachHangDAO = new KhachHangDAO();
	
	public KhachHang getAccount(String tenDangNhap) {
		return khachHangDAO.getAccount(tenDangNhap);
	}

}
