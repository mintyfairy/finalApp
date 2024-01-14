package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.site.Site;
import com.fa.plus.domain.site.SiteDetail;
import com.fa.plus.domain.site.SiteSearch;

@Mapper
public interface SiteAdminMapper {
	public long SiteSeq();
	public void insertSite(Site dto) throws SQLException;
	public void insertSiteFile(Site dto) throws SQLException;
	
	public long RoomSeq();
	public void insertRoom(SiteDetail dto) throws SQLException;
	public void insertRoomFile(SiteDetail dto) throws SQLException;
	
	public int dataCountRoom(Map<String, Object> map);
	public int dataCountSite(Map<String, Object> map);
	public int searchCountSite(SiteSearch dto);
	
	public List<Site> listAdvertiseSite();

	public List<Site> listSite(Map<String, Object> map);
	public List<Site> listSearchSite(SiteSearch map);
	public List<SiteDetail> listRoom(Map<String, Object> map);
	public List<SiteDetail> listSearchRoom(SiteSearch map);
	
	public void updateSite(Site dto) throws SQLException;
	public void deleteSite(long SiteNum) throws SQLException;
	public void deleteSiteFile(long fileNum) throws SQLException;
	
	public Site findByIdSite(long SiteNum) throws SQLException;
	public SiteDetail findByIdRoom(long detailNum) throws SQLException;
	
	
	public void updateRoom(SiteDetail dto) throws SQLException;
	public void deleteRoom(long detailNum) throws SQLException;
	public void deleteRoomFile(long SdPicNum) throws SQLException;
	public List<Site> listSiteFile(long siteNum);
	public List<SiteDetail> listRoomFile(long detailNum);
	
}
