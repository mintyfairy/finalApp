package com.fa.plus.service.car;

import com.fa.plus.domain.car.CarMyPage;

public interface CarMyPageService {
	public void insertRider(CarMyPage dto) throws Exception;
	public void updateRider(CarMyPage dto) throws Exception;
	
	public CarMyPage riderInfo(String userId);
	
}
