package com.fa.plus.domain.site;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Site {
	private	long	siteNum	;
	private	String	siteName	;
	private	String	introduce	;
	private	int	siteLocal	;
	private	String	zip	;
	private	String	addr1	;
	private	String	addr2	;
	private	String	thumbnail	;
	private	MultipartFile	thumbnailFile	;
	private	int	category	;
	private	int	environment	;
	private	int	hitCount	;
	private	String	checkIn	;
	private	String	checkOut	;
	private	long	memberIdx	;
	private	double	avgstar	;
	private	String[] siteOptionList	;
	private	String siteOption	;
	private	int	enabled	;
	
	
	private long fileNum;
	private String fileName;
	private List<MultipartFile> addFiles;
	
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
	public int getSiteLocal() {
		return siteLocal;
	}
	public void setSiteLocal(int siteLocal) {
		this.siteLocal = siteLocal;
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
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getEnvironment() {
		return environment;
	}
	public void setEnvironment(int environment) {
		this.environment = environment;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
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
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
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
