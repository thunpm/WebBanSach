package model.bo;

import model.dao.LoaiSanPhamDAO;

public class DeleteTheLoaiBO {
	LoaiSanPhamDAO loaiSanPhamDAO = new LoaiSanPhamDAO();
	
	public int delete(String idTheLoai) {
		return loaiSanPhamDAO.delete(idTheLoai);
	}

}
