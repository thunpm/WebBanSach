package model.bo;

import java.sql.Date;
import java.sql.Timestamp;

import common.StringCommon;
import model.dao.HoaDonDAO;

public class HoaDonBO {
	HoaDonDAO hoaDonDAO = new HoaDonDAO();
	
	public String insertHoaDon(String idKhachHang, Timestamp thoiGian, String trangThai) {
		String lastestMaHD = hoaDonDAO.getLastestMaHD();
		String id = "";
		
		if ("".equals(lastestMaHD)) {
			id = "HD0001";
		} else {
			int ma = Integer.valueOf(lastestMaHD.substring(2));
			ma++;
			id = "HD" + StringCommon.convertNumberToString(ma, 4);
		}
		System.out.println(id + " " +  idKhachHang + " " + thoiGian + " " + trangThai);
		return hoaDonDAO.insertHoaDon(id, idKhachHang, thoiGian, trangThai);
	}

	public void huyDonHang(String idDonHang) {
		hoaDonDAO.huyDonHang(idDonHang);
	}

	public void updateTrangThai(String id, String trangThai) {
		hoaDonDAO.updateTrangThai(id, trangThai);
	}
	
	public int delete(String id) {
		return hoaDonDAO.delete(id);
	}

}
