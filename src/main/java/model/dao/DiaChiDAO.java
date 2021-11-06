package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.StringCommon;
import model.bean.DiaChi;
import model.bean.SanPham;

public class DiaChiDAO extends BaseDAO {

	public int insertDiaChi(String idKhachHang, String tinh, String huyen, String xa,
			String diaChi, int macDinh) {
		Connection connection = getConnection();
        String sql = "INSERT INTO DIACHI (IdKhachHang, Tinh, Huyen, Xa, DiaChi, MacDinh)"
        		+ " VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, idKhachHang);
        	pstmt.setString(2, tinh);
        	pstmt.setString(3, huyen);
        	pstmt.setString(4, xa);
        	pstmt.setString(5, diaChi);
        	pstmt.setInt(6, macDinh);
        	pstmt.executeUpdate();

        } catch (SQLException e) {	
        	e.printStackTrace();
        	return 6;
        } finally {
        	closeConnection(connection, pstmt, null);
        }
		return 0;
	}

	public ArrayList<DiaChi> getDiaChi(String idKhachHang) {
		Connection connection = getConnection();
        String sql = "SELECT * FROM DIACHI WHERE IdKhachHang = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<DiaChi> listDiaChi = new ArrayList<>();
        DiaChi diaChi = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, idKhachHang);
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()) {  
        		diaChi = new DiaChi();
        		
        		diaChi.setId(rs.getInt("Id"));
        		diaChi.setIdKhachHang(rs.getString("IdKhachHang"));
        		diaChi.setTinh(rs.getString("Tinh"));
        		diaChi.setHuyen(rs.getString("Huyen"));
        		diaChi.setXa(rs.getString("Xa"));
        		diaChi.setDiaChi(rs.getString("DiaChi"));
        		diaChi.setMacDinh(rs.getInt("MacDinh"));
        		
        		listDiaChi.add(diaChi);
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return listDiaChi;
	}

	public int updateDiaChi(String idDiaChi, String tinh, String huyen, String xa, String diaChi) {
		Connection connection = getConnection();
	    String sql = "UPDATE DIACHI SET Tinh = ?, Huyen = ?, Xa = ?, DiaChi = ? WHERE Id = ?";
	    PreparedStatement pstmt = null;
	
	    try {
	      	pstmt = connection.prepareStatement(sql);
	      	pstmt.setString(1, tinh);
	      	pstmt.setString(2, huyen);
	      	pstmt.setString(3, xa);
	      	pstmt.setString(4, diaChi);
	      	pstmt.setString(5, idDiaChi);
	      	pstmt.executeUpdate();
	      	
	    } catch (SQLException e) {	
	      	e.printStackTrace();
	      	return 6;
	    } finally {
	      	closeConnection(connection, pstmt, null);
	    }
	      
	    return 0;
	}

	public int deleteDiaChi(String idDiaChi) {
		Connection connection = getConnection();
        String sql = "DELETE FROM DIACHI WHERE Id = ?";
        PreparedStatement pstmt = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, idDiaChi);
        	pstmt.executeUpdate();

        } catch (SQLException e) {	
        	e.printStackTrace();
        	return 6;
        } finally {
        	closeConnection(connection, pstmt, null);
        }
        
        return 0;
	}

	public int updateDiaChi(String idDiaChi, int macDinh) {
		Connection connection = getConnection();
	    String sql = "UPDATE DIACHI SET MacDinh = 0 WHERE MacDinh = 1 AND Id = ?; UPDATE DIACHI SET MacDinh = ? WHERE Id = ?";
	    PreparedStatement pstmt = null;
	
	    try {
	      	pstmt = connection.prepareStatement(sql);
	      	pstmt.setString(1, idDiaChi);
	      	pstmt.setInt(2, macDinh);
	      	pstmt.setString(3, idDiaChi);
	      	pstmt.executeUpdate();
	      	
	    } catch (SQLException e) {	
	      	e.printStackTrace();
	      	return 6;
	    } finally {
	      	closeConnection(connection, pstmt, null);
	    }
	      
	    return 0;
	}

	public DiaChi getDiaChiById(String id) {
		Connection connection = getConnection();
        String sql = "SELECT * FROM DIACHI WHERE Id = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        DiaChi diaChi = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, id);
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()) {  
        		diaChi = new DiaChi();
        		
        		diaChi.setId(rs.getInt("Id"));
        		diaChi.setIdKhachHang(rs.getString("IdKhachHang"));
        		diaChi.setTinh(rs.getString("Tinh"));
        		diaChi.setHuyen(rs.getString("Huyen"));
        		diaChi.setXa(rs.getString("Xa"));
        		diaChi.setDiaChi(rs.getString("DiaChi"));
        		diaChi.setMacDinh(rs.getInt("MacDinh"));
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return diaChi;
	}

}
