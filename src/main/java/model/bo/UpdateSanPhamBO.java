package model.bo;

import common.ValidateCommon;
import model.dao.SanPhamDAO;

public class UpdateSanPhamBO {
	SanPhamDAO sanPhamDAO = new SanPhamDAO();
	
	public int update(String id, String tenSanPham, String tacGia, String hinhAnh, String nhaXuatBan, String gia,
			String khuyenMai, String soLuongCo, String moTa, String idTheLoai) {
		if (! ValidateCommon.checkRequiredFileds(tenSanPham, tacGia, hinhAnh, nhaXuatBan, gia, khuyenMai, soLuongCo, moTa, idTheLoai)) {
			return 1;
		}
		
		double giaD, khuyenMaiD, soLuongCoD;
		try {
			giaD = Double.valueOf(gia);
			khuyenMaiD = Double.valueOf(khuyenMai);
			soLuongCoD = Double.valueOf(soLuongCo);
		} catch (Exception e) {
			e.printStackTrace();
			return 3;
		}
		
		return sanPhamDAO.update(id, tenSanPham, tacGia, nhaXuatBan, giaD, khuyenMaiD, soLuongCoD, moTa, idTheLoai, hinhAnh);
	}

}
