package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.StringCommon;
import model.bean.SanPham;

public class SanPhamDAO extends BaseDAO {

	public ArrayList<SanPham> getAllSanPhamMoi() {
		Connection connection = getConnection();
        String sql = "SELECT * FROM SANPHAM ORDER BY id DESC";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<SanPham> listSanPham = new ArrayList<SanPham>();
        SanPham sanPham = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()) {
        		sanPham = new SanPham();
        		
        		sanPham.setId(rs.getString("id"));
        		sanPham.setTenSanPham(rs.getString("TenSanPham"));
        		sanPham.setTacGia(rs.getString("TacGia"));
        		sanPham.setNhaXuatBan(rs.getString("NhaXuatBan"));
        		sanPham.setGia(rs.getDouble("Gia"));
        		sanPham.setKhuyenMai(rs.getDouble("KhuyenMai"));
        		sanPham.setSoLuongCo(rs.getDouble("SoLuongCo"));
        		sanPham.setMoTa(rs.getString("MoTa"));
        		sanPham.setIdTheLoai(rs.getString("IdTheLoai"));
        		sanPham.setGiaString(StringCommon.convertDoubleToStringWithComma(sanPham.getGia()));
        		sanPham.setKhuyenMaiString(StringCommon.convertDoubleToStringWithComma(sanPham.getKhuyenMai()));
        		sanPham.setSoLuongCoString(StringCommon.convertDoubleToStringWithComma(sanPham.getSoLuongCo()));
        		
        		listSanPham.add(sanPham);
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return listSanPham;
	}

	public ArrayList<SanPham> getAllSanPhamBanChay() {
		Connection connection = getConnection();
        String sql = "SELECT * FROM SANPHAM ORDER BY id DESC"; // de tinh sau
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<SanPham> listSanPham = new ArrayList<SanPham>();
        SanPham sanPham = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()) {
        		sanPham = new SanPham();
        		
        		sanPham.setId(rs.getString("id"));
        		sanPham.setTenSanPham(rs.getString("TenSanPham"));
        		sanPham.setTacGia(rs.getString("TacGia"));
        		sanPham.setNhaXuatBan(rs.getString("NhaXuatBan"));
        		sanPham.setGia(rs.getDouble("Gia"));
        		sanPham.setKhuyenMai(rs.getDouble("KhuyenMai"));
        		sanPham.setSoLuongCo(rs.getDouble("SoLuongCo"));
        		sanPham.setMoTa(rs.getString("MoTa"));
        		sanPham.setIdTheLoai(rs.getString("IdTheLoai"));
        		sanPham.setGiaString(StringCommon.convertDoubleToStringWithComma(sanPham.getGia()));
        		sanPham.setKhuyenMaiString(StringCommon.convertDoubleToStringWithComma(sanPham.getKhuyenMai()));
        		sanPham.setSoLuongCoString(StringCommon.convertDoubleToStringWithComma(sanPham.getSoLuongCo()));
        			
        		listSanPham.add(sanPham);
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return listSanPham;
	}

	public ArrayList<SanPham> getAllSanPhamKhuyenMai() {
		Connection connection = getConnection();
        String sql = "SELECT * FROM SANPHAM ORDER BY KhuyenMai DESC";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<SanPham> listSanPham = new ArrayList<SanPham>();
        SanPham sanPham = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()) {
        		sanPham = new SanPham();
        		
        		sanPham.setId(rs.getString("id"));
        		sanPham.setTenSanPham(rs.getString("TenSanPham"));
        		sanPham.setTacGia(rs.getString("TacGia"));
        		sanPham.setNhaXuatBan(rs.getString("NhaXuatBan"));
        		sanPham.setGia(rs.getDouble("Gia"));
        		sanPham.setKhuyenMai(rs.getDouble("KhuyenMai"));
        		sanPham.setSoLuongCo(rs.getDouble("SoLuongCo"));
        		sanPham.setMoTa(rs.getString("MoTa"));
        		sanPham.setIdTheLoai(rs.getString("IdTheLoai"));
        		sanPham.setGiaString(StringCommon.convertDoubleToStringWithComma(sanPham.getGia()));
        		sanPham.setKhuyenMaiString(StringCommon.convertDoubleToStringWithComma(sanPham.getKhuyenMai()));
        		sanPham.setSoLuongCoString(StringCommon.convertDoubleToStringWithComma(sanPham.getSoLuongCo()));
        		
        		listSanPham.add(sanPham);
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return listSanPham;
	}

	public ArrayList<SanPham> getAllSanPhamByLoai(String maLoai) {
		Connection connection = getConnection();
        String sql = "SELECT * FROM SANPHAM WHERE idTheLoai = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<SanPham> listSanPham = new ArrayList<SanPham>();
        SanPham sanPham = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, maLoai);
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()) {
        		sanPham = new SanPham();
        		
        		sanPham.setId(rs.getString("id"));
        		sanPham.setTenSanPham(rs.getString("TenSanPham"));
        		sanPham.setTacGia(rs.getString("TacGia"));
        		sanPham.setNhaXuatBan(rs.getString("NhaXuatBan"));
        		sanPham.setGia(rs.getDouble("Gia"));
        		sanPham.setKhuyenMai(rs.getDouble("KhuyenMai"));
        		sanPham.setSoLuongCo(rs.getDouble("SoLuongCo"));
        		sanPham.setMoTa(rs.getString("MoTa"));
        		sanPham.setIdTheLoai(rs.getString("IdTheLoai"));
        		sanPham.setGiaString(StringCommon.convertDoubleToStringWithComma(sanPham.getGia()));
        		sanPham.setKhuyenMaiString(StringCommon.convertDoubleToStringWithComma(sanPham.getKhuyenMai()));
        		sanPham.setSoLuongCoString(StringCommon.convertDoubleToStringWithComma(sanPham.getSoLuongCo()));
        			
        		listSanPham.add(sanPham);
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return listSanPham;
	}

	public ArrayList<SanPham> getAllSanPhamMoi(String maLoai) {
		Connection connection = getConnection();
        String sql = "SELECT * FROM SANPHAM WHERE IdTheLoai = ? ORDER BY id DESC";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<SanPham> listSanPham = new ArrayList<SanPham>();
        SanPham sanPham = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, maLoai);
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()) {
        		sanPham = new SanPham();
        		
        		sanPham.setId(rs.getString("id"));
        		sanPham.setTenSanPham(rs.getString("TenSanPham"));
        		sanPham.setTacGia(rs.getString("TacGia"));
        		sanPham.setNhaXuatBan(rs.getString("NhaXuatBan"));
        		sanPham.setGia(rs.getDouble("Gia"));
        		sanPham.setKhuyenMai(rs.getDouble("KhuyenMai"));
        		sanPham.setSoLuongCo(rs.getDouble("SoLuongCo"));
        		sanPham.setMoTa(rs.getString("MoTa"));
        		sanPham.setIdTheLoai(rs.getString("IdTheLoai"));
        		sanPham.setGiaString(StringCommon.convertDoubleToStringWithComma(sanPham.getGia()));
        		sanPham.setKhuyenMaiString(StringCommon.convertDoubleToStringWithComma(sanPham.getKhuyenMai()));
        		sanPham.setSoLuongCoString(StringCommon.convertDoubleToStringWithComma(sanPham.getSoLuongCo()));
        			
        		listSanPham.add(sanPham);
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return listSanPham;
	}

	public ArrayList<SanPham> getAllSanPhamBanChay(String maLoai) {
		Connection connection = getConnection();
        String sql = "SELECT * FROM SANPHAM WHERE IdTheLoai = ? ORDER BY id DESC"; // tính sau
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<SanPham> listSanPham = new ArrayList<SanPham>();
        SanPham sanPham = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, maLoai);
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()) {
        		sanPham = new SanPham();
        		
        		sanPham.setId(rs.getString("id"));
        		sanPham.setTenSanPham(rs.getString("TenSanPham"));
        		sanPham.setTacGia(rs.getString("TacGia"));
        		sanPham.setNhaXuatBan(rs.getString("NhaXuatBan"));
        		sanPham.setGia(rs.getDouble("Gia"));
        		sanPham.setKhuyenMai(rs.getDouble("KhuyenMai"));
        		sanPham.setSoLuongCo(rs.getDouble("SoLuongCo"));
        		sanPham.setMoTa(rs.getString("MoTa"));
        		sanPham.setIdTheLoai(rs.getString("IdTheLoai"));
        		sanPham.setGiaString(StringCommon.convertDoubleToStringWithComma(sanPham.getGia()));
        		sanPham.setKhuyenMaiString(StringCommon.convertDoubleToStringWithComma(sanPham.getKhuyenMai()));
        		sanPham.setSoLuongCoString(StringCommon.convertDoubleToStringWithComma(sanPham.getSoLuongCo()));
        			
        		listSanPham.add(sanPham);
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return listSanPham;
	}

	public ArrayList<SanPham> getAllSanPhamKhuyenMai(String maLoai) {
		Connection connection = getConnection();
        String sql = "SELECT * FROM SANPHAM WHERE IdTheLoai = ? ORDER BY KhuyenMai DESC";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<SanPham> listSanPham = new ArrayList<SanPham>();
        SanPham sanPham = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, maLoai);
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()) {
        		sanPham = new SanPham();
        		
        		sanPham.setId(rs.getString("id"));
        		sanPham.setTenSanPham(rs.getString("TenSanPham"));
        		sanPham.setTacGia(rs.getString("TacGia"));
        		sanPham.setNhaXuatBan(rs.getString("NhaXuatBan"));
        		sanPham.setGia(rs.getDouble("Gia"));
        		sanPham.setKhuyenMai(rs.getDouble("KhuyenMai"));
        		sanPham.setSoLuongCo(rs.getDouble("SoLuongCo"));
        		sanPham.setMoTa(rs.getString("MoTa"));
        		sanPham.setIdTheLoai(rs.getString("IdTheLoai"));
        		sanPham.setGiaString(StringCommon.convertDoubleToStringWithComma(sanPham.getGia()));
        		sanPham.setKhuyenMaiString(StringCommon.convertDoubleToStringWithComma(sanPham.getKhuyenMai()));
        		sanPham.setSoLuongCoString(StringCommon.convertDoubleToStringWithComma(sanPham.getSoLuongCo()));
        			
        		listSanPham.add(sanPham);
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return listSanPham;
	}

	public SanPham getSanPhamById(String id) {
		Connection connection = getConnection();
        String sql = "SELECT * FROM SANPHAM WHERE Id = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        SanPham sanPham = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, id);
        	rs = pstmt.executeQuery();
        	
        	if (rs.next()) {
        		sanPham = new SanPham();
        		
        		sanPham.setId(rs.getString("id"));
        		sanPham.setTenSanPham(rs.getString("TenSanPham"));
        		sanPham.setTacGia(rs.getString("TacGia"));
        		sanPham.setNhaXuatBan(rs.getString("NhaXuatBan"));
        		sanPham.setGia(rs.getDouble("Gia"));
        		sanPham.setKhuyenMai(rs.getDouble("KhuyenMai"));
        		sanPham.setSoLuongCo(rs.getDouble("SoLuongCo"));
        		sanPham.setMoTa(rs.getString("MoTa"));
        		sanPham.setIdTheLoai(rs.getString("IdTheLoai"));
        		sanPham.setGiaString(StringCommon.convertDoubleToStringWithComma(sanPham.getGia()));
        		sanPham.setKhuyenMaiString(StringCommon.convertDoubleToStringWithComma(sanPham.getKhuyenMai()));
        		sanPham.setSoLuongCoString(StringCommon.convertDoubleToStringWithComma(sanPham.getSoLuongCo()));
        			
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return sanPham;
	}

}
