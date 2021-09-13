package model.bo;

import java.util.ArrayList;

import model.bean.SanPham;
import model.dao.SanPhamDAO;

public class ShowSanPhamBO {
	SanPhamDAO sanPhamDAO = new SanPhamDAO();

	public ArrayList<SanPham> getAllSanPhamMoi() {
		
		return sanPhamDAO.getAllSanPhamMoi();
	}

	public ArrayList<SanPham> getAllSanPhamBanChay() {
		
		return sanPhamDAO.getAllSanPhamBanChay();
	}

	public ArrayList<SanPham> getAllSanPhamKhuyenMai() {
		
		return sanPhamDAO.getAllSanPhamKhuyenMai();
	}
	
	public ArrayList<SanPham> getAllSanPhamByLoai(String maLoai) {
		return sanPhamDAO.getAllSanPhamByLoai(maLoai);
	}

}
