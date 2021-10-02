package model.bo;

import java.util.ArrayList;

import model.bean.HoaDon;
import model.dao.HoaDonDAO;

public class ShowDonHangBO {
	HoaDonDAO hoaDonDAO = new HoaDonDAO();
	
	public ArrayList<HoaDon> getHoaDonByIdKhachHang(String idKhachHang) {
		return hoaDonDAO.getHoaDonByIdKhachHang(idKhachHang);
	}

	public ArrayList<HoaDon> getAllHoaDon() {
		return hoaDonDAO.getAllHoaDon();
	}

}
