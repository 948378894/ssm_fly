package com.neuedu.service;

import java.util.List;
import java.util.Map;

import com.neuedu.domain.Page;

public interface TestPageService {
		int getTotalCount();
		List<Map<String,Object>> getData(Page page);
		
}
