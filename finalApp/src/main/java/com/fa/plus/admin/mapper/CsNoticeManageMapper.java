package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.CsNoticeManage;

public interface CsNoticeManageMapper {
	public long noticeSeq();
	public void insertNotice(CsNoticeManage dto) throws SQLException;
	public void updateNotice(CsNoticeManage dto) throws SQLException;
	public void deleteNotice(long num) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<CsNoticeManage> listNoticeTop();
	public List<CsNoticeManage> listNotice(Map<String, Object> map);
	
	public CsNoticeManage findById(long num);
	public void updateHitCount(long num) throws SQLException;
	public CsNoticeManage findByPrev(Map<String, Object> map);
	public CsNoticeManage findByNext(Map<String, Object> map);

	public void insertNoticeFile(CsNoticeManage dto) throws SQLException;
	public List<CsNoticeManage> listNoticeFile(long num);
	public CsNoticeManage findByFileId(long fileNum);
	public void deleteNoticeFile(Map<String, Object> map) throws SQLException;
}
