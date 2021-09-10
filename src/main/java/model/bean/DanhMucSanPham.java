package model.bean;

import java.util.ArrayList;

public class DanhMucSanPham {
	private String id;
	private String tenDanhMuc;
	private ArrayList<LoaiSanPham> listLoaiSanPham = new ArrayList<LoaiSanPham>();
	
	public DanhMucSanPham() {
		super();
	}

	public DanhMucSanPham(String tenDanhMuc) {
		super();
		this.tenDanhMuc = tenDanhMuc;
	}

	public DanhMucSanPham(String id, String tenDanhMuc) {
		super();
		this.id = id;
		this.tenDanhMuc = tenDanhMuc;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTenDanhMuc() {
		return tenDanhMuc;
	}
	public void setTenDanhMuc(String tenDanhMuc) {
		this.tenDanhMuc = tenDanhMuc;
	}

	public ArrayList<LoaiSanPham> getListLoaiSanPham() {
		return listLoaiSanPham;
	}

	public void setListLoaiSanPham(ArrayList<LoaiSanPham> listLoaiSanPham) {
		this.listLoaiSanPham = listLoaiSanPham;
	}
	
}
