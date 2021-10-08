package model.bo;

import java.util.ArrayList;

import model.bean.KhachHang;
import model.dao.KhachHangDAO;

public class ShowKhachHangBO {
	KhachHangDAO khachHangDAO = new KhachHangDAO();
	
	public KhachHang getAccount(String tenDangNhap) {
		return khachHangDAO.getAccount(tenDangNhap);
	}

	public ArrayList<KhachHang> getAllKhachHang() {
		return khachHangDAO.getAllKhachHang();
	}

	public KhachHang getAccountById(String idKhachHang) {
		return khachHangDAO.getAccountById(idKhachHang);
	}

}
