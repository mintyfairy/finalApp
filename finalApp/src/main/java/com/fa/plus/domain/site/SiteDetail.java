package com.fa.plus.domain.site;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class SiteDetail {
	private	long	detailNum	;
	private	int	siteNum	;
	private	String	detailName	;
	private	int	price	;
	private	String	area	;
	private	String	content	;
	private	String	capacity	;
	private	int	floor	;
	

	private long fileNum;
	private String fileName;
	private List<MultipartFile> addFiles;
	
	private List<String> listFile;

	public long getDetailNum() {
		return detailNum;
	}

	public void setDetailNum(long detailNum) {
		this.detailNum = detailNum;
	}

	public int getSiteNum() {
		return siteNum;
	}

	public void setSiteNum(int siteNum) {
		this.siteNum = siteNum;
	}

	public String getDetailName() {
		return detailName;
	}

	public void setDetailName(String detailName) {
		this.detailName = detailName;
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

	public List<String> getListFile() {
		return listFile;
	}

	public void setListFile(List<String> listFile) {
		this.listFile = listFile;
	}
	
	
}
