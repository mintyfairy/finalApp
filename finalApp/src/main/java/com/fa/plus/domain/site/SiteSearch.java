package com.fa.plus.domain.site;

public class SiteSearch {
	
	private String startDate;
	private String endDate;
	private String siteKwd;
	private long siteLocal;
	//서울,인천,경기,강원,대전,세종,충죽,충남,대구,울산,경북,경남,전북,전남,제주

	private long siteEnvironment;
	//산,강,바다,도심,계곡,호수,평야,기타
	private long siteCategory;
	//오토캠핑,글램핑,카라반,방갈로,차박

	private	String[] siteOption	;
	private long minFee;
	private long maxFee;
	
	
	
	
	
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
	public long getSiteLocal() {
		return siteLocal;
	}
	public void setSiteLocal(long siteLocal) {
		this.siteLocal = siteLocal;
	}
	public long getSiteEnvironment() {
		return siteEnvironment;
	}
	public void setSiteEnvironment(long siteEnvironment) {
		this.siteEnvironment = siteEnvironment;
	}
	public long getSiteCategory() {
		return siteCategory;
	}
	public void setSiteCategory(long siteCategory) {
		this.siteCategory = siteCategory;
	}
	public String[] getSiteOption() {
		return siteOption;
	}
	public void setSiteOption(String[] siteOption) {
		this.siteOption = siteOption;
	}
	public long getMinFee() {
		return minFee;
	}
	public void setMinFee(long minFee) {
		this.minFee = minFee;
	}
	public long getMaxFee() {
		return maxFee;
	}
	public void setMaxFee(long maxFee) {
		this.maxFee = maxFee;
	}
	
	
	
}
