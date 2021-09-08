package model.bean;

import java.sql.Date;

public class KhachHang {
	private int id;
	private String tenDangNhap;
	private String hoTen;
	private String soDienThoai;
	private String matKhau;
	private String email;
	private String gioiTinh;
	private Date ngaySinh;
	
	public KhachHang() {
		super();
	}

	public KhachHang(int id, String tenDangNhap, String hoTen, String soDienThoai, String matKhau, String email, String gioiTinh,
			Date ngaySinh) {
		super();
		this.id = id;
		this.tenDangNhap = tenDangNhap;
		this.hoTen = hoTen;
		this.soDienThoai = soDienThoai;
		this.matKhau = matKhau;
		this.email = email;
		this.gioiTinh = gioiTinh;
		this.ngaySinh = ngaySinh;
	}

	public KhachHang(String tenDangNhap, String hoTen, String soDienThoai, String matKhau, String email, String gioiTinh, Date ngaySinh) {
		super();
		this.tenDangNhap = tenDangNhap;
		this.hoTen = hoTen;
		this.soDienThoai = soDienThoai;
		this.matKhau = matKhau;
		this.email = email;
		this.gioiTinh = gioiTinh;
		this.ngaySinh = ngaySinh;
	}

	public KhachHang(String tenDangNhap, String matKhau) {
		super();
		this.tenDangNhap = tenDangNhap;
		this.matKhau = matKhau;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTenDangNhap() {
		return tenDangNhap;
	}

	public void setTenDangNhap(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public Date getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

}