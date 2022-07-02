package com.gf.golboogi.vo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class BookingComplexSearchVO {
	private String teeTimeD =getTomorrow("yyyy-MM-dd");
	private int partTime;
	private String fieldArea;
	private int fieldGreenfee;
	
	 public static String getTomorrow(String pattern) {
	        DateFormat dtf = new SimpleDateFormat(pattern);
	        final Calendar cal = Calendar.getInstance();
	        cal.add(Calendar.DATE, 1);
	        return dtf.format(cal.getTime());
	    }
}
