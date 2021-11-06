package model.bo;

import common.StringCommon;
import common.ValidateCommon;
import model.dao.PhanHoiDAO;

public class PhanHoiBO {
	PhanHoiDAO phanHoiDAO = new PhanHoiDAO();

	public void addReport(String name, String email, String phone, String report) {
		String lastestMaPH = phanHoiDAO.getLastestMaPH();
		String id = "";
		
		if ("".equals(lastestMaPH)) {
			id = "PH001";
		} else {
			int ma = Integer.valueOf(lastestMaPH.substring(3));
			ma++;
			id = "PH" + StringCommon.convertNumberToString(ma, 3);
		}
		
		phanHoiDAO.addReport(id, name, email, phone, report);
	}
	
	
}
