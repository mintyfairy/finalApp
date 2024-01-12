package com.fa.plus.admin.service.car;

import java.util.Map;

public interface CarReservationService {
	public Map<String, Object> todayReservation(); 
	public Map<String, Object> monthSales(); 
	public Map<String, Object> yearSales(); 
}
