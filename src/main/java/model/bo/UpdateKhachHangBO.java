package model.bo;

import java.sql.Date;

import common.DateCommon;
import common.ValidateCommon;
import model.dao.KhachHangDAO;

public class UpdateKhachHangBO {
	KhachHangDAO khachHangDAO = new KhachHangDAO();

	public int checkUpdateInformation(String tenDangNhap, String hoTen, String soDienThoai, String email,
			String gioiTinh, String ngaySinh, String thangSinh, String namSinh) {
		
		if (! ValidateCommon.checkRequiredFileds(tenDangNhap, soDienThoai)) {
			return 1;
		}
		if (! soDienThoai.matches("^0[1-9][0-9]{8}$")) {
			return 2;
		}
		
		if (ValidateCommon.checkRequiredFileds(email)) {
			if (! email.matches("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$")) {
				return 3;
			}
		}
		
		Date date = null;
		if (ValidateCommon.checkRequiredFileds(namSinh, thangSinh, ngaySinh)) {
			int ngay = Integer.valueOf(ngaySinh), thang = Integer.valueOf(thangSinh), nam = Integer.valueOf(namSinh);
			
			if (! DateCommon.isValidDate(ngay, thang, nam)) {
				return 4;
			}
			try {
				date = Date.valueOf(namSinh + "-" + thangSinh + "-"  + ngaySinh);
			} catch(Exception e) {
				e.printStackTrace();
				return 4;
			}
		}
		
		return khachHangDAO.updateInformationKhachHang(tenDangNhap, hoTen, soDienThoai, email, gioiTinh, date);
	}

	public int checkUpdateInformation(String tenDangNhap, String matKhauCu, String matKhauMoi, String nhapLaiMatKhau) {
		if (! ValidateCommon.checkRequiredFileds(matKhauCu, matKhauMoi, nhapLaiMatKhau)) {
			return 1;
		}
		if (! matKhauMoi.equals(nhapLaiMatKhau)) {
			return 5;
		}
		
		return khachHangDAO.updatePasswordKhachHang(tenDangNhap, matKhauCu, matKhauMoi);
		
	}
	
}
