package model.bo;

import common.ValidateCommon;
import model.dao.DiaChiDAO;

public class UpdateDiaChiBO {
	DiaChiDAO diaChiDAO = new DiaChiDAO();
	
	public int insertDiaChi(String idKhachHang, String tinh, String huyen,
			String xa, String diaChi) {
		if (! ValidateCommon.checkRequiredFileds(tinh, huyen, xa, diaChi)) {
			return 1;
		} 
		
		return diaChiDAO.insertDiaChi(idKhachHang, tinh, huyen, xa, diaChi);
	}

}
