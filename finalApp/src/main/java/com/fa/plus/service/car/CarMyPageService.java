package com.fa.plus.service.car;

import com.fa.plus.domain.car.CarMyPage;

public interface CarMyPageService {
	public void insertRider(CarMyPage dto, String pathname) throws Exception;
	public void updateRider(CarMyPage dto, String pathname) throws Exception;
	
	public CarMyPage riderInfo(String userId);
	
}
