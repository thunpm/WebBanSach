package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.GioHang;
import model.bean.MatHang;
import model.bean.SanPham;

public class CartDAO extends BaseDAO {

	public GioHang getCart(String idKhachHang) {
		Connection connection = getConnection();
        String sql = "SELECT IdHangHoa, SoLuong FROM GIOHANG WHERE IdKhachHang = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        GioHang cart = new GioHang();
        MatHang matHang = null;
        ArrayList<MatHang> list = new ArrayList<>();
        SanPham sanPham = null;
        
        SanPhamDAO sanPhamDAO = new SanPhamDAO();

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, idKhachHang);
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()) {
        		sanPham = sanPhamDAO.getSanPhamById(rs.getString("IdHangHoa"));
        		matHang = new MatHang();
        		matHang.setSanPham(sanPham);
        		matHang.setSoLuong(rs.getInt("SoLuong"));
        		
        		list.add(matHang);
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }
        
        cart.setMatHang(list);
        
        return cart;
	}

	public void updateCart(String idKhachHang, String idHangHoa, int soLuong) {
		Connection connection = getConnection();
        String sql = "UPDATE GIOHANG set SoLuong = ? WHERE IdKhachHang = ? and IdHangHoa = ?";
        PreparedStatement pstmt = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setInt(1, soLuong);
        	pstmt.setString(2, idKhachHang);
        	pstmt.setString(3, idHangHoa);
        	pstmt.executeUpdate();
        	
        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, null);
        }
        
	}

	public void insertCart(String idKhachHang, String idHangHoa) {
		Connection connection = getConnection();
        String sql = "INSERT GIOHANG (IdKhachHang, IdHangHoa, SoLuong) VALUES (?, ?, 1)";
        PreparedStatement pstmt = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, idKhachHang);
        	pstmt.setString(2, idHangHoa);
        	pstmt.executeUpdate();
        	
        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, null);
        }
        
	}

	public void remove(String idKhachHang, String idHangHoa) {
		Connection connection = getConnection();
        String sql = "DELETE GIOHANG WHERE IdKhachHang = ? AND IdHangHoa = ?";
        PreparedStatement pstmt = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, idKhachHang);
        	pstmt.setString(2, idHangHoa);
        	pstmt.executeUpdate();
        	
        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, null);
        }
        
	}

	public void removeAll(String idKhachHang) {
		Connection connection = getConnection();
        String sql = "DELETE GIOHANG WHERE IdKhachHang = ?";
        PreparedStatement pstmt = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, idKhachHang);
        	pstmt.executeUpdate();
        	
        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, null);
        }
        
	}

}
