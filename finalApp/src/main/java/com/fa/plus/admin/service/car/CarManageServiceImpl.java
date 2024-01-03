package com.fa.plus.admin.service.car;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fa.plus.admin.domain.car.CampingCar;
import com.fa.plus.admin.mapper.CarManageMapper;
import com.fa.plus.common.FileManager;

@Service
public class CarManageServiceImpl implements CarManageService{
	@Autowired
	private CarManageMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertCar(CampingCar dto, String pathname) throws Exception {
		try {
			// 썸네일이미지
			String filename = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
			dto.setThumbnail(filename);	
			
			// 차 저장
			long carNum = mapper.carNumseq();
			
			dto.setCarNum(carNum);
			mapper.insertCar(dto);

			mapper.insertCarDetail(dto);			
			mapper.insertCarOption(dto);
			
			// 추가 이미지 저장
			if(! dto.getAddFiles().isEmpty()) {
				for(MultipartFile mf : dto.getAddFiles()) {
					filename = fileManager.doFileUpload(mf, pathname);
					if(filename == null) {
						continue;
					}
					dto.setImageFilename(filename);
					mapper.insertImageFile(dto);
				}
			}
		
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		


	}

}
