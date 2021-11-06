package model.bo;

import model.dao.PhanHoiDAO;

public class DeletePhanHoiBO {
	PhanHoiDAO phanHoiDAO = new PhanHoiDAO();
	
	public int delete(String id) {
		return phanHoiDAO.delete(id);
	}

}
