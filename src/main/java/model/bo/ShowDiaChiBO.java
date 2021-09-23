package model.bo;

import model.bean.DiaChi;
import model.dao.DiaChiDAO;

public class ShowDiaChiBO {
	DiaChiDAO diaChiDAO = new DiaChiDAO();
	
	public DiaChi getDiaChi(String idKhachHang) {
		return diaChiDAO.getDiaChi(idKhachHang);
	}

}
