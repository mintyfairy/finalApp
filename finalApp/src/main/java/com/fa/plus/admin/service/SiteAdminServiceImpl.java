
package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fa.plus.admin.mapper.SiteAdminMapper;
import com.fa.plus.common.FileManager;
import com.fa.plus.domain.site.Site;
import com.fa.plus.domain.site.SiteDetail;
import com.fa.plus.domain.site.SiteSearch;

@Service
public class SiteAdminServiceImpl implements SiteAdminService {

	@Autowired
	private SiteAdminMapper mapper;

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
			if(filename != null) {
				// 이전 파일 지우기
				if (dto.getThumbnail().length() != 0) {
					fileManager.doFileDelete(dto.getThumbnail(), pathname);
				}
				
				dto.setThumbnail(filename);
			}

			// 상품 저장

			mapper.updateSite(dto);

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
			}//추가이미지는 새로 추가된 사진만 저장되고 사진의 삭제는 작성페이지에서 ajax로 처리한다.
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
					dto.setFileName(filename);

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
			
			String filename = null;
			if (!dto.getAddFiles().isEmpty()) {
				for (MultipartFile mf : dto.getAddFiles()) {
					filename = fileManager.doFileUpload(mf, pathname);
					if (filename == null) {
						continue;
					}
					dto.setFileName(filename);

					mapper.insertRoomFile(dto);
				}
			}
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
	public List<Site> listSearchSite(SiteSearch dto) {
		// TODO Auto-generated method stub
		List<Site> list = null;
		List<Site> list2 = null;
		//검색 단계에서 너무많은 검색조건이 존재해서 한번에 하는것에 문제가 있어서 걸러보자
		
		try {
			
			
			list = mapper.listSearchSite(dto);
			
			
			//옵션검사
			
			
			
			
			StringBuffer options = new StringBuffer();
			// 배열을 스트링으로 변환
			String[] optionlist=(String[])dto.getSiteOption();
			/*
			 향상된 포문장이 내용물을 remove하면 제대로 다음걸 가져오는지 모르겟다.
			 if (optionlist != null ) {
				for (String option : optionlist) {
					options.append(option);
				}
				for (Site vo : list) {
					int test=Integer.parseInt(options.toString())
						-Integer.parseInt(vo.getSiteoption());
					if(Integer.toString(test).indexOf("9")>0) {
						list.remove(vo);
						System.out.println(vo+"체크");
					}//옵션이 다른게 잇으면 뺸값에 9가 존재하게된다.
				}
			}else {
			} 
			 */
			
			if (optionlist != null ) {
				for (String option : optionlist) {
					options.append(option);
				}
				for (Site vo : list) {
					int test=Integer.parseInt(options.toString())
						-Integer.parseInt(vo.getSiteoption());
					if(Integer.toString(test).indexOf("9")!=-1) {
						list2.add(vo);
						System.out.println(vo+"체크");
					}//옵션이 다른게 잇으면 뺸값에 9가 존재하게된다.
				}
			}else {
				for (Site vo : list) {
						System.out.println(vo+"체크");
					}//옵션이 다른게 잇으면 뺸값에 9가 존재하게된다.
				return list;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
		return list2;
	}
	
	@Override
	public List<SiteDetail> listSearchRoom(SiteSearch dto) {
		// TODO Auto-generated method stub
		List<SiteDetail> list = null;
		try {
			list = mapper.listSearchRoom(dto);
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

	@Override
	public List<Site> listSiteFile(long siteNum) {
		
		List<Site> list = null;
		try {
			list = mapper.listSiteFile(siteNum);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
		return list;
	}

	@Override
	public List<SiteDetail> listRoomFile(long detailNum) {
		
		List<SiteDetail> list = null;
		try {
			list = mapper.listRoomFile(detailNum);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
		return list;
	}

}
