package com.fa.plus.domain.shop;

public class Product {
	private long productNum; //
	private String productName; // 
	private int special; // 
	private int price; // 
	private int discountRate; //
	private int salePrice;
	private int savedMoney; // 
	private int delivery; // 
	private String content; // 
	private String thumbnail; // 
	private int productShow; // 
	private String reg_date; // 
	private String updateDate; //
	private String md;
	private String starter;
	private String deletion;
	private String orderValue;
	
	private String orderName;
	private String orderEmail;
	private String orderTel;
	
	private String startDate;
	private String endDate;
	private int showSpecial;
	private int saleCount;
	
	private long categoryNum; //
	private String categoryName;
	private Long parentNum;
	private int level;
	
	private long brandNum; //
	private String brandName;
	
	
	private long fileNum;
	private String filename;
	
	
	private double score;
	private int reviewCount;
	private int questionCount;
	
	private long optionNum;
	private String optionName;
	private long detailNum;
	private String optionValue;
	
	public long getProductNum() {
		return productNum;
	}
	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getSpecial() {
		return special;
	}
	public void setSpecial(int special) {
		this.special = special;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}
	public int getSavedMoney() {
		return savedMoney;
	}
	public void setSavedMoney(int savedMoney) {
		this.savedMoney = savedMoney;
	}
	public int getDelivery() {
		return delivery;
	}
	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public int getProductShow() {
		return productShow;
	}
	public void setProductShow(int productShow) {
		this.productShow = productShow;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getMd() {
		return md;
	}
	public void setMd(String md) {
		this.md = md;
	}
	public String getStarter() {
		return starter;
	}
	public void setStarter(String starter) {
		this.starter = starter;
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
	public int getShowSpecial() {
		return showSpecial;
	}
	public void setShowSpecial(int showSpecial) {
		this.showSpecial = showSpecial;
	}
	public int getSaleCount() {
		return saleCount;
	}
	public void setSaleCount(int saleCount) {
		this.saleCount = saleCount;
	}
	public long getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(long categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public Long getParentNum() {
		return parentNum;
	}
	public void setParentNum(Long parentNum) {
		this.parentNum = parentNum;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public long getBrandNum() {
		return brandNum;
	}
	public void setBrandNum(long brandNum) {
		this.brandNum = brandNum;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
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
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public int getQuestionCount() {
		return questionCount;
	}
	public void setQuestionCount(int questionCount) {
		this.questionCount = questionCount;
	}
	public long getOptionNum() {
		return optionNum;
	}
	public void setOptionNum(long optionNum) {
		this.optionNum = optionNum;
	}
	public String getOptionName() {
		return optionName;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	public long getDetailNum() {
		return detailNum;
	}
	public void setDetailNum(long detailNum) {
		this.detailNum = detailNum;
	}
	public String getOptionValue() {
		return optionValue;
	}
	public void setOptionValue(String optionValue) {
		this.optionValue = optionValue;
	}
	public String getDeletion() {
		return deletion;
	}
	public void setDeletion(String deletion) {
		this.deletion = deletion;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	public String getOrderValue() {
		return orderValue;
	}
	public void setOrderValue(String orderValue) {
		this.orderValue = orderValue;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderEmail() {
		return orderEmail;
	}
	public void setOrderEmail(String orderEmail) {
		this.orderEmail = orderEmail;
	}
	public String getOrderTel() {
		return orderTel;
	}
	public void setOrderTel(String orderTel) {
		this.orderTel = orderTel;
	}
}
