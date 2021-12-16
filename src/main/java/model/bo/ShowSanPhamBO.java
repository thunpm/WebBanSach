package model.bo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import model.bean.SanPham;
import model.dao.SanPhamDAO;

public class ShowSanPhamBO {
	SanPhamDAO sanPhamDAO = new SanPhamDAO();

	public ArrayList<SanPham> getAllSanPhamMoi() {
		
		return sanPhamDAO.getAllSanPhamMoi();
	}

	public ArrayList<SanPham> getAllSanPhamBanChay() {
		
		return sanPhamDAO.getAllSanPhamBanChay();
	}

	public ArrayList<SanPham> getAllSanPhamKhuyenMai() {
		
		return sanPhamDAO.getAllSanPhamKhuyenMai();
	}
	
	public ArrayList<SanPham> getAllSanPhamByLoai(String maLoai) {
		return sanPhamDAO.getAllSanPhamByLoai(maLoai);
	}

	public ArrayList<SanPham> getAllSanPhamMoi(String maLoai) {
		return sanPhamDAO.getAllSanPhamMoi(maLoai);
	}

	public ArrayList<SanPham> getAllSanPhamBanChay(String maLoai) {
		return sanPhamDAO.getAllSanPhamBanChay(maLoai);
	}

	public ArrayList<SanPham> getAllSanPhamKhuyenMai(String maLoai) {
		return sanPhamDAO.getAllSanPhamKhuyenMai(maLoai);
	}

	public SanPham getSanPhamById(String id) {
		return sanPhamDAO.getSanPhamById(id);
	}

	public ArrayList<SanPham> getSanPhamBySearch(String searchText) {
		return sanPhamDAO.getSanPhamBySearch(searchText);
	}

	public ArrayList<SanPham> getAllSanPhamMoi(String cotSapXep, String thuTuSapXep) {
		ArrayList<SanPham> list = sanPhamDAO.getAllSanPhamMoi();
		
		if ("Id".equals(cotSapXep)) {
			Collections.sort(list, new SortId());
			if ("Cao đến thấp".equals(thuTuSapXep)) {
				Collections.reverse(list);
			}
		} else if ("Tên sản phẩm".equals(cotSapXep)) {
			Collections.sort(list, new SortTen());
			if ("Cao đến thấp".equals(thuTuSapXep)) {
				Collections.reverse(list);
			}
		} else if ("Giá".equals(cotSapXep)) {
			Collections.sort(list, new SortGia());
			if ("Cao đến thấp".equals(thuTuSapXep)) {
				Collections.reverse(list);
			}
		} else if ("Khuyến mãi".equals(cotSapXep)) {
			Collections.sort(list, new SortKhuyenMai());
			if ("Cao đến thấp".equals(thuTuSapXep)) {
				Collections.reverse(list);
			}
		}
		
		return list;
	}
	
	class SortId implements Comparator<SanPham>{

		@Override
		public int compare(SanPham o1, SanPham o2) {
			if (o1.getId().compareToIgnoreCase(o2.getId()) < 0) {
				return -1;
			} else if (o1.getId().compareToIgnoreCase(o2.getId()) > 0) {
				return 1;
			}
			return 0;
		}

	}
	
	class SortTen implements Comparator<SanPham>{

		@Override
		public int compare(SanPham o1, SanPham o2) {
			if (o1.getTenSanPham().compareToIgnoreCase(o2.getTenSanPham()) < 0) {
				return -1;
			} else if (o1.getTenSanPham().compareToIgnoreCase(o2.getTenSanPham()) > 0) {
				return 1;
			}
			return 0;
		}

	}
	
	class SortGia implements Comparator<SanPham>{

		@Override
		public int compare(SanPham o1, SanPham o2) {
			if (o1.getGia() < o2.getGia()) {
				return -1;
			} else if (o1.getGia() > o2.getGia()) {
				return 1;
			}
			return 0;
		}

	}
	
	class SortKhuyenMai implements Comparator<SanPham>{

		@Override
		public int compare(SanPham o1, SanPham o2) {
			if (o1.getKhuyenMai() < o2.getKhuyenMai()) {
				return -1;
			} else if (o1.getKhuyenMai() > o2.getKhuyenMai()) {
				return 1;
			}
			return 0;
		}

	}

}
