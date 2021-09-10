package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.bean.KhachHang;

public class KhachHangDAO extends BaseDAO {

	public boolean isValidAccount(String tenDangNhap, String matKhau) {
		Connection connection = getConnection();
        String sql = "SELECT * FROM KHACHHANG WHERE TenDangNhap = ? AND MatKhau = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, tenDangNhap);
        	pstmt.setString(2, matKhau);
        	rs = pstmt.executeQuery();
        	
        	if (rs.next()) {
        		return true;
        	} else {
    			return false;
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return false;
	}
	
	public KhachHang getAccount(String tenDangNhap) {
		Connection connection = getConnection();
        String sql = "SELECT * FROM KHACHHANG WHERE TenDangNhap = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        KhachHang khachHang = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, tenDangNhap);
        	rs = pstmt.executeQuery();
        	
        	if (rs.next()) {
        		khachHang = new KhachHang();
        		
        		khachHang.setId(rs.getString("id"));
        		khachHang.setTenDangNhap(rs.getString("TenDangNhap"));
        		khachHang.setHoTen(rs.getString("HoTen"));
        		khachHang.setSoDienThoai(rs.getString("SoDienThoai"));
        		khachHang.setMatKhau(rs.getString("MatKhau"));
        		khachHang.setEmail(rs.getString("Email"));
        		khachHang.setGioiTinh(rs.getString("GioiTinh"));
        		khachHang.setNgaySinh(rs.getDate("NgaySinh")); 		
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return khachHang;
	}

}
