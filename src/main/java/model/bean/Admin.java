package model.bean;

public class Admin extends NguoiDung {
	
	public Admin(String id, String tenDangNhap, String matKhau, String hoTen) {
		super();
		this.id = id;
		this.tenDangNhap = tenDangNhap;
		this.matKhau = matKhau;
		this.hoTen = hoTen;
	}

	public Admin(String tenDangNhap, String matKhau) {
		super();
		this.tenDangNhap = tenDangNhap;
		this.matKhau = matKhau;
	}

	public Admin() {
		super();
	}

}
