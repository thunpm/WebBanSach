package model.bean;

import java.sql.Date;

public class HoaDon {
	private String id;
	private String idKhachHang;
	private Date ThoiGianLap;
	private String trangThai;
	
	public HoaDon(String id, String idKhachHang, Date thoiGianLap, String trangThai) {
		super();
		this.id = id;
		this.idKhachHang = idKhachHang;
		ThoiGianLap = thoiGianLap;
		this.trangThai = trangThai;
	}

	public HoaDon(String idKhachHang, Date thoiGianLap, String trangThai) {
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

	public Date getThoiGianLap() {
		return ThoiGianLap;
	}

	public void setThoiGianLap(Date thoiGianLap) {
		ThoiGianLap = thoiGianLap;
	}

	public String getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}

}
