package model.bean;

public class SanPham {
	private String id;
	private String tenSanPham;
	private String tacGia;
	private String nhaXuatBan;
	private double gia;
	private double khuyenMai;
	private double soLuongCo;
	private String moTa;
	private String idTheLoai;
	private String giaString;
	private String khuyenMaiString;
	private String soLuongCoString;
	
	public SanPham(String id, String tenSanPham, String tacGia, String nhaXuatBan, double gia, double khuyenMai,
			double soLuongCo, String moTa, String idTheLoai) {
		super();
		this.id = id;
		this.tenSanPham = tenSanPham;
		this.tacGia = tacGia;
		this.nhaXuatBan = nhaXuatBan;
		this.gia = gia;
		this.khuyenMai = khuyenMai;
		this.soLuongCo = soLuongCo;
		this.moTa = moTa;
		this.idTheLoai = idTheLoai;
	}

	public SanPham() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTenSanPham() {
		return tenSanPham;
	}

	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}

	public String getTacGia() {
		return tacGia;
	}

	public void setTacGia(String tacGia) {
		this.tacGia = tacGia;
	}

	public String getNhaXuatBan() {
		return nhaXuatBan;
	}

	public void setNhaXuatBan(String nhaXuatBan) {
		this.nhaXuatBan = nhaXuatBan;
	}

	public double getGia() {
		return gia;
	}

	public void setGia(double gia) {
		this.gia = gia;
	}

	public double getKhuyenMai() {
		return khuyenMai;
	}

	public void setKhuyenMai(double khuyenMai) {
		this.khuyenMai = khuyenMai;
	}

	public double getSoLuongCo() {
		return soLuongCo;
	}

	public void setSoLuongCo(double soLuongCo) {
		this.soLuongCo = soLuongCo;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public String getIdTheLoai() {
		return idTheLoai;
	}

	public void setIdTheLoai(String idTheLoai) {
		this.idTheLoai = idTheLoai;
	}

	public String getGiaString() {
		return giaString;
	}

	public void setGiaString(String giaString) {
		this.giaString = giaString;
	}

	public String getKhuyenMaiString() {
		return khuyenMaiString;
	}

	public void setKhuyenMaiString(String khuyenMaiString) {
		this.khuyenMaiString = khuyenMaiString;
	}

	public String getSoLuongCoString() {
		return soLuongCoString;
	}

	public void setSoLuongCoString(String soLuongCoString) {
		this.soLuongCoString = soLuongCoString;
	}
	
}
