package com.fa.plus.admin.service;  

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fa.plus.admin.domain.CsNoticeManage;
import com.fa.plus.admin.mapper.CsNoticeManageMapper;
import com.fa.plus.common.FileManager;


@Service
public class CsNoticeServiceImpl implements CsNoticeService{
	@Autowired
	private CsNoticeManageMapper mapper;

	@Autowired
	private FileManager fileManager;


	@Override
	public void insertNotice(CsNoticeManage dto, String pathname) throws Exception {
		try {
			long seq = mapper.noticeSeq();
			dto.setNum(seq);
			
			mapper.insertNotice(dto);
			
			if(!dto.getSelectFile().isEmpty()) {
				for(MultipartFile mf : dto.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if(saveFilename == null) {
						continue;
					}
					String originalFilename = mf.getOriginalFilename();
					long fileSize = mf.getSize();
					
					dto.setOriginalFilename(originalFilename);
					dto.setSaveFilename(saveFilename);
					dto.setFileSize(fileSize);
					
					mapper.insertNoticeFile(dto);
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
	public List<CsNoticeManage> listNoticeTop() {
		List<CsNoticeManage> list = null;

		try {
			list = mapper.listNoticeTop();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<CsNoticeManage> listNotice(Map<String, Object> map) {
		List<CsNoticeManage> list = null;

		try {
			list = mapper.listNotice(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	
	}


	@Override
	public CsNoticeManage findById(long num) {
		CsNoticeManage dto = null;

		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			mapper.updateHitCount(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public CsNoticeManage findByPrev(Map<String, Object> map) {
		CsNoticeManage dto = null;
		
		try {
			dto=mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public CsNoticeManage findByNext(Map<String, Object> map) {
		CsNoticeManage dto = null;
		
		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateNotice(CsNoticeManage dto, String pathname) throws Exception {
		try {
			mapper.updateNotice(dto);
			
			if(!dto.getSelectFile().isEmpty()) {
				for(MultipartFile mf : dto.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if(saveFilename == null) {
						continue;
					}
					
					String originalFilename = mf.getOriginalFilename();
					long fileSize = mf.getSize();
					
					dto.setOriginalFilename(originalFilename);
					dto.setSaveFilename(saveFilename);
					dto.setFileSize(fileSize);

					mapper.insertNoticeFile(dto);
				}
			}						
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteNotice(long num, String pathname) throws Exception {
		try {
			// 파일 지우기
			List<CsNoticeManage> listFile = listNoticeFile(num);
			if (listFile != null) {
				for (CsNoticeManage dto : listFile) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}

			// 파일 테이블 내용 지우기
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "num");
			map.put("num", num);
			deleteNoticeFile(map);

			// 게시글 지우기
			mapper.deleteNotice(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<CsNoticeManage> listNoticeFile(long num) {
		List<CsNoticeManage> listFile = null;
		
		try {
			listFile = mapper.listNoticeFile(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listFile;
	}

	@Override
	public CsNoticeManage findByFileId(long fileNum) {
		CsNoticeManage dto = null;
		try {
			dto = mapper.findByFileId(fileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void deleteNoticeFile(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteNoticeFile(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	
	

	
}
