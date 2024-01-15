package com.fa.plus.domain.site;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Site {
	private	long	siteNum	;
	private	String	siteName	;
	private	String	introduce	;
	private	long	siteLocal	;
	private	String	zip	;
	private	String	addr1	;
	private	String	addr2	;
	private	String	thumbnail	;
	private	MultipartFile	thumbnailFile	;
	private	long	category	;
	private	long	environment	;
	private	long	hitCount	;
	private	String	checkIn	;
	private	String	checkOut	;
	private	long	memberIdx	;
	private	double	avgstar	;
	private	String[] siteOptionList	;
	private	String siteOption	;
	private	long	enabled	;
	
	private	long	spicNum	;
	
	private long fileNum;
	private String fileName;
	private List<MultipartFile> addFiles;
	
	
	
	public long getSpicNum() {
		return spicNum;
	}
	public void setSpicNum(long spicNum) {
		this.spicNum = spicNum;
	}
	public long getSiteNum() {
		return siteNum;
	}
	public void setSiteNum(long siteNum) {
		this.siteNum = siteNum;
	}
	public String getSiteName() {
		return siteName;
	}
	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public MultipartFile getThumbnailFile() {
		return thumbnailFile;
	}
	public void setThumbnailFile(MultipartFile thumbnailFile) {
		this.thumbnailFile = thumbnailFile;
	}
	
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}
	
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	public double getAvgstar() {
		return avgstar;
	}
	public void setAvgstar(double avgstar) {
		this.avgstar = avgstar;
	}
	public String[] getSiteOptionList() {
		return siteOptionList;
	}
	public void setSiteOptionList(String[] siteOptionList) {
		this.siteOptionList = siteOptionList;
	}
	public String getSiteOption() {
		return siteOption;
	}
	public void setSiteOption(String siteOption) {
		this.siteOption = siteOption;
	}
	
	public long getSiteLocal() {
		return siteLocal;
	}
	public void setSiteLocal(long siteLocal) {
		this.siteLocal = siteLocal;
	}
	public long getCategory() {
		return category;
	}
	public void setCategory(long category) {
		this.category = category;
	}
	public long getEnvironment() {
		return environment;
	}
	public void setEnvironment(long environment) {
		this.environment = environment;
	}
	public long getHitCount() {
		return hitCount;
	}
	public void setHitCount(long hitCount) {
		this.hitCount = hitCount;
	}
	public long getEnabled() {
		return enabled;
	}
	public void setEnabled(long enabled) {
		this.enabled = enabled;
	}
	public long getFileNum() {
		return fileNum;
	}
	public void setFileNum(long fileNum) {
		this.fileNum = fileNum;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public List<MultipartFile> getAddFiles() {
		return addFiles;
	}
	public void setAddFiles(List<MultipartFile> addFiles) {
		this.addFiles = addFiles;
	}
	


	
}
