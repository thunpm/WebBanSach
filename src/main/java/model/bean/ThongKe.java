package model.bean;

public class ThongKe {
	private String idHangHoa;
	private String tenSanPham;
	private double tienThu;
	private int daBan;
	
	public ThongKe() {
		super();
	}

	public ThongKe(String idHangHoa, String tenSanPham, double tienThu, int daBan) {
		super();
		this.idHangHoa = idHangHoa;
		this.tenSanPham = tenSanPham;
		this.tienThu = tienThu;
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
	
	public double getTienThu() {
		return tienThu;
	}
	
	public void setTienThu(double tienThu) {
		this.tienThu = tienThu;
	}

	public int getDaBan() {
		return daBan;
	}
	
	public void setDaBan(int daBan) {
		this.daBan = daBan;
	}
	
}
