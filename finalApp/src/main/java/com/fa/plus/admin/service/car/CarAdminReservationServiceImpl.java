package com.fa.plus.admin.service.car;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.car.CarReservation;
import com.fa.plus.admin.mapper.CarAdminReservationMapper;

@Service
public class CarAdminReservationServiceImpl implements CarReservationService {
	@Autowired
	private CarAdminReservationMapper mapper;

	@Override
	public Map<String, Object> todayReservation() {
		Map<String, Object> resultMap = null;
		try {
			resultMap = mapper.todayReservation();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

	@Override
	public Map<String, Object> monthSales() {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = mapper.monthSales();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> yearSales() {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = mapper.yearSales();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}



	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<CarReservation> listReservation(Map<String, Object> map) {
		List<CarReservation> list = null;

		try {
			list = mapper.listReservation(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public CarReservation findById(long memberIdx) {
		CarReservation dto = null;
		try {
			dto = mapper.findById(memberIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<Map<String, Object>> monthTotalMoney(String month) {
		List<Map<String, Object>> list = null;
		
		try {
			list = mapper.monthTotalMoney(month);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public com.fa.plus.admin.domain.car.CarReservation listDetail(Map<String, Object> map) {
		CarReservation dto = null;

		try {
			dto = mapper.listDetail(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public com.fa.plus.admin.domain.car.CarReservation listRiderDetail(Map<String, Object> map) {
		CarReservation dto = null;

		try {
			dto = mapper.listDetail(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}



}
