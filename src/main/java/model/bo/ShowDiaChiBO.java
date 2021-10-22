package model.bo;

import java.util.ArrayList;

import model.bean.DiaChi;
import model.dao.DiaChiDAO;

public class ShowDiaChiBO {
	DiaChiDAO diaChiDAO = new DiaChiDAO();
	
	public ArrayList<DiaChi> getDiaChi(String idKhachHang) {
		return diaChiDAO.getDiaChi(idKhachHang);
	}

	public DiaChi getDiaChiById(String id) {
		return diaChiDAO.getDiaChiById(id);
	}

}
