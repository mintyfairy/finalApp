package com.fa.plus.admin.service.shop;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fa.plus.admin.domain.shop.ShopProductManage;
import com.fa.plus.admin.mapper.ShopProductManageMapper;
import com.fa.plus.common.FileManager;

@Service
public class ShopProductManageServiceImpl implements ShopProductManageService {
	@Autowired
	private ShopProductManageMapper mapper;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertProduct(ShopProductManage dto, String pathname) throws Exception {
		try {
			
			// 적립금. 0.5%씩 적립
			int total_price = (int)(Math.ceil(dto.getPrice() * (1 - dto.getDiscountRate()/100)));
			
			int savedMoney = (int)(Math.floor(total_price * 0.005));
			dto.setSavedMoney(savedMoney);
			
			// 썸네일 이미지
			String filename = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
			dto.setThumbnail(filename);
			
			// 상품저장
			long productNum = mapper.productSeq();
			
			dto.setProductNum(productNum);
			mapper.insertProduct(dto);
			
			// 추가 이미지 저장
			if(! dto.getAddFiles().isEmpty()) {
				for(MultipartFile mf : dto.getAddFiles()) {
					filename = fileManager.doFileUpload(mf, pathname);
					if(filename == null) {
						continue;
					}
					dto.setFilename(filename);
					
					mapper.insertProductFile(dto);
				}
			}
			
			// 상위 옵션 저장
			long optionNum = mapper.optionSeq();
			dto.setOptionNum(optionNum);
			dto.setParentNum(null);
			mapper.insertProductOption(dto);
			
			// 상위 옵션 값 저장
			long detailNum;
			dto.setDetailNums(new ArrayList<Long>());
			for(String optionValue : dto.getOptionValues()) {
				detailNum = mapper.detailSeq();
				dto.setDetailNum(detailNum);
				dto.setOptionValue(optionValue);
				
				mapper.insertOptionDetail(dto);
				
				dto.getDetailNums().add(detailNum);
			}
			
			// 하위 옵션 저장
			long optionNum2 = mapper.optionSeq();
			dto.setOptionNum(optionNum2);
			dto.setOptionName(dto.getOptionName2());
			dto.setParentNum(optionNum);
			mapper.insertProductOption(dto);
			
			// 하위 옵션 값 저장
			dto.setDetailNums2(new ArrayList<Long>());
			for(String optionValue2 : dto.getOptionValues2()) {
				detailNum = mapper.detailSeq();
				dto.setDetailNum(detailNum);
				dto.setOptionValue(optionValue2);
				mapper.insertOptionDetail(dto);
				
				dto.getDetailNums2().add(detailNum);
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public void insertBrand(ShopProductManage dto) throws Exception {
		
		try {
			mapper.insertBrand(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public ShopProductManage findByCategory(long categoryNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ShopProductManage> listCategory() {
		List<ShopProductManage> list = null;
		
		try {
			list = mapper.listCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ShopProductManage> listSubCategory(long categoryNum) {
		List<ShopProductManage> list = null;
		
		try {
			list = mapper.listSubCategory(categoryNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ShopProductManage> listBrand() {
		List<ShopProductManage> list = null;
		
		try {
			list = mapper.listBrand();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ShopProductManage> listProduct(Map<String, Object> map) {
		List<ShopProductManage> list = null;
		
		try {
			list = mapper.listProduct(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
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
	public ShopProductManage findById(long productNum) {
		ShopProductManage dto = null;
		
		try {
			dto = mapper.findById(productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<ShopProductManage> listProductFile(long productNum) {
		List<ShopProductManage> list = null;
		
		try {
			list = mapper.listProductFile(productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ShopProductManage> listProductOption(long productNum) {
		List<ShopProductManage> list = null;
		
		try {
			list = mapper.listProductOption(productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ShopProductManage> listOptionDetail(long optionNum) {
		List<ShopProductManage> list = null;
		
		try {
			list = mapper.listOptionDetail(optionNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void updateHide(Map<String, Object> map) {
		
		try {
			mapper.updateHide(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
