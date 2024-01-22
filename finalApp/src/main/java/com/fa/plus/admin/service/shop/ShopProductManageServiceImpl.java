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
			
			// 상품 보임
			dto.setProductShow(1);
			
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
			
			// 재고 저장
			for(long dn : dto.getDetailNums()) {
				for(long dn2 : dto.getDetailNums2()) {
					dto.setDetailNum(dn);
					dto.setDetailNum2(dn2);
					dto.setTotalStock(0);
					
					mapper.insertProductStock(dto);
				}
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
	public void updateHide(Map<String, Object> map) throws Exception {
		
		try {
			mapper.updateHide(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteOptionDetail(long detailNum) throws Exception {
		try {
			mapper.deleteOptionDetail(detailNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateProduct(ShopProductManage dto, String pathname) throws Exception {
		try {
			// 적립금. 0.5%씩 적립
			int total_price = (int)(Math.ceil(dto.getPrice() * (1 - dto.getDiscountRate()/100)));
			
			int savedMoney = (int)(Math.floor(total_price * 0.005));
			dto.setSavedMoney(savedMoney);
			
			// 썸네일 이미지
			String filename = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
			if(filename != null) {
				// 이전 파일 지우기
				if (dto.getThumbnail().length() != 0) {
					fileManager.doFileDelete(dto.getThumbnail(), pathname);
				}
				
				dto.setThumbnail(filename);
			}
			
			// 상품 수정
			mapper.updateProduct(dto);
			
			// 추가 이미지
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
			
			// 상위 옵션 수정
			mapper.updateProductOption(dto);
			
			// 기존 상위 옵션값 수정
			int size = dto.getDetailNums().size();
			for(int i = 0; i < size; i++) {
				dto.setDetailNum(dto.getDetailNums().get(i));
				dto.setOptionValue(dto.getOptionValues().get(i));
				mapper.updateOptionDetail(dto);
			}

			// 새로운 상위 옵션값 추가
			long detailNum;
			dto.setDetailNums(new ArrayList<Long>());
			for(int i = size; i < dto.getOptionValues().size(); i++) {
				detailNum = mapper.detailSeq(); 
				dto.setDetailNum(detailNum);
				dto.setOptionValue(dto.getOptionValues().get(i));
				mapper.insertOptionDetail(dto);
				
				dto.getDetailNums().add(detailNum);
			}

			// 하위 옵션 수정
			dto.setOptionNum(dto.getOptionNum2());
			dto.setOptionName(dto.getOptionName2());
			mapper.updateProductOption(dto);
			
			// 기존 하위 옵션값 수정
			int size2 = dto.getDetailNums2().size();
			for(int i = 0; i < size2; i++) {
				dto.setDetailNum(dto.getDetailNums2().get(i));
				dto.setOptionValue(dto.getOptionValues2().get(i));
				mapper.updateOptionDetail(dto);
			}

			// 새로운 하위 옵션값 추가
			dto.setDetailNums2(new ArrayList<Long>());
			for(int i = size2; i < dto.getOptionValues2().size(); i++) {
				detailNum = mapper.detailSeq(); 
				dto.setDetailNum(detailNum);
				dto.setOptionValue(dto.getOptionValues2().get(i));
				mapper.insertOptionDetail(dto);
				
				dto.getDetailNums2().add(detailNum);
			}

			/*
			// 재고 테이블 저장
			ProductStockManage stock = new ProductStock();
			stock.setProductNum(dto.getProductNum());
			for(long dn : dto.getDetailNums()) {
				for(long dn2 : dto.getDetailNums2()) {
					stock.setDetailNum(dn);
					stock.setDetailNum2(dn2);
					
					mapper.insertProductStock(stock);
				}
			}
			*/			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteProduct(long productNum, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProductFile(long fileNum, String pathname) throws Exception {
		try {
			if (pathname != null) {
				fileManager.doFileDelete(pathname);
			}

			mapper.deleteProductFile(fileNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteProductStock1(long detailNum) throws Exception {
		try {
			mapper.deleteProductStock1(detailNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteProductStock2(long detailNum) throws Exception {
		try {
			mapper.deleteProductStock2(detailNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<ShopProductManage> listProductStock(long productNum) {
		List<ShopProductManage> list = null;
		
		try {
			list = mapper.listProductStock(productNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return list;
	}

	@Override
	public void updateProductStock(ShopProductManage dto) throws Exception {
		try {
			mapper.updateProductStock(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int findTotalStock(long stockNum) {
		int totalStock = 0;
		
		try {
			totalStock = mapper.findTotalStock(stockNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return totalStock;
	}

	@Override
	public List<ShopProductManage> findByHotId() {
		List<ShopProductManage> list = null;
		
		try {
			list = mapper.findByHotId();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
