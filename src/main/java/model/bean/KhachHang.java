package model.bean;

import java.sql.Date;
import java.util.ArrayList;

public class KhachHang extends NguoiDung {
	private String soDienThoai;
	private String email;
	private String gioiTinh;
	private Date ngaySinh;
	private ArrayList<DiaChi> diaChi = new ArrayList<>();
	
	public KhachHang() {
		super();
	}

	public KhachHang(String id, String tenDangNhap, String hoTen, String soDienThoai, String matKhau, String email, String gioiTinh,
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

	public KhachHang(String tenDangNhap, String hoTen, String soDienThoai, String matKhau, String email,
			String gioiTinh) {
		super();
		this.tenDangNhap = tenDangNhap;
		this.hoTen = hoTen;
		this.soDienThoai = soDienThoai;
		this.matKhau = matKhau;
		this.email = email;
		this.gioiTinh = gioiTinh;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
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

	public ArrayList<DiaChi> getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(ArrayList<DiaChi> diaChi) {
		this.diaChi = diaChi;
	}

}
