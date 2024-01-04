package com.fa.plus.admin.service.shop;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.shop.ShopNoticeManage;

public interface ShopNoticeManageService {
public void insertNotice(ShopNoticeManage dto, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<ShopNoticeManage> listNoticeTop();
	public List<ShopNoticeManage> listNotice(Map<String, Object> map);
	
	public void updateHitCount(long num) throws Exception;
	public ShopNoticeManage findById(long num);
	public ShopNoticeManage findByPrev(Map<String, Object> map);
	public ShopNoticeManage findByNext(Map<String, Object> map);
	
	public void updateNotice(ShopNoticeManage dto, String pathname) throws Exception;
	public void deleteNotice(long num, String pathname) throws Exception;
	
	public List<ShopNoticeManage> listNoticeFile(long num);
	public ShopNoticeManage findByFileId(long fileNum);
	public void deleteNoticeFile(Map<String, Object> map) throws Exception;

}
