package model.bo;

import model.dao.DanhMucSanPhamDAO;

public class DeleteDanhMucBO {
	DanhMucSanPhamDAO danhMucSanPhamDAO = new DanhMucSanPhamDAO();
	
	public int delete(String idDanhMuc) {
		return danhMucSanPhamDAO.delete(idDanhMuc);
	}

}
