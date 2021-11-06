package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.TinTuc;

public class TinTucDAO extends BaseDAO {

	public ArrayList<TinTuc> getAllTinTuc() {
		Connection connection = getConnection();
        String sql = "SELECT * FROM TINTUC WHERE del_flag = 1 AND TrangThai = 1 ORDER BY NgayDang DESC";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<TinTuc> listTinTuc = new ArrayList<>();
        TinTuc tinTuc = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()) {
        		tinTuc = new TinTuc();
        		
        		tinTuc.setId(rs.getString("Id"));
        		tinTuc.setTieuDe(rs.getString("TieuDe"));
        		tinTuc.setTomTat(rs.getString("TomTat"));
        		tinTuc.setUrlHinh(rs.getString("UrlHinh"));
        		tinTuc.setNgayDang(rs.getDate("NgayDang"));
        		tinTuc.setIdAdmin(rs.getString("IdAdmin"));
        		tinTuc.setNoiDung(rs.getString("NoiDung"));
        		tinTuc.setTrangThai(rs.getBoolean("TrangThai"));
        		        		
        		listTinTuc.add(tinTuc);
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return listTinTuc;
	}

	public TinTuc getTinTucById(String idTinTuc) {
		Connection connection = getConnection();
        String sql = "SELECT * FROM TINTUC WHERE Id = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        TinTuc tinTuc = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, idTinTuc);
        	rs = pstmt.executeQuery();
        	
        	if (rs.next()) {
        		tinTuc = new TinTuc();
        		
        		tinTuc.setId(rs.getString("Id"));
        		tinTuc.setTieuDe(rs.getString("TieuDe"));
        		tinTuc.setTomTat(rs.getString("TomTat"));
        		tinTuc.setUrlHinh(rs.getString("UrlHinh"));
        		tinTuc.setNgayDang(rs.getDate("NgayDang"));
        		tinTuc.setIdAdmin(rs.getString("IdAdmin"));
        		tinTuc.setNoiDung(rs.getString("NoiDung"));
        		tinTuc.setTrangThai(rs.getBoolean("TrangThai"));
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return tinTuc;
	}

}
