package com.fa.plus.domain.site;

public class Book {
	private	long bookNum;
	private	String startDate;
	private	String endDate;
	private	long bookPrice;
	private	long detailNum;
	private	long listNum;
	
	private String filename;
	private String writeReview;
	private String detailName;
	private String order_date;
	
	
	
	
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getDetailName() {
		return detailName;
	}
	public void setDetailName(String detailName) {
		this.detailName = detailName;
	}
	public String getWriteReview() {
		return writeReview;
	}
	public void setWriteReview(String writeReview) {
		this.writeReview = writeReview;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public long getBookNum() {
		return bookNum;
	}
	public void setBookNum(long bookNum) {
		this.bookNum = bookNum;
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
	public long getBookPrice() {
		return bookPrice;
	}
	public void setBookPrice(long bookPrice) {
		this.bookPrice = bookPrice;
	}
	public long getDetailNum() {
		return detailNum;
	}
	public void setDetailNum(long detailNum) {
		this.detailNum = detailNum;
	}
	public long getListNum() {
		return listNum;
	}
	public void setListNum(long listNum) {
		this.listNum = listNum;
	}
	
	
}
