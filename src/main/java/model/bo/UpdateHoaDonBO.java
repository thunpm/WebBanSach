package model.bo;

import java.sql.Date;

import common.StringCommon;
import model.dao.HoaDonDAO;

public class UpdateHoaDonBO {
	HoaDonDAO hoaDonDAO = new HoaDonDAO();
	
	public int insertHoaDon(String idKhachHang, Date thoiGianLap, String trangThai) {
		String lastestMaHD = hoaDonDAO.getLastestMaHD();
		String id = "";
		
		if ("".equals(lastestMaHD)) {
			id = "HD0001";
		} else {
			int ma = Integer.valueOf(lastestMaHD.substring(2));
			ma++;
			id = "HD" + StringCommon.convertNumberToString(ma, 4);
		}
		System.out.println(id + " " +  idKhachHang + " " + thoiGianLap + " " + trangThai);
		return hoaDonDAO.insertHoaDon(id, idKhachHang, thoiGianLap, trangThai);
	}

}
