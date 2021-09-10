package model.bean;

public class LoaiSanPham {
	private String id;
	private String tenLoaiSanPham;
	private String idDanhMuc;
	
	public LoaiSanPham() {
		super();
	}

	public LoaiSanPham(String id, String tenLoaiSanPham) {
		super();
		this.id = id;
		this.tenLoaiSanPham = tenLoaiSanPham;
	}

	public LoaiSanPham(String id, String tenLoaiSanPham, String idDanhMuc) {
		super();
		this.id = id;
		this.tenLoaiSanPham = tenLoaiSanPham;
		this.idDanhMuc = idDanhMuc;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTenLoaiSanPham() {
		return tenLoaiSanPham;
	}

	public void setTenLoaiSanPham(String tenLoaiSanPham) {
		this.tenLoaiSanPham = tenLoaiSanPham;
	}

	public String getIdDanhMuc() {
		return idDanhMuc;
	}

	public void setIdDanhMuc(String idDanhMuc) {
		this.idDanhMuc = idDanhMuc;
	}
	
}
