package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.bean.Admin;

public class AdminDAO extends BaseDAO {

	public int checkLogin(String tenDangNhap, String matKhau) {
		Connection connection = getConnection();
        String sql = "SELECT * FROM ADM WHERE TenDangNhap = ? AND MatKhau = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, tenDangNhap);
        	pstmt.setString(2, matKhau);
        	rs = pstmt.executeQuery();
        	
        	if (rs.next()) {
        		return 0;
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return 2;
	}

	public Admin getInfoAdmin(String tenDangNhap) {
		Connection connection = getConnection();
        String sql = "SELECT * FROM ADM WHERE TenDangNhap = ?";
        PreparedStatement pstmt = null;
        Admin admin = new Admin();
        ResultSet rs = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, tenDangNhap);
        	rs = pstmt.executeQuery();
        	
        	if (rs.next()) {
        		admin.setId(rs.getString("Id"));
        		admin.setTenDangNhap(rs.getString("TenDangNhap"));
        		admin.setMatKhau(rs.getString("MatKhau"));
        		admin.setHoTen(rs.getString("HoTen"));
        		
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return admin;
	}

}
