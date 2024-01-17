package com.fa.plus.service.car;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.car.CarReservation;

public interface CarReservationService {
	public String carReservationOrderNumber();
	public void insertCarReservation(CarReservation dto) throws Exception;
	public void insertCarPayDetail(CarReservation dto) throws Exception;
	
	public CarReservation findById(long carNum);
	public List<CarReservation> listSelectCar(List<Map<String, Long>> list);
	
	
}
