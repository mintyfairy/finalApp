package com.fa.plus.admin.service.car;

import java.util.List;
import java.util.Map;

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
	public List<CampingCar> listCar(Map<String, Object> map) {
		List<CampingCar> list = null;

		try {
			list = mapper.listCar(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void updateHitCount(long carNum) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public CampingCar findById(long carNum) {
		CampingCar dto = null;
		
		try {
			dto = mapper.findById(carNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateCar(CampingCar dto, String pathname) throws Exception {
		try {
			// 썸네일 이미지
			String filename = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
			if(filename != null) {
				// 이전 파일 지우기
				if(dto.getThumbnail().length() != 0) {
					fileManager.doFileDelete(dto.getThumbnail(), pathname);
				}
				dto.setThumbnail(filename);
			}
			//상품 수정
			mapper.updateCar(dto);
			mapper.updateCarDetail(dto);
			mapper.updateCarOption(dto);
			
			// 추가 이미지
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
	
	@Override
	public void updateCarDetail(CampingCar dto, String pathname) throws Exception {
		try {
			mapper.updateCarDetail(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateCarOption(CampingCar dto, String pathname) throws Exception {
		try {
			mapper.updateCarOption(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<CampingCar> listCarFile(long carNum) {
		List<CampingCar> list = null;
		try {
			list = mapper.listCarFile(carNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void deleteCar(long cartNum, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCarFile(long carImagenum, String pathname) throws Exception {
		try {
			if (pathname != null) {
				fileManager.doFileDelete(pathname);
			}

			mapper.deleteCarFile(carImagenum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}







}
