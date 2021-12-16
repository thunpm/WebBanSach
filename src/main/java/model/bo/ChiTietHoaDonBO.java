package model.bo;

import model.bean.SanPham;
import model.dao.ChiTietHoaDonDAO;

public class ChiTietHoaDonBO {
	ChiTietHoaDonDAO chiTietHoaDonDAO = new ChiTietHoaDonDAO();
	
	public void insertChiTietHoaDon(String idHoaDon, SanPham sanPham, int soLuong, double donGia, double khuyenMai) {
		chiTietHoaDonDAO.insertChiTietHoaDon(idHoaDon, sanPham.getId(), soLuong, donGia, khuyenMai);
	}

}
