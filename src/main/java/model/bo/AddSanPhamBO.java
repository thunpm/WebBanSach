package model.bo;

import common.StringCommon;
import common.ValidateCommon;
import model.dao.AnhSanPhamDAO;
import model.dao.SanPhamDAO;

public class AddSanPhamBO {
	SanPhamDAO sanPhamDAO = new SanPhamDAO();
	
	public int add(String tenSanPham, String tacGia, String hinhAnh, String nhaXuatBan, String gia,
			String khuyenMai, String soLuongCo, String moTa, String idTheLoai) {
		if (! ValidateCommon.checkRequiredFileds(tenSanPham, tacGia, hinhAnh, nhaXuatBan, gia, khuyenMai, soLuongCo, moTa, idTheLoai)) {
			return 1;
		}
		
		String lastestMaSP = sanPhamDAO.getLastestMaSP();
		String id = "";
		
		if ("".equals(lastestMaSP)) {
			id = "SP0001";
		} else {
			int ma = Integer.valueOf(lastestMaSP.substring(4));
			ma++;
			id = "SP" + StringCommon.convertNumberToString(ma, 4);
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
		
		System.out.println(id + " " + hinhAnh);
		return sanPhamDAO.add(id, tenSanPham, tacGia, nhaXuatBan, giaD, khuyenMaiD, soLuongCoD, moTa, idTheLoai, hinhAnh);
	
	}

}
