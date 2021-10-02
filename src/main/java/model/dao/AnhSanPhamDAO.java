package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.StringCommon;
import model.bean.AnhSanPham;
import model.bean.SanPham;

public class AnhSanPhamDAO extends BaseDAO {

	public AnhSanPham getHinhAnh(String id) {
		Connection connection = getConnection();
        String sql = "SELECT * FROM ANHSANPHAM WHERE IdSanPham = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        AnhSanPham anhSanPham = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, id);
        	rs = pstmt.executeQuery();
        	
        	if (rs.next()) {
        		anhSanPham = new AnhSanPham();
        		
        		anhSanPham.setId(rs.getInt("Id"));
        		anhSanPham.setIdSanPham(rs.getString("IdSanPham"));
        		anhSanPham.setTenHinhAnh(rs.getString("TenHinhAnh"));

        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return anhSanPham;
	}

	public boolean add(String idSP, String hinhAnh) {
		Connection connection = getConnection();
        String sql = "INSERT INTO ANHSANPHAM (IdSanPham, TenHinhAnh)"
        		+ " VALUES (?, ?)";
        PreparedStatement pstmt = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, idSP);
        	pstmt.setString(2, hinhAnh);
        	pstmt.executeUpdate();

        } catch (SQLException e) {	
        	e.printStackTrace();
        	return false;
        } finally {
        	closeConnection(connection, pstmt, null);
        }
		
		return true;
	}

	public boolean update(String id, String hinhAnh) {
		Connection connection = getConnection();
        String sql = "UPDATE ANHSANPHAM SET TenHinhAnh = ?"
        		+ " WHERE IdSanPham = ?";
        PreparedStatement pstmt = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, hinhAnh);
        	pstmt.setString(2, id);
        	pstmt.executeUpdate();

        } catch (SQLException e) {	
        	e.printStackTrace();
        	return false;
        } finally {
        	closeConnection(connection, pstmt, null);
        }
		
		return true;
	}

}
