package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.DanhMucSanPham;
import model.bean.PhanHoi;

public class PhanHoiDAO extends BaseDAO {

	public String getLastestMaPH() {
		Connection connection = getConnection();
        String sql = "SELECT TOP 1 Id FROM PHANHOI ORDER BY Id DESC";
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	rs = pstmt.executeQuery();
        	
        	if (rs.next()) {
        		return rs.getString("Id");
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }
        
        return "";
	}


	public void addReport(String id, String name, String email, String phone, String report) {
		Connection connection = getConnection();
        String sql = "INSERT INTO PHANHOI (Id, HoTen, Email, SoDienThoai, YKien)"
        		+ " VALUES (?, ?, ?, ?, ?)";
        PreparedStatement pstmt = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, id);
        	pstmt.setString(2, name);
        	pstmt.setString(3, email);
        	pstmt.setString(4, phone);
        	pstmt.setString(5, report);
        	
        	pstmt.executeUpdate();

        } catch (SQLException e) {	
        	e.printStackTrace();

        } finally {
        	closeConnection(connection, pstmt, null);
        }

	}


	public ArrayList<PhanHoi> getAllPhanHoi() {
		Connection connection = getConnection();
        String sql = "SELECT * FROM PHANHOI";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<PhanHoi> listPhanHoi = new ArrayList<PhanHoi>();
        PhanHoi phanHoi = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()) {
        		phanHoi = new PhanHoi();
        		
        		phanHoi.setId(rs.getString("Id"));
        		phanHoi.setHoTen(rs.getString("HoTen"));
        		phanHoi.setEmail(rs.getString("Email"));
        		phanHoi.setSoDienThoai(rs.getString("SoDienThoai"));
        		phanHoi.setyKien(rs.getString("YKien"));
        		
        		listPhanHoi.add(phanHoi);
        	}
        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return listPhanHoi;
	}


	public int delete(String id) {
		Connection connection = getConnection();
        String sql = "DELETE PHANHOI WHERE Id = ?";
        PreparedStatement pstmt = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, id);
        	pstmt.executeUpdate();
        	
        	return 0;
        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, null);
        }
        
        return 1;
	}

}
