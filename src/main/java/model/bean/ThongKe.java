package model.bean;

public class ThongKe {
	private String idHangHoa;
	private String tenSanPham;
	private double gia;
	private double khuyenMai;
	private int daBan;
	
	public ThongKe() {
		super();
	}

	public ThongKe(String idHangHoa, String tenSanPham, double gia, double khuyenMai, int daBan) {
		super();
		this.idHangHoa = idHangHoa;
		this.tenSanPham = tenSanPham;
		this.gia = gia;
		this.khuyenMai = khuyenMai;
		this.daBan = daBan;
	}

	public String getIdHangHoa() {
		return idHangHoa;
	}
	
	public void setIdHangHoa(String idHangHoa) {
		this.idHangHoa = idHangHoa;
	}
	
	public String getTenSanPham() {
		return tenSanPham;
	}
	
	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
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

	public int getDaBan() {
		return daBan;
	}
	
	public void setDaBan(int daBan) {
		this.daBan = daBan;
	}
	
}
