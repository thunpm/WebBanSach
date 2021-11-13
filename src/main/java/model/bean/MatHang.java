package model.bean;

public class MatHang {
	private SanPham sanPham;
	private int soLuong;
	private double donGia;
	private double khuyenMai;
	
	public MatHang(SanPham sanPham, int soLuong, double donGia, double khuyenMai) {
		super();
		this.sanPham = sanPham;
		this.soLuong = soLuong;
		this.donGia = donGia; 
		this.khuyenMai = khuyenMai;
	}

	public MatHang() {
		super();
	}

	public SanPham getSanPham() {
		return sanPham;
	}

	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public double getDonGia() {
		return donGia;
	}

	public void setDonGia(double donGia) {
		this.donGia = donGia;
	}

	public double getKhuyenMai() {
		return khuyenMai;
	}

	public void setKhuyenMai(double khuyenMai) {
		this.khuyenMai = khuyenMai;
	}
	
}
