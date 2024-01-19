package com.fa.plus.domain.car;

import org.springframework.web.multipart.MultipartFile;

public class CarMyPage {
	// license
	private long memberIdx;
	private String licenseDate;
	private String licenseImage;
	
	private MultipartFile selectFile;
	
	private String birth;
	private String userId;
	private String userName;
	
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	public String getLicenseDate() {
		return licenseDate;
	}
	public void setLicenseDate(String licenseDate) {
		this.licenseDate = licenseDate;
	}
	public String getLicenseImage() {
		return licenseImage;
	}
	public void setLicenseImage(String licenseImage) {
		this.licenseImage = licenseImage;
	}
	public MultipartFile getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
}
