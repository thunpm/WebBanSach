package model.bean;

public class ChiTietHoaDon {
	private int idHoaDon;
	private String idHangHoa;
	private int soLuong;
	
	public ChiTietHoaDon(int idHoaDon, String idHangHoa, int soLuong) {
		super();
		this.idHoaDon = idHoaDon;
		this.idHangHoa = idHangHoa;
		this.soLuong = soLuong;
	}

	public ChiTietHoaDon() {
		super();
	}

	public int getIdHoaDon() {
		return idHoaDon;
	}

	public void setIdHoaDon(int idHoaDon) {
		this.idHoaDon = idHoaDon;
	}

	public String getIdHangHoa() {
		return idHangHoa;
	}

	public void setIdHangHoa(String idHangHoa) {
		this.idHangHoa = idHangHoa;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

}
