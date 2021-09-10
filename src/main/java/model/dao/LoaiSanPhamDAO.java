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
        String sql = "SELECT * FROM LOAISANPHAM WHERE IdDanhMuc = ?";
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
        		
        		loaiSanPham.setId(rs.getString("id"));
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
