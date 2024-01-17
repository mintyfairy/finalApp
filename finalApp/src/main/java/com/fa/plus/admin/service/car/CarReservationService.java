package com.fa.plus.admin.service.car;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.car.CarReservation;

public interface CarReservationService {
	public Map<String, Object> todayReservation(); 
	public Map<String, Object> monthSales(); 
	public Map<String, Object> yearSales(); 
	public List<Map<String, Object>> monthTotalMoney(String month);
	
	// 예약 리스트
	public int dataCount(Map<String, Object> map);
	public List<CarReservation> listReservation(Map<String, Object> map);
	
	public CarReservation findById(long memberIdx);
	
	// 예약 상세
	public CarReservation listDetail(Map<String, Object> map);
}
