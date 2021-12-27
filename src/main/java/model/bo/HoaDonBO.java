package model.bo;

import java.sql.Timestamp;
import java.util.ArrayList;

import common.StringCommon;
import model.bean.MatHang;
import model.dao.ChiTietHoaDonDAO;
import model.dao.HoaDonDAO;
import model.dao.SanPhamDAO;

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
		// update lại số lượng hàng hóa
		ChiTietHoaDonDAO chiTietHoaDonDAO = new ChiTietHoaDonDAO();
		SanPhamDAO sanPhamDAO = new SanPhamDAO();
		
		ArrayList<MatHang> matHang = chiTietHoaDonDAO.getMatHangByIdHoaDon(idDonHang);
		
		for (int i = 0; i < matHang.size(); i++) {
			sanPhamDAO.updateSoLuong(matHang.get(i).getSanPham().getId(), - matHang.get(i).getSoLuong());
		}
		
		// hủy đơn
		hoaDonDAO.huyDonHang(idDonHang);
	}

	public void updateTrangThai(String id, String trangThai) {
		hoaDonDAO.updateTrangThai(id, trangThai);
	}
	
	public int delete(String id) {
		return hoaDonDAO.delete(id);
	}

}
