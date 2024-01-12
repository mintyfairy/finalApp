package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.fa.plus.domain.car.CarReservation;

public interface CarReservationMapper {
	public void insertCarReservation(CarReservation dto) throws SQLException;
	public void insertCarPayDetail(CarReservation dto) throws SQLException;
	
	public List<CarReservation> listSelectCar(List<Map<String, Long>> list);
	public CarReservation findById(long carNum);
}
