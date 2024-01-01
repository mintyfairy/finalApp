package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.site.Site;
import com.fa.plus.domain.site.SiteDetail;


public interface CampAdminService {
	public void insertSite(Site dto, String pathname) throws Exception;
	public void updateSite(Site dto, String pathname) throws Exception;
	public void deleteSite(long SiteNum, String pathname) throws Exception;
	public void deleteSiteFile(long fileNum, String pathname) throws Exception;
	
	public void insertRoom(SiteDetail dto, String pathname) throws Exception;
	public void updateRoom(SiteDetail dto, String pathname) throws Exception;
	public void deleteRoom(long DetailNum, String pathname) throws Exception;
	public void deleteRoomFile(long SdPicNum, String pathname) throws Exception;
	
	public int dataCountSite(Map<String, Object> map);
	public int dataCountRoom(Map<String, Object> map);
	
	
	public List<Site> listSite(Map<String, Object> map);
	public List<SiteDetail> listRoom(Map<String, Object> map);
	
	
}
