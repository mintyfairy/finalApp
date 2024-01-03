package com.fa.plus.admin.service.shop;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.shop.ShopNoticeManage;
import com.fa.plus.admin.mapper.NoticeManageMapper;
import com.fa.plus.common.FileManager;


@Service
public class ShopNoticeManageServiceImpl implements ShopNoticeManageService{
	@Autowired
	private NoticeManageMapper mapper;

	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertNotice(ShopNoticeManage dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ShopNoticeManage> listNoticeTop() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ShopNoticeManage> listNotice(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ShopNoticeManage findById(long num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ShopNoticeManage findByPrev(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ShopNoticeManage findByNext(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateNotice(ShopNoticeManage dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteNotice(long num, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ShopNoticeManage> listNoticeFile(long num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ShopNoticeManage findByFileId(long fileNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteNoticeFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}


}
