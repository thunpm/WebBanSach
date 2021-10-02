package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.DanhMucSanPham;

public class DanhMucSanPhamDAO extends BaseDAO {

	public ArrayList<DanhMucSanPham> getAllDanhMuc() {
		Connection connection = getConnection();
        String sql = "SELECT * FROM DANHMUCSANPHAM WHERE del_flag = 1";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<DanhMucSanPham> listDanhMuc = new ArrayList<DanhMucSanPham>();
        DanhMucSanPham danhMuc = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()) {
        		danhMuc = new DanhMucSanPham();
        		
        		danhMuc.setId(rs.getString("Id"));
        		danhMuc.setTenDanhMuc(rs.getString("TenDanhMuc"));
        		
        		listDanhMuc.add(danhMuc);
        	}
        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return listDanhMuc;
	}

	public DanhMucSanPham getDanhMucById(String idDanhMuc) {
		Connection connection = getConnection();
        String sql = "SELECT * FROM DANHMUCSANPHAM WHERE Id = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        DanhMucSanPham danhMuc = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, idDanhMuc);
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()) {
        		danhMuc = new DanhMucSanPham();
        		
        		danhMuc.setId(rs.getString("Id"));
        		danhMuc.setTenDanhMuc(rs.getString("TenDanhMuc"));
        	}
        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return danhMuc;
	}

	public int update(String id, String tenDanhMuc) {
		Connection connection = getConnection();
        String sql = "UPDATE DANHMUCSANPHAM SET TenDanhMuc = ? WHERE Id = ?";
        PreparedStatement pstmt = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, tenDanhMuc);
        	pstmt.setString(2, id);
        	pstmt.executeUpdate();

        } catch (SQLException e) {	
        	e.printStackTrace();
        	return 6;
        } finally {
        	closeConnection(connection, pstmt, null);
        }
        return 0;
	}

	public int delete(String idDanhMuc) {
		Connection connection = getConnection();
        String sql = "UPDATE DANHMUCSANPHAM SET del_flag = 0 WHERE Id = ?";
        PreparedStatement pstmt = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, idDanhMuc);
        	pstmt.executeUpdate();
        	
        	return 0;
        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, null);
        }
        
        return 1;
	}

	public String getLastestMaDM() {
		Connection connection = getConnection();
        String sql = "SELECT TOP 1 Id FROM DANHMUCSANPHAM ORDER BY Id DESC";
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

	public int add(String id, String tenDanhMuc) {
		Connection connection = getConnection();
        String sql = "INSERT INTO DANHMUCSANPHAM (Id, TenDanhMuc)"
        		+ " VALUES (?, ?)";
        PreparedStatement pstmt = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, id);
        	pstmt.setString(2, tenDanhMuc);
        	pstmt.executeUpdate();

        } catch (SQLException e) {	
        	e.printStackTrace();
        	return 6;
        } finally {
        	closeConnection(connection, pstmt, null);
        }
		
		return 0;
	}

}
