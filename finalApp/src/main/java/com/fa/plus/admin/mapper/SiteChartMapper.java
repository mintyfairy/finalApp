package com.fa.plus.admin.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SiteChartMapper {
	public Map<String, Object> previousMonthBook();
	public Map<String, Object> previousYearBook();
	public Map<String, Object> adEfect();
}
