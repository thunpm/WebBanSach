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

	public ArrayList<SanPham> getAllSanPhamMoi(String maLoai) {
		return sanPhamDAO.getAllSanPhamMoi(maLoai);
	}

	public ArrayList<SanPham> getAllSanPhamBanChay(String maLoai) {
		return sanPhamDAO.getAllSanPhamBanChay(maLoai);
	}

	public ArrayList<SanPham> getAllSanPhamKhuyenMai(String maLoai) {
		return sanPhamDAO.getAllSanPhamKhuyenMai(maLoai);
	}

	public SanPham getSanPhamById(String id) {
		return sanPhamDAO.getSanPhamById(id);
	}

	public ArrayList<SanPham> getSanPhamBySearch(String searchText) {
		return sanPhamDAO.getSanPhamBySearch(searchText);
	}

}
