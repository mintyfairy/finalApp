
package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.fa.plus.admin.mapper.CampAdminMapper;
import com.fa.plus.common.FileManager;
import com.fa.plus.domain.site.Site;
import com.fa.plus.domain.site.SiteDetail;

public class CampAdminServiceImpl implements CampAdminService{
 
	@Autowired
	private CampAdminMapper mapper;

	@Autowired
	private FileManager fileManager;
	
	
	@Override
	public void insertSite(Site dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		// 썸네일 이미지
		try {
					String filename = fileManager.doFileUpload(dto.getTHUMBNAILFILE(), pathname);
					dto.setTHUMBNAIL(filename);
					
					// 상품 저장
					long Num = mapper.SiteSeq();
					
					dto.setSITENUM(Num);
					mapper.insertSite(dto);
					
					// 추가 이미지 저장
					if(! dto.getAddFiles().isEmpty()) {
						for(MultipartFile mf : dto.getAddFiles()) {
							filename = fileManager.doFileUpload(mf, pathname);
							if(filename == null) {
								continue;
							}
							dto.setFilename(filename);
							
							mapper.insertSiteFile(dto);
						}
					}
					
					
				} catch (Exception e) {
					e.printStackTrace();
					throw e;
				}
	}

	@Override
	public void updateSite(Site dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteSite(long SiteNum, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteSiteFile(long fileNum, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertRoom(SiteDetail dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				// 썸네일 이미지
				try {
							
							// 상품 저장
							long Num = mapper.RoomSeq();
							
							dto.setDETAILNUM(Num);
							mapper.insertRoom(dto);
							
							// 추가 이미지 저장
							String filename=null;
							if(! dto.getAddFiles().isEmpty()) {
								for(MultipartFile mf : dto.getAddFiles()) {
									filename = fileManager.doFileUpload(mf, pathname);
									if(filename == null) {
										continue;
									}
									dto.setFilename(filename);
									
									mapper.insertRoomFile(dto);
								}
							}
							
							
						} catch (Exception e) {
							e.printStackTrace();
							throw e;
						}
	}

	@Override
	public void updateRoom(SiteDetail dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteRoom(long DetailNum, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteRoomFile(long SdPicNum, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int dataCountSite(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int dataCountRoom(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Site> listSite(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SiteDetail> listRoom(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
