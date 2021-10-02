package model.bo;

import common.ValidateCommon;
import model.dao.DanhMucSanPhamDAO;

public class UpdateDanhMucBO {
	DanhMucSanPhamDAO danhMucSanPhamDAO = new DanhMucSanPhamDAO();
	
	public int update(String id, String tenDanhMuc) {
		if (! ValidateCommon.checkRequiredFileds(tenDanhMuc)) {
			return 1;
		} else {
			return danhMucSanPhamDAO.update(id, tenDanhMuc);
		}
	}

}
