package com.fa.plus.domain.site;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class SiteDetail {
	private	long	DETAILNUM	;
	private	int	SITENUM	;
	private	String	DETAILNAME	;
	private	int	PRICE	;
	private	String	AREA	;
	private	String	CONTENT	;
	private	String	CAPACITY	;
	private	int	floor	;
	

	private long fileNum;
	private String filename;
	private List<MultipartFile> addFiles;
	
	
	public long getDETAILNUM() {
		return DETAILNUM;
	}
	public void setDETAILNUM(long dETAILNUM) {
		DETAILNUM = dETAILNUM;
	}
	public int getSITENUM() {
		return SITENUM;
	}
	public void setSITENUM(int sITENUM) {
		SITENUM = sITENUM;
	}
	public String getDETAILNAME() {
		return DETAILNAME;
	}
	public void setDETAILNAME(String dETAILNAME) {
		DETAILNAME = dETAILNAME;
	}
	public int getPRICE() {
		return PRICE;
	}
	public void setPRICE(int pRICE) {
		PRICE = pRICE;
	}
	public String getAREA() {
		return AREA;
	}
	public void setAREA(String aREA) {
		AREA = aREA;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public String getCAPACITY() {
		return CAPACITY;
	}
	public void setCAPACITY(String cAPACITY) {
		CAPACITY = cAPACITY;
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
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public List<MultipartFile> getAddFiles() {
		return addFiles;
	}
	public void setAddFiles(List<MultipartFile> addFiles) {
		this.addFiles = addFiles;
	}
	
	
	
}
