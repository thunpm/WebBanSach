package model.bean;

import java.util.ArrayList;

public class GioHang {
	private ArrayList<MatHang> matHang = new ArrayList<MatHang>();

	public GioHang(ArrayList<MatHang> matHang) {
		super();
		this.matHang = matHang;
	}

	public GioHang() {
		super();
	}

	public ArrayList<MatHang> getMatHang() {
		return matHang;
	}

	public void setMatHang(ArrayList<MatHang> matHang) {
		this.matHang = matHang;
	}
	
}
