package model.bo;

import java.util.ArrayList;

import model.bean.PhanHoi;
import model.dao.PhanHoiDAO;

public class ShowPhanHoiBO {
	PhanHoiDAO phanHoiDAO = new PhanHoiDAO();

	public ArrayList<PhanHoi> getAllPhanHoi() {
		return phanHoiDAO.getAllPhanHoi();
	}
	
	
}
