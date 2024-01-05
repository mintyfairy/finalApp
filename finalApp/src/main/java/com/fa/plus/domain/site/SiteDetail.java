package com.fa.plus.domain.site;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class SiteDetail {
	private	long	detailnum	;
	private	int	sitenum	;
	private	String	detailname	;
	private	int	price	;
	private	String	area	;
	private	String	content	;
	private	String	capacity	;
	private	int	floor	;
	

	private long fileNum;
	private String fileName;
	private List<MultipartFile> addFiles;
	
	
	public long getDetailnum() {
		return detailnum;
	}
	public void setDetailnum(long detailnum) {
		this.detailnum = detailnum;
	}
	public int getSitenum() {
		return sitenum;
	}
	public void setSitenum(int sitenum) {
		this.sitenum = sitenum;
	}
	public String getDetailname() {
		return detailname;
	}
	public void setDetailname(String detailname) {
		this.detailname = detailname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	public int getFloor() {
		return floor;
	}
	public void setFloor(int floor) {
		this.floor = floor;
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
