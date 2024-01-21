package com.fa.plus.domain.site;

public class BookList {
	private	long listNum;
	private	String order_date;
	private	long memberIdx;
	private	long totalPrice;
	private int reviewWrite; // 리뷰 유무
	
	
	
	
	
	public long getListNum() {
		return listNum;
	}
	public void setListNum(long listNum) {
		this.listNum = listNum;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	public long getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(long totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getReviewWrite() {
		return reviewWrite;
	}
	public void setReviewWrite(int reviewWrite) {
		this.reviewWrite = reviewWrite;
	}
	
	
	
}
