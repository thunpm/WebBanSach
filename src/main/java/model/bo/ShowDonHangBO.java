package model.bo;

import java.util.ArrayList;

import model.bean.HoaDon;
import model.dao.HoaDonDAO;

public class ShowMyDonHangBO {
	HoaDonDAO hoaDonDAO = new HoaDonDAO();
	
	public ArrayList<HoaDon> getHoaDonByIdKhachHang(String idKhachHang) {
		return hoaDonDAO.getHoaDonByIdKhachHang(idKhachHang);
	}

}
