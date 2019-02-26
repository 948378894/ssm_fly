package com.neuedu.util;

import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SDF {
	private static SDF ssfu;
	InputStream inputStream=null;
	private SDF() {}
	public static SDF getInstance() {
		if(ssfu==null) {
			ssfu=new SDF();
		}
		return ssfu;
	}
	public String getDateString(Date date) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String str=sdf.format(date);
		return str;
	}
}
