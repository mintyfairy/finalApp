package com.fa.plus.domain.site;

import org.springframework.web.multipart.MultipartFile;

public class Site {
	private	int	SITENUM	;
	private	String	SITENAME	;
	private	String	INTODUCE	;
	private	int	SITELOCAL	;
	private	String	ZIP	;
	private	String	addr1	;
	private	String	addr2	;
	private	String	THUMBNAIL	;
	private	int	CATEGORY	;
	private	int	ENVIRONMENT	;
	private	int	HITCOUNT	;
	private	String	CHECKIN	;
	private	String	CHKOUT	;
	private	int	MEMBERIDX	;
	private	double	AVGSTAR	;
	private	String[] SITEOPTION	;
	private	int	ENABLED	;
	
	
	private String saveFilename;
	private String originalFilename;
	private MultipartFile selectFile; 
	
	public int getSITENUM() {
		return SITENUM;
	}
	public void setSITENUM(int sITENUM) {
		SITENUM = sITENUM;
	}
	public String getSITENAME() {
		return SITENAME;
	}
	public void setSITENAME(String sITENAME) {
		SITENAME = sITENAME;
	}
	public String getINTODUCE() {
		return INTODUCE;
	}
	public void setINTODUCE(String iNTODUCE) {
		INTODUCE = iNTODUCE;
	}
	public int getSITELOCAL() {
		return SITELOCAL;
	}
	public void setSITELOCAL(int sITELOCAL) {
		SITELOCAL = sITELOCAL;
	}
	public String getZIP() {
		return ZIP;
	}
	public void setZIP(String zIP) {
		ZIP = zIP;
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
	public String getTHUMBNAIL() {
		return THUMBNAIL;
	}
	public void setTHUMBNAIL(String tHUMBNAIL) {
		THUMBNAIL = tHUMBNAIL;
	}
	public int getCATEGORY() {
		return CATEGORY;
	}
	public void setCATEGORY(int cATEGORY) {
		CATEGORY = cATEGORY;
	}
	public int getENVIRONMENT() {
		return ENVIRONMENT;
	}
	public void setENVIRONMENT(int eNVIRONMENT) {
		ENVIRONMENT = eNVIRONMENT;
	}
	public int getHITCOUNT() {
		return HITCOUNT;
	}
	public void setHITCOUNT(int hITCOUNT) {
		HITCOUNT = hITCOUNT;
	}
	public String getCHECKIN() {
		return CHECKIN;
	}
	public void setCHECKIN(String cHECKIN) {
		CHECKIN = cHECKIN;
	}
	public String getCHKOUT() {
		return CHKOUT;
	}
	public void setCHKOUT(String cHKOUT) {
		CHKOUT = cHKOUT;
	}
	public int getMEMBERIDX() {
		return MEMBERIDX;
	}
	public void setMEMBERIDX(int mEMBERIDX) {
		MEMBERIDX = mEMBERIDX;
	}
	public double getAVGSTAR() {
		return AVGSTAR;
	}
	public void setAVGSTAR(double aVGSTAR) {
		AVGSTAR = aVGSTAR;
	}

	public int getENABLED() {
		return ENABLED;
	}
	public void setENABLED(int eNABLED) {
		ENABLED = eNABLED;
	}
	public String[] getSITEOPTION() {
		return SITEOPTION;
	}
	public void setSITEOPTION(String[] sITEOPTION) {
		SITEOPTION = sITEOPTION;
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
