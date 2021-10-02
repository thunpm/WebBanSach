package model.bo;

import model.dao.SanPhamDAO;

public class DeleteSanPhamBO {
	SanPhamDAO sanPhamDAO = new SanPhamDAO();
	
	public int delete(String id) {
		return sanPhamDAO.delete(id);
	}

}
