package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.fa.plus.domain.car.CarMyPage;
import com.fa.plus.domain.car.CarReservation;

public interface CarMyPageMapper {
	public void insertRider(CarMyPage dto) throws SQLException;
	public void updateRider(CarMyPage dto) throws SQLException;
	public CarMyPage riderInfo(long memberIdx) throws SQLException;
	
	public int countCarPayment(Map<String, Object> map);
	public List<CarReservation> listCarPayment(Map<String, Object> map);
	
	
}
