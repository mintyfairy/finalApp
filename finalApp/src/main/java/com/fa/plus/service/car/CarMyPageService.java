package com.fa.plus.service.car;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.car.CarMyPage;
import com.fa.plus.domain.car.CarReservation;

public interface CarMyPageService {
	public void insertRider(CarMyPage dto, String pathname) throws Exception;
	public void updateRider(CarMyPage dto, String pathname) throws Exception;
	public CarMyPage riderInfo(long memberIdx);
	
	public int countCarPayment(Map<String, Object> map);
	public List<CarReservation> listCarPayment(Map<String, Object> map);
	
	
}
