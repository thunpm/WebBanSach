package model.bo;

import java.sql.Date;

import common.DateCommon;
import common.StringCommon;
import common.ValidateCommon;
import model.dao.KhachHangDAO;

public class CheckRegisterBO {
	KhachHangDAO khachHangDAO = new KhachHangDAO();

	public int checkRegister(String tenDangNhap, String hoTen, String soDienThoai, String email, String gioiTinh,
			String ngaySinh, String thangSinh, String namSinh, String matKhau, String nhapLaiMatKhau) {
		
		if (! ValidateCommon.checkRequiredFileds(tenDangNhap, soDienThoai, matKhau, nhapLaiMatKhau)) {
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
		} else {
			return 4;
		}
		
		if (! matKhau.equals(nhapLaiMatKhau)) {
			return 5;
		}
		
		String lastestMaKH = khachHangDAO.getLastestMaKH();
		String id = "";
		
		if ("".equals(lastestMaKH)) {
			id = "KH0001";
		} else {
			int ma = Integer.valueOf(lastestMaKH.substring(2));
			ma++;
			id = "KH" + StringCommon.convertNumberToString(ma, 4);
		}
		
		return khachHangDAO.insertKhachHang(id, tenDangNhap, hoTen, soDienThoai, matKhau, email, gioiTinh, date);
	}

}
