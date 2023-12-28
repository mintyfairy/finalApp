package com.fa.plus.domain.site;

import org.springframework.web.multipart.MultipartFile;

public class SiteDetail {
	private	int	DETAILNUM	;
	private	int	SITENUM	;
	private	String	DETAILNAME	;
	private	int	PRICE	;
	private	String	AREA	;
	private	String	CONTENT	;
	private	String	CAPACITY	;
	private	int	floor	;
	
	private String saveFilename;
	private String originalFilename;
	private MultipartFile selectFile;
	public int getDETAILNUM() {
		return DETAILNUM;
	}
	public void setDETAILNUM(int dETAILNUM) {
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
	public String getSaveFilename() {
		return saveFilename;
	}
	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}
	public String getOriginalFilename() {
		return originalFilename;
	}
	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}
	public MultipartFile getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	} 
	
	
}
