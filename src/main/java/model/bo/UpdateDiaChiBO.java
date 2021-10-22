package model.bo;

import common.ValidateCommon;
import model.dao.DiaChiDAO;

public class UpdateDiaChiBO {
	DiaChiDAO diaChiDAO = new DiaChiDAO();
	
	public int insertDiaChi(String idKhachHang, String tinh, String huyen,
			String xa, String diaChi, int macDinh) {
		if (! ValidateCommon.checkRequiredFileds(tinh, huyen, xa, diaChi)) {
			return 1;
		} 
		
		return diaChiDAO.insertDiaChi(idKhachHang, tinh, huyen, xa, diaChi, macDinh);
	}

	public int updateDiaChi(String idDiaChi, String tinh, String huyen, String xa, String diaChi) {
		if (! ValidateCommon.checkRequiredFileds(tinh, huyen, xa, diaChi)) {
			return 1;
		} 
		
		return diaChiDAO.updateDiaChi(idDiaChi, tinh, huyen, xa, diaChi);
	}

	public int deleteDiaChi(String idDiaChi) {
		return diaChiDAO.deleteDiaChi(idDiaChi);
	}

	public int updateDiaChi(String idDiaChi, int macDinh) {
		return diaChiDAO.updateDiaChi(idDiaChi, macDinh);
	}

}
