package com.fa.plus.domain.site;

public class SiteSearch {
	
	private String startDate;
	private String endDate;
	private String siteKwd;
	private String siteLocal;
	//서울,인천,경기,강원,대전,세종,충죽,충남,대구,울산,경북,경남,전북,전남,제주

	private String siteEnvironment;
	//산,강,바다,도심,계곡,호수,평야,기타
	private String siteCategory;
	//오토캠핑,글램핑,카라반,방갈로,차박

	private	int[] siteOption	;
	private	String siteOptionList	;
	private String minFee;
	private String maxFee;
	private String size;
	private String offset;
	
	
	
	
	
	public String getSiteOptionList() {
		return siteOptionList;
	}
	public void setSiteOptionList(String siteOptionList) {
		this.siteOptionList = siteOptionList;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getOffset() {
		return offset;
	}
	public void setOffset(String offset) {
		this.offset = offset;
	}
	public String getSiteKwd() {
		return siteKwd;
	}
	public void setSiteKwd(String siteKwd) {
		this.siteKwd = siteKwd;
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
	
	public int[] getSiteOption() {
		return siteOption;
	}
	public void setSiteOption(int[] siteOption) {
		this.siteOption = siteOption;
	}
	public String getSiteLocal() {
		return siteLocal;
	}
	public void setSiteLocal(String siteLocal) {
		this.siteLocal = siteLocal;
	}
	public String getSiteEnvironment() {
		return siteEnvironment;
	}
	public void setSiteEnvironment(String siteEnvironment) {
		this.siteEnvironment = siteEnvironment;
	}
	public String getSiteCategory() {
		return siteCategory;
	}
	public void setSiteCategory(String siteCategory) {
		this.siteCategory = siteCategory;
	}
	public String getMinFee() {
		return minFee;
	}
	public void setMinFee(String minFee) {
		this.minFee = minFee;
	}
	public String getMaxFee() {
		return maxFee;
	}
	public void setMaxFee(String maxFee) {
		this.maxFee = maxFee;
	}
	
	
	
	
}
