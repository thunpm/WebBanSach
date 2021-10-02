package model.bo;

import model.dao.HoaDonDAO;

public class DeleteDonHangBO {
	HoaDonDAO hoaDonDAO = new HoaDonDAO();
	
	public int delete(String id) {
		return hoaDonDAO.delete(id);
	}

}
