package com.fa.plus.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SiteChartMapper {
	public Map<String, Object> previousMonthBook();
	public Map<String, Object> previousYearBook();
	public Map<String, Object> adEfect();
	
	public List<Map<String, Object>> siteRankYear();
	public List<Map<String, Object>> monthsRankYear();
	public List<Map<String, Object>> daysRankYear();
	
	public List<Map<String, Object>> thingsRankYear(String keyword);
}
