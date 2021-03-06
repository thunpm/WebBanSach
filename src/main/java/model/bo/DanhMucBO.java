package model.bo;

import java.util.ArrayList;

import common.StringCommon;
import common.ValidateCommon;
import model.bean.DanhMucSanPham;
import model.dao.DanhMucSanPhamDAO;

public class DanhMucBO {
	DanhMucSanPhamDAO danhMucSanPhamDAO = new DanhMucSanPhamDAO();
	
	public int delete(String idDanhMuc) {
		return danhMucSanPhamDAO.delete(idDanhMuc);
	}
	
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
	
	public ArrayList<DanhMucSanPham> getAllDanhMuc() {
		return danhMucSanPhamDAO.getAllDanhMuc();
	}

	public DanhMucSanPham getDanhMucById(String idDanhMuc) {
		return danhMucSanPhamDAO.getDanhMucById(idDanhMuc);
	}
	
	public int update(String id, String tenDanhMuc) {
		if (! ValidateCommon.checkRequiredFileds(tenDanhMuc)) {
			return 1;
		} else {
			return danhMucSanPhamDAO.update(id, tenDanhMuc);
		}
	}

}
