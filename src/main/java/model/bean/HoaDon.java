package model.bean;

import java.sql.Timestamp;

public class HoaDon {
	private String id;
	private String idKhachHang;
	private Timestamp ThoiGianLap;
	private String trangThai;
	
	public HoaDon(String id, String idKhachHang, Timestamp thoiGianLap, String trangThai) {
		super();
		this.id = id;
		this.idKhachHang = idKhachHang;
		ThoiGianLap = thoiGianLap;
		this.trangThai = trangThai;
	}

	public HoaDon(String idKhachHang, Timestamp thoiGianLap, String trangThai) {
		super();
		this.idKhachHang = idKhachHang;
		ThoiGianLap = thoiGianLap;
		this.trangThai = trangThai;
	}

	public HoaDon() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String string) {
		this.id = string;
	}

	public String getIdKhachHang() {
		return idKhachHang;
	}

	public void setIdKhachHang(String idKhachHang) {
		this.idKhachHang = idKhachHang;
	}

	public Timestamp getThoiGianLap() {
		return ThoiGianLap;
	}

	public void setThoiGianLap(Timestamp thoiGianLap) {
		ThoiGianLap = thoiGianLap;
	}

	public String getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}

}
