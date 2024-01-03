package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.shop.ShopNoticeManage;

public interface NoticeManageMapper {
	public long noticeSeq();
	public void insertNotice(ShopNoticeManage dto) throws SQLException;
	public void updateNotice(ShopNoticeManage dto) throws SQLException;
	public void deleteNotice(long num) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<ShopNoticeManage> listNoticeTop();
	public List<ShopNoticeManage> listNotice(Map<String, Object> map);
	
	public ShopNoticeManage findById(long num);
	public void updateHitCount(long num) throws SQLException;
	public ShopNoticeManage findByPrev(Map<String, Object> map);
	public ShopNoticeManage findByNext(Map<String, Object> map);

	public void insertNoticeFile(ShopNoticeManage dto) throws SQLException;
	public List<ShopNoticeManage> listNoticeFile(long num);
	public ShopNoticeManage findByFileId(long fileNum);
	public void deleteNoticeFile(Map<String, Object> map) throws SQLException;
	
}
