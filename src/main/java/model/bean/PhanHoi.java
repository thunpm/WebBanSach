package model.bean;

public class PhanHoi {
	private String id;
	private String hoTen;
	private String email;
	private String soDienThoai;
	private String yKien;
	
	public PhanHoi() {
		super();
	}

	public PhanHoi(String id, String hoTen, String email, String soDienThoai, String yKien) {
		super();
		this.id = id;
		this.hoTen = hoTen;
		this.email = email;
		this.soDienThoai = soDienThoai;
		this.yKien = yKien;
	}

	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getHoTen() {
		return hoTen;
	}
	
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getSoDienThoai() {
		return soDienThoai;
	}
	
	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}
	
	public String getyKien() {
		return yKien;
	}
	
	public void setyKien(String yKien) {
		this.yKien = yKien;
	}
	
	
}
