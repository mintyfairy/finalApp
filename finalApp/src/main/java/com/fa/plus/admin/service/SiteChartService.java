package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

public interface SiteChartService {
	public Map<String, Object> previousMonthBook();
	public Map<String, Object> adEfect();
	public Map<String, Object> previousYearBook();
	
	public List<Map<String, Object>> siteRankYear();
	public List<Map<String, Object>> monthsRankYear();
	public List<Map<String, Object>> daysRankYear();
	
	public List<Map<String, Object>> thingsRankYear(String keyword);
}
