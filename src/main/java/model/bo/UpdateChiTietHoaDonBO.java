package model.bo;

import model.bean.SanPham;
import model.dao.ChiTietHoaDonDAO;
import model.dao.HoaDonDAO;

public class UpdateChiTietHoaDonBO {
	HoaDonDAO hoaDonDAO = new HoaDonDAO();
	ChiTietHoaDonDAO chiTietHoaDonDAO = new ChiTietHoaDonDAO();
	
	public void insertChiTietHoaDon(SanPham sanPham, int soLuong, double donGia, double khuyenMai) {
		String lastestMaHD = hoaDonDAO.getLastestMaHD();
		chiTietHoaDonDAO.insertChiTietHoaDon(lastestMaHD, sanPham.getId(), soLuong, donGia, khuyenMai);
	}

}
