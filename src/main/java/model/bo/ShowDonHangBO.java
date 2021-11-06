package model.bo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import model.bean.HoaDon;
import model.bo.ShowSanPhamBO.SortId;
import model.dao.HoaDonDAO;

public class ShowDonHangBO {
	HoaDonDAO hoaDonDAO = new HoaDonDAO();
	
	public ArrayList<HoaDon> getHoaDonByIdKhachHang(String idKhachHang) {
		return hoaDonDAO.getHoaDonByIdKhachHang(idKhachHang);
	}

	public ArrayList<HoaDon> getAllHoaDon() {
		return hoaDonDAO.getAllHoaDon();
	}

	public ArrayList<HoaDon> getAllDonMoi() {
		return hoaDonDAO.getAllDonMoi();
	}

	public ArrayList<HoaDon> getAllDonHuy() {
		return hoaDonDAO.getAllDonHuy();
	}

	public ArrayList<HoaDon> sapXep(String thuTuSapXep, ArrayList<HoaDon> list) {
		Collections.sort(list, new SortNgay());
		if ("za".equals(thuTuSapXep)) {
			Collections.reverse(list);
		}
		
		return list;
	}
	
	class SortNgay implements Comparator<HoaDon>{

		@Override
		public int compare(HoaDon o1, HoaDon o2) {
			if (o1.getThoiGianLap().compareTo(o2.getThoiGianLap()) > 0) {
				return -1;
			} else if (o1.getThoiGianLap().compareTo(o2.getThoiGianLap()) < 0) {
				return 1;
			}
			return 0;
		}

	}

}
