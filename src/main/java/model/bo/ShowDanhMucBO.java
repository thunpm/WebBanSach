package model.bo;

import java.util.ArrayList;

import model.bean.DanhMucSanPham;
import model.dao.DanhMucSanPhamDAO;

public class ShowDanhMucBO {
	DanhMucSanPhamDAO danhMucSanPhamDAO = new DanhMucSanPhamDAO();

	public ArrayList<DanhMucSanPham> getAllDanhMuc() {
		return danhMucSanPhamDAO.getAllDanhMuc();
	}

	public DanhMucSanPham getDanhMucById(String idDanhMuc) {
		return danhMucSanPhamDAO.getDanhMucById(idDanhMuc);
	}

}
