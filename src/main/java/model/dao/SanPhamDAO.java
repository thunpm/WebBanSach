package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import model.bean.SanPham;

public class SanPhamDAO extends BaseDAO {

	public ArrayList<SanPham> getAllSanPhamMoi() {
		Connection connection = getConnection();
        String sql = "SELECT * FROM SANPHAM WHERE del_flag = 1 ORDER BY Id DESC";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<SanPham> listSanPham = new ArrayList<SanPham>();
        SanPham sanPham = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()) {
        		sanPham = new SanPham();
        		
        		sanPham.setId(rs.getString("Id"));
        		sanPham.setTenSanPham(rs.getString("TenSanPham"));
        		sanPham.setTacGia(rs.getString("TacGia"));
        		sanPham.setNhaXuatBan(rs.getString("NhaXuatBan"));
        		sanPham.setGia(rs.getDouble("Gia"));
        		sanPham.setKhuyenMai(rs.getDouble("KhuyenMai"));
        		sanPham.setSoLuongCo(rs.getDouble("SoLuongCo"));
        		sanPham.setMoTa(rs.getString("MoTa"));
        		sanPham.setIdTheLoai(rs.getString("IdTheLoai"));
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
        String sql = "SELECT * FROM SANPHAM WHERE del_flag = 1 ORDER BY Id DESC";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<SanPham> listSanPham = new ArrayList<SanPham>();
        SanPham sanPham = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()) {
        		sanPham = new SanPham();
        		
        		sanPham.setId(rs.getString("Id"));
        		sanPham.setTenSanPham(rs.getString("TenSanPham"));
        		sanPham.setTacGia(rs.getString("TacGia"));
        		sanPham.setNhaXuatBan(rs.getString("NhaXuatBan"));
        		sanPham.setGia(rs.getDouble("Gia"));
        		sanPham.setKhuyenMai(rs.getDouble("KhuyenMai"));
        		sanPham.setSoLuongCo(rs.getDouble("SoLuongCo"));
        		sanPham.setMoTa(rs.getString("MoTa"));
        		sanPham.setIdTheLoai(rs.getString("IdTheLoai"));
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
        String sql = "SELECT * FROM SANPHAM WHERE del_flag = 1 ORDER BY KhuyenMai DESC";
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
        String sql = "SELECT * FROM SANPHAM WHERE IdTheLoai = ? AND del_flag = 1 ";
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
        		
        		sanPham.setId(rs.getString("Id"));
        		sanPham.setTenSanPham(rs.getString("TenSanPham"));
        		sanPham.setTacGia(rs.getString("TacGia"));
        		sanPham.setNhaXuatBan(rs.getString("NhaXuatBan"));
        		sanPham.setGia(rs.getDouble("Gia"));
        		sanPham.setKhuyenMai(rs.getDouble("KhuyenMai"));
        		sanPham.setSoLuongCo(rs.getDouble("SoLuongCo"));
        		sanPham.setMoTa(rs.getString("MoTa"));
        		sanPham.setIdTheLoai(rs.getString("IdTheLoai"));
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
        String sql = "SELECT * FROM SANPHAM WHERE IdTheLoai = ? AND del_flag = 1 ORDER BY id DESC";
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
        		
        		sanPham.setId(rs.getString("Id"));
        		sanPham.setTenSanPham(rs.getString("TenSanPham"));
        		sanPham.setTacGia(rs.getString("TacGia"));
        		sanPham.setNhaXuatBan(rs.getString("NhaXuatBan"));
        		sanPham.setGia(rs.getDouble("Gia"));
        		sanPham.setKhuyenMai(rs.getDouble("KhuyenMai"));
        		sanPham.setSoLuongCo(rs.getDouble("SoLuongCo"));
        		sanPham.setMoTa(rs.getString("MoTa"));
        		sanPham.setIdTheLoai(rs.getString("IdTheLoai"));
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
        String sql = "SELECT * FROM SANPHAM WHERE IdTheLoai = ? AND del_flag = 1 ORDER BY id DESC"; 
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
        		
        		sanPham.setId(rs.getString("Id"));
        		sanPham.setTenSanPham(rs.getString("TenSanPham"));
        		sanPham.setTacGia(rs.getString("TacGia"));
        		sanPham.setNhaXuatBan(rs.getString("NhaXuatBan"));
        		sanPham.setGia(rs.getDouble("Gia"));
        		sanPham.setKhuyenMai(rs.getDouble("KhuyenMai"));
        		sanPham.setSoLuongCo(rs.getDouble("SoLuongCo"));
        		sanPham.setMoTa(rs.getString("MoTa"));
        		sanPham.setIdTheLoai(rs.getString("IdTheLoai"));
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
        String sql = "SELECT * FROM SANPHAM WHERE IdTheLoai = ? AND del_flag = 1 ORDER BY KhuyenMai DESC";
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
        		
        		sanPham.setId(rs.getString("Id"));
        		sanPham.setTenSanPham(rs.getString("TenSanPham"));
        		sanPham.setTacGia(rs.getString("TacGia"));
        		sanPham.setNhaXuatBan(rs.getString("NhaXuatBan"));
        		sanPham.setGia(rs.getDouble("Gia"));
        		sanPham.setKhuyenMai(rs.getDouble("KhuyenMai"));
        		sanPham.setSoLuongCo(rs.getDouble("SoLuongCo"));
        		sanPham.setMoTa(rs.getString("MoTa"));
        		sanPham.setIdTheLoai(rs.getString("IdTheLoai"));
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
        String sql = "SELECT * FROM SANPHAM WHERE Id = ? AND del_flag = 1";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        SanPham sanPham = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, id);
        	rs = pstmt.executeQuery();
        	
        	if (rs.next()) {
        		sanPham = new SanPham();
        		
        		sanPham.setId(rs.getString("Id"));
        		sanPham.setTenSanPham(rs.getString("TenSanPham"));
        		sanPham.setTacGia(rs.getString("TacGia"));
        		sanPham.setNhaXuatBan(rs.getString("NhaXuatBan"));
        		sanPham.setGia(rs.getDouble("Gia"));
        		sanPham.setKhuyenMai(rs.getDouble("KhuyenMai"));
        		sanPham.setSoLuongCo(rs.getDouble("SoLuongCo"));
        		sanPham.setMoTa(rs.getString("MoTa"));
        		sanPham.setIdTheLoai(rs.getString("IdTheLoai"));
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
        String sql = "UPDATE SANPHAM SET SoLuongCo = ? WHERE Id = ? AND del_flag = 1";
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
        String sql = "SELECT * FROM SANPHAM WHERE (TenSanPham LIKE LOWER(?) OR TacGia LIKE LOWER(?) OR NhaXuatBan LIKE LOWER(?) OR MoTa LIKE LOWER(?)) AND del_flag = 1 ";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<SanPham> listSanPham = new ArrayList<SanPham>();
        SanPham sanPham = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, "%" + searchText + "%");
        	pstmt.setString(2, "%" + searchText + "%");
        	pstmt.setString(3, "%" + searchText + "%");
        	pstmt.setString(4, "%" + searchText + "%");
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()) {
        		sanPham = new SanPham();
        		
        		sanPham.setId(rs.getString("Id"));
        		sanPham.setTenSanPham(rs.getString("TenSanPham"));
        		sanPham.setTacGia(rs.getString("TacGia"));
        		sanPham.setNhaXuatBan(rs.getString("NhaXuatBan"));
        		sanPham.setGia(rs.getDouble("Gia"));
        		sanPham.setKhuyenMai(rs.getDouble("KhuyenMai"));
        		sanPham.setSoLuongCo(rs.getDouble("SoLuongCo"));
        		sanPham.setMoTa(rs.getString("MoTa"));
        		sanPham.setIdTheLoai(rs.getString("IdTheLoai"));
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

	public int delete(String id) {
		Connection connection = getConnection();
        String sql = "UPDATE SANPHAM SET del_flag = 0 WHERE Id = ?";
        PreparedStatement pstmt = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, id);
        	pstmt.executeUpdate();
        	
        	return 0;
        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, null);
        }
        
        return 1;
	}

	public String getLastestMaSP() {
		Connection connection = getConnection();
        String sql = "SELECT TOP 1 Id FROM SANPHAM ORDER BY Id DESC";
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	rs = pstmt.executeQuery();
        	
        	if (rs.next()) {
        		return rs.getString("Id");
        	}

        } catch (SQLException e) {	
        	e.printStackTrace();
        } finally {
        	closeConnection(connection, pstmt, rs);
        }
        
        return "";
	}

	public int add(String idSP, String tenSanPham, String tacGia, String nhaXuatBan, double gia, double khuyenMai,
			double soLuongCo, String moTa, String idTheLoai, String hinhAnh) {
		Connection connection = getConnection();
        String sql = "INSERT INTO SANPHAM (Id, TenSanPham, TacGia, NhaXuatBan, Gia, KhuyenMai, SoLuongCo, MoTa, IdTheLoai)"
        		+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, idSP);
        	pstmt.setString(2, tenSanPham);
        	pstmt.setString(3, tacGia);
        	pstmt.setString(4, nhaXuatBan);
        	pstmt.setDouble(5, gia);
        	pstmt.setDouble(6, khuyenMai);
        	pstmt.setDouble(7, soLuongCo);
        	pstmt.setString(8, moTa);
        	pstmt.setString(9, idTheLoai);
        	
        	pstmt.executeUpdate();
        	
        	AnhSanPhamDAO anhSanPhamDAO = new AnhSanPhamDAO();
        	
        	if (! anhSanPhamDAO.add(idSP, hinhAnh)) {
        		delete(idSP);
        		return 2;
        	} 	
        	
        } catch (SQLException e) {	
        	e.printStackTrace();
        	return 6;
        } finally {
        	closeConnection(connection, pstmt, null);
        }
		
		return 0;
	}

	public int update(String id, String tenSanPham, String tacGia, String nhaXuatBan, double gia, double khuyenMai,
			double soLuongCo, String moTa, String idTheLoai, String hinhAnh) {
		Connection connection = getConnection();
        String sql = "UPDATE SANPHAM SET TenSanPham = ?, TacGia = ?, NhaXuatBan = ?, Gia = ?, "
        		+ "KhuyenMai = ?, SoLuongCo = ?, MoTa = ?, IdTheLoai = ?"
        		+ " WHERE Id = ?";
        PreparedStatement pstmt = null;

        try {
        	pstmt = connection.prepareStatement(sql);
        	pstmt.setString(1, tenSanPham);
        	pstmt.setString(2, tacGia);
        	pstmt.setString(3, nhaXuatBan);
        	pstmt.setDouble(4, gia);
        	pstmt.setDouble(5, khuyenMai);
        	pstmt.setDouble(6, soLuongCo);
        	pstmt.setString(7, moTa);
        	pstmt.setString(8, idTheLoai);
        	pstmt.setString(9, id);
        	
        	AnhSanPhamDAO anhSanPhamDAO = new AnhSanPhamDAO();
        	
        	if (! anhSanPhamDAO.update(id, hinhAnh)) {
        		return 2;
        	}
        	
        	pstmt.executeUpdate();
        	
        } catch (SQLException e) {	
        	e.printStackTrace();
        	return 6;
        } finally {
        	closeConnection(connection, pstmt, null);
        }
		
		return 0;
	}

}
