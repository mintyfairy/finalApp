
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
			StringBuffer options = new StringBuffer();
			// 배열을 스트링으로 변환
			if (dto.getSiteoptionList() != null) {
				for (String option : dto.getSiteoptionList()) {
					options.append(option);

				}
				dto.setSiteoption(options.toString());
			} // 여러변 수정되는 문자열이라 스트링버퍼를 사용했다.
				// [0,0,1...]이던 배열이 001..형태의 스트링이 될것으로 기대된다.

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

		try {
			StringBuffer options = new StringBuffer();
			// 배열을 스트링으로 변환
			if (dto.getSiteoptionList() != null) {
				for (String option : dto.getSiteoptionList()) {
					options.append(option);

				}
				dto.setSiteoption(options.toString());
			} // 여러변 수정되는 문자열이라 스트링버퍼를 사용했다.
				// [0,0,1...]이던 배열이 001..형태의 스트링이 될것으로 기대된다.

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
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public void deleteSite(long SiteNum, String pathname) throws Exception {
		// TODO Auto-generated method stub

		try {
			// 썸넬삭제
			if (pathname != null) {
				fileManager.doFileDelete(pathname);
			}
			mapper.deleteSite(SiteNum);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteSiteFile(long fileNum, String pathname) throws Exception {
		// TODO Auto-generated method stub

		try {
			if (pathname != null) {
				fileManager.doFileDelete(pathname);
			}

			mapper.deleteSiteFile(fileNum);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public void insertRoom(SiteDetail dto, String pathname) throws Exception {
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

		try {
			mapper.updateRoom(dto);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public void deleteRoom(long DetailNum, String pathname) throws Exception {
		// TODO Auto-generated method stub

		try {

			mapper.deleteRoom(DetailNum);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public void deleteRoomFile(long SdPicNum, String pathname) throws Exception {
		// TODO Auto-generated method stub

		try {
			if (pathname != null) {
				fileManager.doFileDelete(pathname);
			}

			mapper.deleteRoomFile(SdPicNum);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public int dataCountSite(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int a = 0;
		try {
			a = mapper.dataCountSite(map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
		return a;
	}

	@Override
	public int dataCountRoom(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int a = 0;
		try {
			a = mapper.dataCountRoom(map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
		return a;
	}

	@Override
	public List<Site> listSite(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<Site> list = null;

		try {
			list = mapper.listSite(map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
		return list;
	}

	@Override
	public List<SiteDetail> listRoom(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<SiteDetail> list = null;
		try {
			list = mapper.listRoom(map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
		return list;
	}

	@Override
	public Site findByIdSite(long SiteNum) throws Exception {
		Site dto = null;

		try {
			dto = mapper.findByIdSite(SiteNum);
			String[] options = dto.getSiteoption().split("");
			//수정폼을 위해 분해

			dto.setSiteoptionList(options);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}

		return dto;
	}

	@Override
	public SiteDetail findByIdRoom(long DetailNum) throws Exception {
		SiteDetail dto = null;

		try {
			dto = mapper.findByIdRoom(DetailNum);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}

		return dto;
	}

}
