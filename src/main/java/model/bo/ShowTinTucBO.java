package model.bo;

import java.util.ArrayList;

import model.bean.TinTuc;
import model.dao.TinTucDAO;

public class ShowTinTucBO {
	TinTucDAO tinTucDAO = new TinTucDAO();
	
	public ArrayList<TinTuc> getAllTinTuc() {
		return tinTucDAO.getAllTinTuc();
	}

	public TinTuc getTinTucById(String idTinTuc) {
		return tinTucDAO.getTinTucById(idTinTuc);
	}

}
