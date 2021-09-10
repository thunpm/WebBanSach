package model.bo;

import java.util.ArrayList;

import model.bean.LoaiSanPham;
import model.dao.LoaiSanPhamDAO;

public class ShowLoaiSanPhamBO {
	LoaiSanPhamDAO loaiSanPhamDAO = new LoaiSanPhamDAO();
	
	public ArrayList<LoaiSanPham> getListLoaiSanPham(String id) {
		return loaiSanPhamDAO.getListLoaiSanPham(id);
	}

}
