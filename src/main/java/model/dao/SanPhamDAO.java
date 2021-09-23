package model.dao;

import java.awt.print.Book;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

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
        		ChiTietHoaDonDAO chiTietHoaDonDAO = new ChiTietHoaDonDAO();
        		sanPham.setDaBan(chiTietHoaDonDAO.getSoLuongDaBan(sanPham.getId()));
        		AnhSanPhamDAO anhSanPhamDAO = new AnhSanPhamDAO();
        		sanPham.setAnhSanPham(anhSanPhamDAO.getHinhAnh(sanPham.getId()));
        		
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
        		ChiTietHoaDonDAO chiTietHoaDonDAO = new ChiTietHoaDonDAO();
        		sanPham.setDaBan(chiTietHoaDonDAO.getSoLuongDaBan(sanPham.getId()));
        		AnhSanPhamDAO anhSanPhamDAO = new AnhSanPhamDAO();
        		sanPham.setAnhSanPham(anhSanPhamDAO.getHinhAnh(sanPham.getId()));
        		
        		listSanPham.add(sanPham);
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }
        Collections.sort(listSanPham, new SortDaBan());
        
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
        		ChiTietHoaDonDAO chiTietHoaDonDAO = new ChiTietHoaDonDAO();
        		sanPham.setDaBan(chiTietHoaDonDAO.getSoLuongDaBan(sanPham.getId()));
        		AnhSanPhamDAO anhSanPhamDAO = new AnhSanPhamDAO();
        		sanPham.setAnhSanPham(anhSanPhamDAO.getHinhAnh(sanPham.getId()));
        		
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
        		ChiTietHoaDonDAO chiTietHoaDonDAO = new ChiTietHoaDonDAO();
        		sanPham.setDaBan(chiTietHoaDonDAO.getSoLuongDaBan(sanPham.getId()));
        		AnhSanPhamDAO anhSanPhamDAO = new AnhSanPhamDAO();
        		sanPham.setAnhSanPham(anhSanPhamDAO.getHinhAnh(sanPham.getId()));
        		
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
        		ChiTietHoaDonDAO chiTietHoaDonDAO = new ChiTietHoaDonDAO();
        		sanPham.setDaBan(chiTietHoaDonDAO.getSoLuongDaBan(sanPham.getId()));
        		AnhSanPhamDAO anhSanPhamDAO = new AnhSanPhamDAO();
        		sanPham.setAnhSanPham(anhSanPhamDAO.getHinhAnh(sanPham.getId()));
        		
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
        		ChiTietHoaDonDAO chiTietHoaDonDAO = new ChiTietHoaDonDAO();
        		sanPham.setDaBan(chiTietHoaDonDAO.getSoLuongDaBan(sanPham.getId()));
        		AnhSanPhamDAO anhSanPhamDAO = new AnhSanPhamDAO();
        		sanPham.setAnhSanPham(anhSanPhamDAO.getHinhAnh(sanPham.getId()));
        		
        		listSanPham.add(sanPham);
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }
        Collections.sort(listSanPham, new SortDaBan());

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
        		ChiTietHoaDonDAO chiTietHoaDonDAO = new ChiTietHoaDonDAO();
        		sanPham.setDaBan(chiTietHoaDonDAO.getSoLuongDaBan(sanPham.getId()));
        		AnhSanPhamDAO anhSanPhamDAO = new AnhSanPhamDAO();
        		sanPham.setAnhSanPham(anhSanPhamDAO.getHinhAnh(sanPham.getId()));
        		
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
        		ChiTietHoaDonDAO chiTietHoaDonDAO = new ChiTietHoaDonDAO();
        		sanPham.setDaBan(chiTietHoaDonDAO.getSoLuongDaBan(sanPham.getId()));
        		AnhSanPhamDAO anhSanPhamDAO = new AnhSanPhamDAO();
        		sanPham.setAnhSanPham(anhSanPhamDAO.getHinhAnh(sanPham.getId()));
        		
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return sanPham;
	}

	public void updateSoLuong(String idHangHoa, int soLuong) {
		Connection connection = getConnection();
        String sql = "UPDATE SANPHAM SET SoLuongCo = ? WHERE Id = ?";
        PreparedStatement pstmt = null;
        SanPham sanPham = getSanPhamById(idHangHoa);

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setInt(1, (int) (sanPham.getSoLuongCo() - soLuong));
        	pstmt.setString(2, idHangHoa);
        	pstmt.executeUpdate();

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, null);
        }
	}
	
	public ArrayList<SanPham> getSanPhamBySearch(String searchText) {
		Connection connection = getConnection();
        String sql = "SELECT * FROM SANPHAM WHERE TenSanPham LIKE ? OR TacGia LIKE ? OR NhaXuatBan LIKE ? ";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<SanPham> listSanPham = new ArrayList<SanPham>();
        SanPham sanPham = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, "%" + searchText + "%");
        	pstmt.setString(2, "%" + searchText + "%");
        	pstmt.setString(3, "%" + searchText + "%");
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
        		ChiTietHoaDonDAO chiTietHoaDonDAO = new ChiTietHoaDonDAO();
        		sanPham.setDaBan(chiTietHoaDonDAO.getSoLuongDaBan(sanPham.getId()));
        		AnhSanPhamDAO anhSanPhamDAO = new AnhSanPhamDAO();
        		sanPham.setAnhSanPham(anhSanPhamDAO.getHinhAnh(sanPham.getId()));
        		
        		listSanPham.add(sanPham);
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }

        return listSanPham;
	}
	
	class SortDaBan implements Comparator<SanPham>{

		@Override
		public int compare(SanPham o1, SanPham o2) {
			if (o1.getDaBan() > o2.getDaBan()) {
				return -1;
			} else if (o1.getDaBan() < o2.getDaBan()) {
				return 1;
			}
			return 0;
		}

	}

}
