package model.bo;

import model.dao.KhachHangDAO;

public class CheckLoginBO {
	KhachHangDAO khachHangDAO = new KhachHangDAO();

	public int checkLogin(String tenDangNhap, String matKhau) {
		if ("".equals(tenDangNhap) || "".equals(matKhau)) {
			return 0;
		} else {
			if (khachHangDAO.isValidAccount(tenDangNhap, matKhau)) {
				return 1;
			} else {
				return 2;
			}
		}
	}

}
