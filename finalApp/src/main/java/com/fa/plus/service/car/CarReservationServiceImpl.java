package com.fa.plus.service.car;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.car.CarReservation;
import com.fa.plus.mapper.CarReservationMapper;

@Service
public class CarReservationServiceImpl implements CarReservationService {
	@Autowired
	private CarReservationMapper mapper;
	
	@Override
	public void insertCarReservation(CarReservation dto) throws Exception {
		
		try {
			// 주문 정보 저장
			mapper.insertCarReservation(dto);;

			// 결재 내역 저장
			mapper.insertCarPayDetail(dto);;
			
			// 상세 주문 정보 및 주문 상태 저장
			dto.setCarNum(dto.getCarNum());
			dto.setTotMoney(dto.getTotMoney());
			dto.setDiscount(dto.getDiscount());
			dto.setPayment(dto.getPayment());
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	
}
