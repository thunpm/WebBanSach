package model.bo;

import java.util.ArrayList;

import model.bean.MatHang;
import model.dao.ChiTietHoaDonDAO;

public class ShowDetailDonHangBO {
	ChiTietHoaDonDAO chiTietHoaDonDAO = new ChiTietHoaDonDAO();

	public ArrayList<MatHang> getMatHangByIdHoaDon(String idDonHang) {
		return chiTietHoaDonDAO.getMatHangByIdHoaDon(idDonHang);
	}
	
	
}
