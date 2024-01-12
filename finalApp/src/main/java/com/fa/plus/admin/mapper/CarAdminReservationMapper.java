package com.fa.plus.admin.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CarAdminReservationMapper {
	public Map<String, Object> todayReservation(); // 오늘 예약건수
	public Map<String, Object> monthSales(); 
	public Map<String, Object> yearSales(); 
	
}
