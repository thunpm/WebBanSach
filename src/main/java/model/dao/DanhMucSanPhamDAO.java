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
        String sql = "SELECT * FROM DANHMUCSANPHAM";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<DanhMucSanPham> listDanhMuc = new ArrayList<DanhMucSanPham>();
        DanhMucSanPham danhMuc = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()) {
        		danhMuc = new DanhMucSanPham();
        		
        		danhMuc.setId(rs.getString("id"));
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

}
