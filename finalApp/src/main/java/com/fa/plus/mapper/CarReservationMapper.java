package com.fa.plus.mapper;

import java.sql.SQLException;

import com.fa.plus.domain.car.CarReservation;

public interface CarReservationMapper {
	public void insertCarReservation(CarReservation dto) throws SQLException;
	public void insertCarPayDetail(CarReservation dto) throws SQLException;
}
