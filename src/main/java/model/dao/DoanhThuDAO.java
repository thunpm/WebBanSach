package model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.MatHang;
import model.bean.SanPham;

public class DoanhThuDAO extends BaseDAO {

	public ArrayList<MatHang> getSanPhamDaBan(Date date1, Date date2) {
		Connection connection = getConnection();
        String sql = "SELECT IdHangHoa, TenSanPham, SUM(SoLuong) AS DaBan, cthd.DonGia, cthd.KhuyenMai FROM CHITIETHOADON cthd "
        		+ "INNER JOIN SANPHAM ON cthd.IdHangHoa = SANPHAM.Id "
        		+ "INNER JOIN HOADON ON HOADON.Id = cthd.IdHoaDon "
        		+ "WHERE convert(date, ThoiGianLap) >= convert(date, ?) AND convert(date, ThoiGianLap) <= convert(date, ?) "
        		+ "GROUP BY IdHangHoa, TenSanPham, cthd.DonGia, cthd.KhuyenMai "
        		+ "ORDER BY SUM(SoLuong) DESC";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MatHang matHang;
        ArrayList<MatHang> listSanPham = new ArrayList<MatHang>();

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setDate(1, date1);
        	pstmt.setDate(2, date2);
        	rs = pstmt.executeQuery();
        	System.out.println(sql);
                	
        	while (rs.next()) {
        		matHang = new MatHang();
        		
        		matHang.setSanPham(new SanPham(rs.getString("IdHangHoa"), rs.getString("TenSanPham")));
        		matHang.setDonGia(rs.getDouble("DonGia"));
        		matHang.setKhuyenMai(rs.getDouble("KhuyenMai"));
        		matHang.setSoLuong(rs.getInt("DaBan"));
        		
        		listSanPham.add(matHang);
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, null);
        }
		return listSanPham;
	}

}
