package model.bean;

public class AnhSanPham {
	private int id;
	private String idSanPham;
	private String tenHinhAnh;
	
	public AnhSanPham(int id, String idSanPham, String tenHinhAnh) {
		super();
		this.id = id;
		this.idSanPham = idSanPham;
		this.tenHinhAnh = tenHinhAnh;
	}

	public AnhSanPham() {
		super();
	}

	public AnhSanPham(String idSanPham, String tenHinhAnh) {
		super();
		this.idSanPham = idSanPham;
		this.tenHinhAnh = tenHinhAnh;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getIdSanPham() {
		return idSanPham;
	}

	public void setIdSanPham(String idSanPham) {
		this.idSanPham = idSanPham;
	}

	public String getTenHinhAnh() {
		return tenHinhAnh;
	}

	public void setTenHinhAnh(String tenHinhAnh) {
		this.tenHinhAnh = tenHinhAnh;
	}
	
}
