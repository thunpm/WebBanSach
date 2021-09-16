package model.bo;

import model.bean.SanPham;
import model.dao.SanPhamDAO;

public class ShowDetailSanPhamBO {
	SanPhamDAO sanPhamDAO = new SanPhamDAO();
	
	public SanPham getSanPhamById(String id) {
		return sanPhamDAO.getSanPhamById(id);
	}

}
