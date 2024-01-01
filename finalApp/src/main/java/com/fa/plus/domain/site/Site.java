package com.fa.plus.domain.site;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Site {
	private	long	SITENUM	;
	private	String	SITENAME	;
	private	String	INTODUCE	;
	private	int	SITELOCAL	;
	private	String	ZIP	;
	private	String	ADDR1	;
	private	String	ADDR2	;
	private	String	THUMBNAIL	;
	private	MultipartFile	THUMBNAILFILE	;
	private	int	CATEGORY	;
	private	int	ENVIRONMENT	;
	private	int	HITCOUNT	;
	private	String	CHECKIN	;
	private	String	CHKOUT	;
	private	int	MEMBERIDX	;
	private	double	AVGSTAR	;
	private	String[] SITEOPTION	;
	private	int	ENABLED	;
	
	
	private long fileNum;
	private String filename;
	private List<MultipartFile> addFiles;
	

	public void setTHUMBNAIL(String tHUMBNAIL) {
		THUMBNAIL = tHUMBNAIL;
	}
	public String getTHUMBNAIL() {
		return THUMBNAIL ;
	}

	public long getSITENUM() {
		return SITENUM;
	}
	public void setSITENUM(long sITENUM) {
		SITENUM = sITENUM;
	}
	
	public MultipartFile getTHUMBNAILFILE() {
		return THUMBNAILFILE;
	}
	public void setTHUMBNAILFILE(MultipartFile tHUMBNAILFILE) {
		THUMBNAILFILE = tHUMBNAILFILE;
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
	public String getADDR1() {
		return ADDR1;
	}
	public void setADDR1(String ADDR1) {
		this.ADDR1 = ADDR1;
	}
	public String getADDR2() {
		return ADDR2;
	}
	public void setADDR2(String ADDR2) {
		this.ADDR2 = ADDR2;
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
