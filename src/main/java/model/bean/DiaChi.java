package model.bean;

public class DiaChi {
	private int id;
	private String idKhachHang;
	private String tinh;
	private String huyen;
	private String xa;
	private String diaChi;
	
	public DiaChi(int id, String idKhachHang, String tinh, String huyen, String xa, String diaChi) {
		super();
		this.id = id;
		this.idKhachHang = idKhachHang;
		this.tinh = tinh;
		this.huyen = huyen;
		this.xa = xa;
		this.diaChi = diaChi;
	}

	public DiaChi(String idKhachHang, String tinh, String huyen, String xa, String diaChi) {
		super();
		this.idKhachHang = idKhachHang;
		this.tinh = tinh;
		this.huyen = huyen;
		this.xa = xa;
		this.diaChi = diaChi;
	}

	public DiaChi() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getIdKhachHang() {
		return idKhachHang;
	}

	public void setIdKhachHang(String idKhachHang) {
		this.idKhachHang = idKhachHang;
	}

	public String getTinh() {
		return tinh;
	}

	public void setTinh(String tinh) {
		this.tinh = tinh;
	}

	public String getHuyen() {
		return huyen;
	}

	public void setHuyen(String huyen) {
		this.huyen = huyen;
	}

	public String getXa() {
		return xa;
	}

	public void setXa(String xa) {
		this.xa = xa;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	
}
