package model.bo;

import java.util.ArrayList;

import model.bean.MatHang;
import model.dao.ChiTietHoaDonDAO;

public class ShowDetailMyDonHangBO {
	ChiTietHoaDonDAO chiTietHoaDonDAO = new ChiTietHoaDonDAO();

	public ArrayList<MatHang> getMatHangByIdHoaDon(String idDonHang) {
		return chiTietHoaDonDAO.getMatHangByIdHoaDon(idDonHang);
	}
	
	
}
