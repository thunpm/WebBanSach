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
			String diaChi) {
		Connection connection = getConnection();
        String sql = "INSERT INTO DIACHI (IdKhachHang, Tinh, Huyen, Xa, DiaChi)"
        		+ " VALUES (?, ?, ?, ?, ?)";
        PreparedStatement pstmt = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, idKhachHang);
        	pstmt.setString(2, tinh);
        	pstmt.setString(3, huyen);
        	pstmt.setString(4, xa);
        	pstmt.setString(5, diaChi);
        	pstmt.executeUpdate();

        } catch (SQLException e) {	
        	e.printStackTrace();
        	return 6;
        } finally {
        	closeConnection(connection, pstmt, null);
        }
		return 0;
	}

	public DiaChi getDiaChi(String idKhachHang) {
		Connection connection = getConnection();
        String sql = "SELECT * FROM DIACHI WHERE IdKhachHang = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        DiaChi diaChi = new DiaChi();;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, idKhachHang);
        	rs = pstmt.executeQuery();
        	
        	if (rs.next()) {    		
        		diaChi.setId(rs.getInt("Id"));
        		diaChi.setIdKhachHang(rs.getString("IdKhachHang"));
        		diaChi.setTinh(rs.getString("Tinh"));
        		diaChi.setHuyen(rs.getString("Huyen"));
        		diaChi.setXa(rs.getString("Xa"));
        		diaChi.setDiaChi(rs.getString("DiaChi"));
        	
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return diaChi;
	}

}
