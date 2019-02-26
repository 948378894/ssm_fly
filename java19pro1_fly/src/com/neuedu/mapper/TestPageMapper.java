package com.neuedu.mapper;

import java.util.List;
import java.util.Map;

import com.neuedu.domain.Page;

public interface TestPageMapper {
	int getTotalCount();
	List<Map<String,Object>> getData(Page page);
}
