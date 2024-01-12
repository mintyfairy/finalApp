package com.fa.plus.admin.service;  
 
import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.CsNoticeManage;

public interface CsNoticeService {
	
public void insertNotice(CsNoticeManage dto, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<CsNoticeManage> listNoticeTop();
	public List<CsNoticeManage> listNotice(Map<String, Object> map);
	
	public void updateHitCount(long num) throws Exception;
	public CsNoticeManage findById(long num);
	public CsNoticeManage findByPrev(Map<String, Object> map);
	public CsNoticeManage findByNext(Map<String, Object> map);
	
	public void updateNotice(CsNoticeManage dto, String pathname) throws Exception;
	public void deleteNotice(long num, String pathname) throws Exception;
	
	public List<CsNoticeManage> listNoticeFile(long num);
	public CsNoticeManage findByFileId(long fileNum);
	public void deleteNoticeFile(Map<String, Object> map) throws Exception;

}
