package com.fa.plus.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.car.CarReservation;

@Mapper
public interface CarAdminReservationMapper {
	public Map<String, Object> todayReservation(); // 오늘 예약건수
	public Map<String, Object> monthSales(); 
	public Map<String, Object> yearSales(); 
	public List<Map<String, Object>> monthTotalMoney(String month);

	// 예약 리스트
	public int dataCount(Map<String, Object> map);
	public List<CarReservation> listReservation(Map<String, Object> map);
	
	public CarReservation findById(long memberIdx);
	
	// 예약상세
	public CarReservation listDetail(Map<String, Object> map);
	public CarReservation listRiderDetail(Map<String, Object> map);
}
