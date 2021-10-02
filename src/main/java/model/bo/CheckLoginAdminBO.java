package model.bo;

import common.ValidateCommon;
import model.dao.AdminDAO;

public class CheckLoginAdminBO {
	AdminDAO adminDAO = new AdminDAO();

	public int checkLogin(String tenDangNhap, String matKhau) {
		if (! ValidateCommon.checkRequiredFileds(tenDangNhap, matKhau)) {
			return 1;
		} else {
			return adminDAO.checkLogin(tenDangNhap, matKhau);
		}
	}
	
	
}
