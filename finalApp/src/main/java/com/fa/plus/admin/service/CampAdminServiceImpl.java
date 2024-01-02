
package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fa.plus.admin.mapper.CampAdminMapper;
import com.fa.plus.common.FileManager;
import com.fa.plus.domain.site.Site;
import com.fa.plus.domain.site.SiteDetail;

@Service
public class CampAdminServiceImpl implements CampAdminService {

	@Autowired
	private CampAdminMapper mapper;

	@Autowired
	private FileManager fileManager;

	@Override
	public void insertSite(Site dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		try {
			StringBuffer options =new StringBuffer();
			//배열을 스트링으로 변환
			if(dto.getSiteoptionList()!=null) {
				for(String option:dto.getSiteoptionList()) {
					options.append(option);
					
				}
				dto.setSiteoption(pathname);
			}//여러변 수정되는 문자열이라 스트링버퍼를 사용했다.
			//[0,0,1...]이던 배열이 001..형태의 스트링이 될것으로 기대된다.
			System.out.println(dto.getSiteoption());
			System.out.println(dto.getSiteoptionList()+"리스트");
			System.out.println(dto.getSiteoptionList().toString());
			
			
			
			// 썸네일 이미지
			String filename = fileManager.doFileUpload(dto.getThumbnailfile(), pathname);
			dto.setThumbnail(filename);

			// 상품 저장
			long Num = mapper.SiteSeq();

			dto.setSitenum(Num);
			mapper.insertSite(dto);

			// 추가 이미지 저장
			if (!dto.getAddFiles().isEmpty()) {
				for (MultipartFile mf : dto.getAddFiles()) {
					filename = fileManager.doFileUpload(mf, pathname);
					if (filename == null) {
						continue;
					}
					dto.setFileName(filename);

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

			dto.setDetailnum(Num);
			mapper.insertRoom(dto);

			// 추가 이미지 저장
			String filename = null;
			if (!dto.getAddFiles().isEmpty()) {
				for (MultipartFile mf : dto.getAddFiles()) {
					filename = fileManager.doFileUpload(mf, pathname);
					if (filename == null) {
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
