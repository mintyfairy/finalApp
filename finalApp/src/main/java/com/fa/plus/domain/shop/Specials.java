package com.fa.plus.domain.shop;

public class Specials {
	private long specialsNum;
	private int special;
	private String subject;
	private String content;
	private String startDate;
	private String endDate;
	private int productCount;
	
	private String imageFilename;

	public long getSpecialsNum() {
		return specialsNum;
	}

	public void setSpecialsNum(long specialsNum) {
		this.specialsNum = specialsNum;
	}

	public int getSpecial() {
		return special;
	}

	public void setSpecial(int special) {
		this.special = special;
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

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}

	public String getImageFilename() {
		return imageFilename;
	}

	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}
}
