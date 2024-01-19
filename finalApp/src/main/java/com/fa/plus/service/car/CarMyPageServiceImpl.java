package com.fa.plus.service.car;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.common.FileManager;
import com.fa.plus.domain.car.CarMyPage;
import com.fa.plus.mapper.CarMyPageMapper;

@Service
public class CarMyPageServiceImpl implements CarMyPageService {
	@Autowired
	private CarMyPageMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertRider(CarMyPage dto, String pathname) throws Exception {
		try {
			// 면허증 이미지
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if (saveFilename != null) {
				dto.setLicenseImage(saveFilename);

				mapper.insertRider(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateRider(CarMyPage dto, String pathname) throws Exception {
		try {
			// 썸네일 이미지
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
				if(saveFilename != null) {
					// 이전 파일 지우기
					if(dto.getLicenseImage().length() != 0) {
					fileManager.doFileDelete(dto.getLicenseImage(), pathname);
				}
							dto.setLicenseImage(saveFilename);
						}
			
			mapper.updateRider(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public CarMyPage riderInfo(long memberIdx) {
		CarMyPage dto = null;
		
		try {
			dto = mapper.riderInfo(memberIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
}
