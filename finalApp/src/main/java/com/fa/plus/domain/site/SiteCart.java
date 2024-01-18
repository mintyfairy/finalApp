package com.fa.plus.domain.site;

/*
 			memberIdx	NUMBER 		카트목록의 주인
			detailNum	NUMBER		이 항목의 방번호
			STARTDATE	DATE		예약시작일
			ENDDATE		DATE		예약종료일
			REG_DATE	DATE		카트생성일 : 일정시간이 지난 카트를 삭제하려할때 사용될것

 */
public class SiteCart {
	private	long	memberIdx	;
	private	long	detailNum	;
	
	private	String	thumbnail	;
	private	String	startDate	;
	private	String	endDate	;
	private	String	reg_date	;
	//여기까지는 카트의 정보 이하는 리스트 불러올떄 join할 sitedetail의 정보
	
	private	String	siteName	;
	private	String	detailName	;
	private	String	price	;
	private	String	content	;
	private	String	capacity	;
	private	String	floor	;
	
	//
	
	private int periodPrice;

	
	
	
	
	public String getSiteName() {
		return siteName;
	}

	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}

	public long getMemberIdx() {
		return memberIdx;
	}

	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}

	public long getDetailNum() {
		return detailNum;
	}

	public void setDetailNum(long detailNum) {
		this.detailNum = detailNum;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
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

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getDetailName() {
		return detailName;
	}

	public void setDetailName(String detailName) {
		this.detailName = detailName;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
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

	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}

	public int getPeriodPrice() {
		return periodPrice;
	}

	public void setPeriodPrice(int periodPrice) {
		this.periodPrice = periodPrice;
	}
	
	
	
	
	
	
	
}
