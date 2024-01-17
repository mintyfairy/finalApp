package com.fa.plus.service.car;

import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.car.CarReservation;
import com.fa.plus.mapper.CarReservationMapper;

@Service
public class CarReservationServiceImpl implements CarReservationService {
	@Autowired
	private CarReservationMapper mapper;
	
	private static AtomicLong count = new AtomicLong(0);
	
	@Override
	public String carReservationOrderNumber() {
		// 예약 번호 생성
		String result = "";
				
		try {
			Calendar cal = Calendar.getInstance();
			String y =String.format("%04d", cal.get(Calendar.YEAR));
			String m = String.format("%02d", (cal.get(Calendar.MONTH) + 1));
			String d = String.format("%02d", cal.get(Calendar.DATE));
					
			String preNumber = y + m + d;
			String savedPreNumber = "0";
			long savedLastNumber = 0;
			String maxOrderNumber = mapper.findByMaxReservationNumber();
			if(maxOrderNumber != null && maxOrderNumber.length() > 9) {
				savedPreNumber = maxOrderNumber.substring(0, 9);
				savedLastNumber = Long.parseLong(maxOrderNumber.substring(9));
			}
					
			long lastNumber = 1;
			if(! preNumber.equals(savedPreNumber)) {
				count.set(0);
				lastNumber = count.incrementAndGet();
			} else {
				lastNumber = count.incrementAndGet();
						
				if( savedLastNumber >= lastNumber )  {
					count.set(savedLastNumber);
					lastNumber = count.incrementAndGet();
				}
			}
					
			result = preNumber + String.format("%09d", lastNumber);
					
		} catch (Exception e) {
		}
				
		return result;
	}
	
	@Override
	public void insertCarReservation(CarReservation dto) throws Exception {
		
		try {
			
			String orderNum = carReservationOrderNumber();
			
			// 주문 정보 저장
			mapper.insertCarReservation(dto);

			// 결제 내역 저장
			mapper.insertCarPayDetail(dto);
			
			// 상세 주문 정보 및 주문 상태 저장
			dto.setCarNum(dto.getCarNum());
			dto.setDiscountRate(dto.getDiscountRate());
			dto.setDiscount(dto.getDiscount());
			dto.setTotMoney(dto.getTotMoney());
			dto.setPayment(dto.getPayment());
			dto.setStart_date(dto.getStart_date());
			dto.setEnd_date(dto.getEnd_date());
			dto.setWeekCost(dto.getWeekCost());
			dto.setWkndCost(dto.getWkndCost());
			dto.setMemberIdx(dto.getMemberIdx());
			dto.setUserId(dto.getUserId());
			// dto.setOrderDate(dto.getOrderDate());
			dto.setOrderNum(orderNum);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public void insertCarPayDetail(CarReservation dto) throws Exception {
		try {
			mapper.insertCarPayDetail(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public CarReservation findById(long carNum) {
		CarReservation dto = null;
		
		try {
			dto = mapper.findById(carNum);
			/*
			if(dto != null) {
				int discount = 0;
				if(dto.getDiscountRate() > 0) {
					discount = (int)(dto.getFee() * (dto.getDiscountRate()/100.0));
					dto.setDiscount(discount);
				}
				
				dto.setPayment(dto.getFee());
			}
			*/
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<CarReservation> listSelectCar(List<Map<String, Long>> list) {
		List<CarReservation> listSelectCar = null;
		
		try {
			listSelectCar = mapper.listSelectCar(list);
			
			/*for(CarReservation dto : listSelectCar) {
				int discount = 0;
				if(dto.getDiscountRate() > 0) {
					discount = (int)(dto.getFee() * (dto.getDiscountRate()/100.0));
					dto.setDiscount(discount);
			}
				
				dto.setPayment(dto.getFee());
				
			}

			*/
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return listSelectCar;
	}


	


	
	
}
