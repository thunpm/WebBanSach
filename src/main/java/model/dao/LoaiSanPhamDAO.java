package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.LoaiSanPham;

public class LoaiSanPhamDAO extends BaseDAO {

	public ArrayList<LoaiSanPham> getListLoaiSanPham(String id) {
		Connection connection = getConnection();
        String sql = "SELECT * FROM LOAISANPHAM WHERE IdDanhMuc = ? AND del_flag = 1 ";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<LoaiSanPham> listLoaiSanPham = new ArrayList<LoaiSanPham>();
        LoaiSanPham loaiSanPham = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, id);
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()) {
        		loaiSanPham = new LoaiSanPham();
        		
        		loaiSanPham.setId(rs.getString("Id"));
        		loaiSanPham.setTenLoaiSanPham(rs.getString("TenLoaiSanPham"));
        		loaiSanPham.setIdDanhMuc(rs.getString("IdDanhMuc"));
        			
        		listLoaiSanPham.add(loaiSanPham);
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return listLoaiSanPham;
	}

	public LoaiSanPham getTheLoaiById(String idTheLoai) {
		Connection connection = getConnection();
        String sql = "SELECT LOAISANPHAM.*, TenDanhMuc FROM LOAISANPHAM "
        		+ "INNER JOIN DANHMUCSANPHAM ON LOAISANPHAM.IdDanhMuc = DANHMUCSANPHAM.Id "
        		+ "WHERE LOAISANPHAM.Id = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        LoaiSanPham loaiSanPham = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, idTheLoai);
        	rs = pstmt.executeQuery();
        	
        	if (rs.next()) {
        		loaiSanPham = new LoaiSanPham();
        		
        		loaiSanPham.setId(rs.getString("Id"));
        		loaiSanPham.setTenLoaiSanPham(rs.getString("TenLoaiSanPham"));
        		loaiSanPham.setIdDanhMuc(rs.getString("IdDanhMuc"));

        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return loaiSanPham;
	}

	public int update(String id, String tenTheLoai, String idDanhMuc) {
		Connection connection = getConnection();
        String sql = "UPDATE LOAISANPHAM SET TenLoaiSanPham = ?, IdDanhMuc = ? WHERE Id = ?";
        PreparedStatement pstmt = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, tenTheLoai);
        	pstmt.setString(2, idDanhMuc);
        	pstmt.setString(3, id);
        	pstmt.executeUpdate();

        } catch (SQLException e) {	
        	e.printStackTrace();
        	return 6;
        } finally {
        	closeConnection(connection, pstmt, null);
        }
        return 0;
	}

	public int delete(String idTheLoai) {
		Connection connection = getConnection();
        String sql = "UPDATE LOAISANPHAM SET del_flag = 0 WHERE Id = ?";
        PreparedStatement pstmt = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, idTheLoai);
        	pstmt.executeUpdate();
        	
        	return 0;
        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, null);
        }
        
        return 1;
	}

	public String getLastestMaTL() {
		Connection connection = getConnection();
        String sql = "SELECT TOP 1 Id FROM LOAISANPHAM ORDER BY Id DESC";
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

	public int add(String id, String tenTheLoai, String idDanhMuc) {
		Connection connection = getConnection();
        String sql = "INSERT INTO LOAISANPHAM (Id, TenLoaiSanPham, IdDanhMuc)"
        		+ " VALUES (?, ?, ?)";
        PreparedStatement pstmt = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, id);
        	pstmt.setString(2, tenTheLoai);
        	pstmt.setString(3, idDanhMuc);
        	pstmt.executeUpdate();

        } catch (SQLException e) {	
        	e.printStackTrace();
        	return 6;
        } finally {
        	closeConnection(connection, pstmt, null);
        }
		
		return 0;
	}

	public ArrayList<LoaiSanPham> getAllLoaiSanPham() {
		Connection connection = getConnection();
        String sql = "SELECT * FROM LOAISANPHAM WHERE del_flag = 1 ";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<LoaiSanPham> listLoaiSanPham = new ArrayList<LoaiSanPham>();
        LoaiSanPham loaiSanPham = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()) {
        		loaiSanPham = new LoaiSanPham();
        		
        		loaiSanPham.setId(rs.getString("Id"));
        		loaiSanPham.setTenLoaiSanPham(rs.getString("TenLoaiSanPham"));
        		loaiSanPham.setIdDanhMuc(rs.getString("IdDanhMuc"));
        			
        		listLoaiSanPham.add(loaiSanPham);
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return listLoaiSanPham;
	}

}
