package com.fa.plus.domain.site;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class SiteDetail {
	private	long	detailNum	;
	private	long	siteNum	;
	private	String	detailName	;
	private	long	price	;
	private	String	area	;
	private	String	content	;
	private	String	capacity	;
	private	long	floor	;
	private	String	floorString	;
	

	
	private double star;
	private long SdPicNum;

	private long fileNum;
	private String fileName;
	private List<MultipartFile> addFiles;
	
	private List<String> listFile;
	private List<SiteReview> roomsiteReviewList;


	
	
	public List<SiteReview> getRoomsiteReviewList() {
		return roomsiteReviewList;
	}

	public void setRoomsiteReviewList(List<SiteReview> roomsiteReviewList) {
		this.roomsiteReviewList = roomsiteReviewList;
	}

	public double getStar() {
		return star;
	}

	public void setStar(double star) {
		this.star = star;
	}

	public String getFloorString() {
		return floorString;
	}

	public void setFloorString(String floorString) {
		this.floorString = floorString;
	}

	public long getSdPicNum() {
		return SdPicNum;
	}

	public void setSdPicNum(long sdPicNum) {
		SdPicNum = sdPicNum;
	}

	public long getDetailNum() {
		return detailNum;
	}

	public void setDetailNum(long detailNum) {
		this.detailNum = detailNum;
	}


	public String getDetailName() {
		return detailName;
	}

	public void setDetailName(String detailName) {
		this.detailName = detailName;
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


	public long getSiteNum() {
		return siteNum;
	}

	public void setSiteNum(long siteNum) {
		this.siteNum = siteNum;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public long getFloor() {
		return floor;
	}

	public void setFloor(long floor) {
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
