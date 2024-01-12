package com.fa.plus.domain.site;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Site {
	private	long	sitenum	;
	private	String	sitename	;
	private	String	introduce	;
	private	int	sitelocal	;
	private	String	zip	;
	private	String	addr1	;
	private	String	addr2	;
	private	String	thumbnail	;
	private	MultipartFile	thumbnailfile	;
	private	int	category	;
	private	int	environment	;
	private	int	hitcount	;
	private	String	checkin	;
	private	String	checkout	;
	private	int	memberidx	;
	private	double	avgstar	;
	private	String[] siteoptionList	;
	private	String siteoption	;
	private	int	enabled	;
	
	
	private long fileNum;
	private String fileName;
	private List<MultipartFile> addFiles;
	public long getSitenum() {
		return sitenum;
	}
	public void setSitenum(long sitenum) {
		this.sitenum = sitenum;
	}
	public String getSitename() {
		return sitename;
	}
	public void setSitename(String sitename) {
		this.sitename = sitename;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public int getSitelocal() {
		return sitelocal;
	}
	public void setSitelocal(int sitelocal) {
		this.sitelocal = sitelocal;
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
	public MultipartFile getThumbnailfile() {
		return thumbnailfile;
	}
	public void setThumbnailfile(MultipartFile thumbnailfile) {
		this.thumbnailfile = thumbnailfile;
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
	public int getHitcount() {
		return hitcount;
	}
	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	int getMemberidx() {
		return memberidx;
	}
	public void setMemberidx(int memberidx) {
		this.memberidx = memberidx;
	}
	public double getAvgstar() {
		return avgstar;
	}
	public void setAvgstar(double avgstar) {
		this.avgstar = avgstar;
	}
	public String[] getSiteoptionList() {
		return siteoptionList;
	}
	public void setSiteoptionList(String[] siteoptionList) {
		this.siteoptionList = siteoptionList;
	}
	public String getSiteoption() {
		return siteoption;
	}
	public void setSiteoption(String siteoption) {
		this.siteoption = siteoption;
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
