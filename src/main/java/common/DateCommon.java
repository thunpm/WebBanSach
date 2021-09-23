package common;

public class DateCommon {
	
	public static boolean isValidDate(int ngay, int thang, int nam) {
		if (thang == 4 || thang == 6 || thang == 9 || thang == 11) {
			if (ngay == 31) {
				return false;
			}
		} else if (thang == 2) {
			if (nam%400 == 0 || (nam%100 != 0 && nam%4 == 0)) {
				if (ngay > 29) {
					return false;
				}
			} else {
				if (ngay > 28) {
					return false;
				}
			}
		}
		
		return true;
	}
}
