package com.neuedu.util;

import java.util.List;
import java.util.Map;

public class PageInfo {
	private int total;
	private List<Map<String,Object>> data;
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<Map<String, Object>> getData() {
		return data;
	}
	public void setData(List<Map<String, Object>> data) {
		this.data = data;
	}
	
}
