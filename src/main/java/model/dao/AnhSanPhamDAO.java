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

}
