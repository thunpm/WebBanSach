package model.bo;

import model.dao.LoaiSanPhamDAO;

public class UpdateLoaiSanPhamBO {
	LoaiSanPhamDAO loaiSanPhamDAO = new LoaiSanPhamDAO();
	
	public int update(String id, String tenTheLoai, String idDanhMuc) {
		return loaiSanPhamDAO.update(id, tenTheLoai, idDanhMuc);
	}

}
