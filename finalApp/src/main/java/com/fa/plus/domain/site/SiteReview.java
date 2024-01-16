
package com.fa.plus.domain.site;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class SiteReview {
/**
 BOOKNUM
SUBJECT
CONTENT
memberIdx
SCORE
REG_DATE
ANSWER
detailNum
SITENUM
ENABLED
 */
	private long bookNum;
	private String subject;
	private String content;
	private long memberIdx;
	private double score;
	private String reg_date;
	private String answer;
	private String userName;
	private String adminName;
	private long detailNum;
	private long siteNum;
	private long enabled;
	
	
	private String fileList;
	
	private long SrPICNUM;
	
	private long fileNum;
	private String fileName;
	private List<MultipartFile> selectFile;
	
	private List<String> listFile;

	
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}

	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}

	public String getFileList() {
		return fileList;
	}

	public void setFileList(String fileList) {
		this.fileList = fileList;
	}

	public long getSrPICNUM() {
		return SrPICNUM;
	}

	public void setSrPICNUM(long srPICNUM) {
		SrPICNUM = srPICNUM;
	}

	public long getBookNum() {
		return bookNum;
	}

	public void setBookNum(long bookNum) {
		this.bookNum = bookNum;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public long getMemberIdx() {
		return memberIdx;
	}

	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public long getDetailNum() {
		return detailNum;
	}

	public void setDetailNum(long detailNum) {
		this.detailNum = detailNum;
	}

	public long getSiteNum() {
		return siteNum;
	}

	public void setSiteNum(long siteNum) {
		this.siteNum = siteNum;
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



	public List<String> getListFile() {
		return listFile;
	}

	public void setListFile(List<String> listFile) {
		this.listFile = listFile;
	}
	
	
	
}
