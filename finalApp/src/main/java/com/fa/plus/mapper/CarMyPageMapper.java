package com.fa.plus.mapper;

import java.sql.SQLException;

import com.fa.plus.domain.car.CarMyPage;

public interface CarMyPageMapper {
	public void insertRider(CarMyPage dto) throws SQLException;
	public void updateRider(CarMyPage dto) throws SQLException;
	
	public CarMyPage riderInfo(String userId) throws SQLException;
	
	
}
