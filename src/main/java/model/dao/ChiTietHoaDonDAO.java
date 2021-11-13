package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.HoaDon;
import model.bean.MatHang;
import model.bean.SanPham;

public class ChiTietHoaDonDAO extends BaseDAO {

	public void insertChiTietHoaDon(String lastestMaHD, String idHangHoa, int soLuong, double donGia, double khuyenMai) {
		Connection connection = getConnection();
        String sql = "INSERT INTO CHITIETHOADON (IdHoaDon, IdHangHoa, SoLuong, DonGia, KhuyenMai)"
        		+ " VALUES (?, ?, ?, ?, ?)";
        PreparedStatement pstmt = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, lastestMaHD);
        	pstmt.setString(2, idHangHoa);
        	pstmt.setInt(3, soLuong);
        	pstmt.setDouble(4, donGia);
        	pstmt.setDouble(5, khuyenMai);
        	
        	SanPhamDAO sanPhamDAO = new SanPhamDAO();
        	sanPhamDAO.updateSoLuong(idHangHoa, soLuong);
        	
        	pstmt.executeUpdate();

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, null);
        }

	}

	public int getSoLuongDaBan(String id) {
		Connection connection = getConnection();
        String sql = "SELECT SUM(SoLuong) as SoLuong from CHITIETHOADON WHERE IdHangHoa = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, id);
        	rs = pstmt.executeQuery();
        	
        	if (rs.next()) {
        		return rs.getInt("SoLuong");
        	}
        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, null);
        }
        
        return 0;
	}

	public ArrayList<MatHang> getMatHangByIdHoaDon(String idDonHang) {
		Connection connection = getConnection();
        String sql = "SELECT SANPHAM.Id, TenSanPham, SoLuong, DonGia, CHITIETHOADON.KhuyenMai, SANPHAM.IdTheLoai FROM CHITIETHOADON"
        		+ " INNER JOIN SANPHAM ON CHITIETHOADON.IdHangHoa = SANPHAM.Id"
        		+ " WHERE IdHoaDon = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
       
        ArrayList<MatHang> listMatHang = new ArrayList<MatHang>();
        MatHang matHang = null;
        SanPham sanPham = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, idDonHang);
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()) {
        		matHang = new MatHang();
        		sanPham = new SanPham();
        		
        		sanPham.setId(rs.getString("Id"));
        		sanPham.setTenSanPham(rs.getString("TenSanPham"));
        		sanPham.setIdTheLoai(rs.getString("IdTheLoai"));
        		matHang.setSanPham(sanPham);
        		matHang.setSoLuong(rs.getInt("SoLuong"));
        		matHang.setDonGia(rs.getDouble("DonGia"));
        		matHang.setKhuyenMai(rs.getDouble("KhuyenMai"));
        			
        		listMatHang.add(matHang);
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }
        for (int i = 0; i < listMatHang.size(); i++) {
        	System.out.println(listMatHang.get(i));
        }
        return listMatHang;
	}

}
