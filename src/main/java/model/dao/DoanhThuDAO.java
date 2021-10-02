package model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.ThongKe;

public class DoanhThuDAO extends BaseDAO {

	public ArrayList<ThongKe> getSanPhamDaBan(Date date1, Date date2) {
		Connection connection = getConnection();
        String sql = "SELECT IdHangHoa, TenSanPham, Gia, KhuyenMai, SUM(SoLuong) AS DaBan FROM CHITIETHOADON "
        		+ "INNER JOIN SANPHAM ON CHITIETHOADON.IdHangHoa = SANPHAM.Id "
        		+ "INNER JOIN HOADON ON HOADON.Id = CHITIETHOADON.IdHoaDon "
        		+ "WHERE ThoiGianLap BETWEEN ? AND ? "
        		+ "GROUP BY IdHangHoa, TenSanPham, Gia, KhuyenMai "
        		+ "ORDER BY SUM(SoLuong) DESC";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ThongKe thongKe;
        ArrayList<ThongKe> listSanPham = new ArrayList<ThongKe>();

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setDate(1, date1);
        	pstmt.setDate(2, date2);
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()) {
        		thongKe = new ThongKe();
        		
        		thongKe.setIdHangHoa(rs.getString("IdHangHoa"));
        		thongKe.setTenSanPham(rs.getString("TenSanPham"));
        		thongKe.setGia(rs.getDouble("Gia"));
        		thongKe.setKhuyenMai(rs.getDouble("KhuyenMai"));
        		thongKe.setDaBan(rs.getInt("DaBan"));
        		
        		System.out.println(thongKe);
        		
        		listSanPham.add(thongKe);
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, null);
        }
		return listSanPham;
	}

}
