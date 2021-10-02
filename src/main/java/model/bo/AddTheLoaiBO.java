package model.bo;

import common.StringCommon;
import common.ValidateCommon;
import model.dao.LoaiSanPhamDAO;

public class AddTheLoaiBO {
	LoaiSanPhamDAO loaiSanPhamDAO = new LoaiSanPhamDAO();
	
	public int add(String tenTheLoai, String idDanhMuc) {
		if (! ValidateCommon.checkRequiredFileds(tenTheLoai, idDanhMuc)) {
			return 1;
		}
		
		String lastest = loaiSanPhamDAO.getLastestMaTL();
		String id = "";
		
		if ("".equals(lastest)) {
			id = "LSP01";
		} else {
			int ma = Integer.valueOf(lastest.substring(3));
			ma++;
			id = "LSP" + StringCommon.convertNumberToString(ma, 2);
		}
		
		return loaiSanPhamDAO.add(id, tenTheLoai, idDanhMuc);
	}

}
