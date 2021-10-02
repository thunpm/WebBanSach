package model.bo;

import model.bean.Admin;
import model.dao.AdminDAO;

public class ShowAdminBO {
	AdminDAO adminDAO = new AdminDAO();
	
	public Admin getInfoAdmin(String tenDangNhap) {
		return adminDAO.getInfoAdmin(tenDangNhap);
	}

}
