package model.bo;

import java.sql.Date;

import common.DateCommon;
import common.StringCommon;
import common.ValidateCommon;
import model.dao.DanhMucSanPhamDAO;

public class AddDanhMucBO {
	DanhMucSanPhamDAO danhMucSanPhamDAO = new DanhMucSanPhamDAO();
	
	public int add(String tenDanhMuc) {
		if (! ValidateCommon.checkRequiredFileds(tenDanhMuc)) {
			return 1;
		}
		
		String lastestMaKH = danhMucSanPhamDAO.getLastestMaDM();
		String id = "";
		
		if ("".equals(lastestMaKH)) {
			id = "DM01";
		} else {
			int ma = Integer.valueOf(lastestMaKH.substring(2));
			ma++;
			id = "DM" + StringCommon.convertNumberToString(ma, 2);
		}
		
		return danhMucSanPhamDAO.add(id, tenDanhMuc);
	}

}
