package model.bean;

import java.sql.Date;

public class TinTuc {
	private String id;
	private String tieuDe;
	private String tomTat;
	private String urlHinh;
	private Date ngayDang;
	private String idAdmin;
	private String noiDung;
	private boolean trangThai;
	
	public TinTuc() {
		super();
	}
	
	public TinTuc(String id, String tieuDe, String tomTat, String urlHinh, Date ngayDang, String idAdmin,
			String noiDung, boolean trangThai) {
		super();
		this.id = id;
		this.tieuDe = tieuDe;
		this.tomTat = tomTat;
		this.urlHinh = urlHinh;
		this.ngayDang = ngayDang;
		this.idAdmin = idAdmin;
		this.noiDung = noiDung;
		this.trangThai = trangThai;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getTieuDe() {
		return tieuDe;
	}
	
	public void setTieuDe(String tieuDe) {
		this.tieuDe = tieuDe;
	}
	
	public String getTomTat() {
		return tomTat;
	}
	
	public void setTomTat(String tomTat) {
		this.tomTat = tomTat;
	}
	
	public String getUrlHinh() {
		return urlHinh;
	}
	
	public void setUrlHinh(String urlHinh) {
		this.urlHinh = urlHinh;
	}
	public Date getNgayDang() {
		return ngayDang;
	}
	public void setNgayDang(Date ngayDang) {
		this.ngayDang = ngayDang;
	}
	
	public String getIdAdmin() {
		return idAdmin;
	}
	
	public void setIdAdmin(String idAdmin) {
		this.idAdmin = idAdmin;
	}
	
	public String getNoiDung() {
		return noiDung;
	}
	
	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}
	
	public boolean isTrangThai() {
		return trangThai;
	}
	
	public void setTrangThai(boolean trangThai) {
		this.trangThai = trangThai;
	}

}
