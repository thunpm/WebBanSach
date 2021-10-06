package model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import model.bean.HoaDon;
import model.bean.LoaiSanPham;

public class HoaDonDAO extends BaseDAO {

	public int insertHoaDon(String id, String idKhachHang, Timestamp thoiGian, String trangThai) {
		Connection connection = getConnection();
        String sql = "INSERT INTO HOADON (Id, IdKhachHang, ThoiGianLap, TrangThai)"
        		+ " VALUES (?, ?, ?, ?)";
        PreparedStatement pstmt = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, id);
        	pstmt.setString(2, idKhachHang);
        	pstmt.setTimestamp(3, thoiGian);
        	pstmt.setString(4, trangThai);
        	pstmt.executeUpdate();

        } catch (SQLException e) {	
        	e.printStackTrace();
        	return 6;
        } finally {
        	closeConnection(connection, pstmt, null);
        }
		return 0;
	}

	public String getLastestMaHD() {
		Connection connection = getConnection();
        String sql = "SELECT TOP 1 Id FROM HOADON ORDER BY Id DESC";
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

	public ArrayList<HoaDon> getHoaDonByIdKhachHang(String idKhachHang) {
		Connection connection = getConnection();
        String sql = "SELECT * FROM HOADON WHERE IdKhachHang = ? AND del_flag = 1";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
       
        ArrayList<HoaDon> listHoaDon = new ArrayList<HoaDon>();
        HoaDon hoaDon = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, idKhachHang);
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()) {
        		hoaDon = new HoaDon();
        		
        		hoaDon.setId(rs.getString("Id"));
        		hoaDon.setIdKhachHang(rs.getString("IdKhachHang"));
        		hoaDon.setThoiGianLap(rs.getTimestamp("ThoiGianLap"));
        		hoaDon.setTrangThai(rs.getString("TrangThai"));
        			
        		listHoaDon.add(hoaDon);
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return listHoaDon;
	}

	public ArrayList<HoaDon> getAllHoaDon() {
		Connection connection = getConnection();
        String sql = "SELECT * FROM HOADON WHERE del_flag = 1";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
       
        ArrayList<HoaDon> listHoaDon = new ArrayList<HoaDon>();
        HoaDon hoaDon = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()) {
        		hoaDon = new HoaDon();
        		
        		hoaDon.setId(rs.getString("Id"));
        		hoaDon.setIdKhachHang(rs.getString("IdKhachHang"));
        		hoaDon.setThoiGianLap(rs.getTimestamp("ThoiGianLap"));
        		hoaDon.setTrangThai(rs.getString("TrangThai"));
        			
        		listHoaDon.add(hoaDon);
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return listHoaDon;
	}

	public int delete(String id) {
		Connection connection = getConnection();
        String sql = "UPDATE HOADON SET del_flag = 0 WHERE Id = ?";
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

	public void huyDonHang(String idDonHang) {
		Connection connection = getConnection();
        String sql = "UPDATE HOADON SET TrangThai = N'Đã hủy' WHERE Id = ?";
        PreparedStatement pstmt = null;
        
        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, idDonHang);
        	pstmt.executeUpdate();
        	
        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, null);
        }
        
	}

}
