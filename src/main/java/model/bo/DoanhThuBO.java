package model.bo;

import java.sql.Date;
import java.util.ArrayList;

import common.DateCommon;
import common.ValidateCommon;
import model.bean.ThongKe;
import model.dao.DoanhThuDAO;

public class DoanhThuBO {
	DoanhThuDAO doanhThuDAO = new DoanhThuDAO();

	public ArrayList<ThongKe> getSanPhamDaBan(String day1, String month1, String year1, String day2, String month2,
			String year2) {
		Date date1 = null, date2 = null;
		try {
			date1 = Date.valueOf(year1 + "-" + month1 + "-"  + day1);
			date2 = Date.valueOf(year2 + "-" + month2 + "-"  + day2);
			System.out.println(date1 + " " + date2);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return doanhThuDAO.getSanPhamDaBan(date1, date2);
	}

	public int check(String day1, String month1, String year1, String day2, String month2, String year2) {
		if (ValidateCommon.checkRequiredFileds(day1, month1, year1, day2, month2, year2)) {
			int ngay1 = Integer.valueOf(day1), thang1 = Integer.valueOf(month1), nam1 = Integer.valueOf(year1),
					ngay2 = Integer.valueOf(day2), thang2 = Integer.valueOf(month2), nam2 = Integer.valueOf(year2);
			
			if (! DateCommon.isValidDate(ngay1, thang1, nam1) || ! DateCommon.isValidDate(ngay2, thang2, nam2)) {
				return 1;
			}
		} else {
			return 1;
		}
		
		return 0;
	}

}
