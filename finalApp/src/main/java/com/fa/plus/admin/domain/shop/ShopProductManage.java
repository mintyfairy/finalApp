package com.fa.plus.admin.domain.shop;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ShopProductManage {
	private long productNum;
	private String productName;
	private int special;
	private int md;
	private int deletion;
	private int price;
	private int discountRate;
	private int savedMoney;
	private int delivery;
	private int productShow;
	private String content;
	private String thumbnail;
	private String reg_date;
	private String updateDate;
	private int starter;
	private MultipartFile thumbnailFile;
	
	private long categoryNum;
	private String categoryName;
	private Long parentNum;
	private String parentName;
	
	private long brandNum;
	private String brandName;
	
	private long fileNum;
	private String filename;
	private List<MultipartFile> addFiles;
	private List<String> listFiles;
	
	private long optionNum;
	private String optionName;
	private Long parent;
	
	private long optionNum2;
	private String optionName2;
	
	private long detailNum;
	private String optionValue;
	private List<Long> detailNums;
	private List<String> optionValues;

	private long detailNum2;
	private String optionValue2;
	private List<Long> detailNums2;
	private List<String> optionValues2;
	
	private long stockNum;
	private int totalStock;

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

	public int getMd() {
		return md;
	}

	public void setMd(int md) {
		this.md = md;
	}

	public int getDeletion() {
		return deletion;
	}

	public void setDeletion(int deletion) {
		this.deletion = deletion;
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

	public int getProductShow() {
		return productShow;
	}

	public void setProductShow(int productShow) {
		this.productShow = productShow;
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

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public int getStarter() {
		return starter;
	}

	public void setStarter(int starter) {
		this.starter = starter;
	}

	public MultipartFile getThumbnailFile() {
		return thumbnailFile;
	}

	public void setThumbnailFile(MultipartFile thumbnailFile) {
		this.thumbnailFile = thumbnailFile;
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

	public List<MultipartFile> getAddFiles() {
		return addFiles;
	}

	public void setAddFiles(List<MultipartFile> addFiles) {
		this.addFiles = addFiles;
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

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public long getOptionNum2() {
		return optionNum2;
	}

	public void setOptionNum2(long optionNum2) {
		this.optionNum2 = optionNum2;
	}

	public String getOptionName2() {
		return optionName2;
	}

	public void setOptionName2(String optionName2) {
		this.optionName2 = optionName2;
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

	public List<Long> getDetailNums() {
		return detailNums;
	}

	public void setDetailNums(List<Long> detailNums) {
		this.detailNums = detailNums;
	}

	public List<String> getOptionValues() {
		return optionValues;
	}

	public void setOptionValues(List<String> optionValues) {
		this.optionValues = optionValues;
	}

	public long getDetailNum2() {
		return detailNum2;
	}

	public void setDetailNum2(long detailNum2) {
		this.detailNum2 = detailNum2;
	}

	public String getOptionValue2() {
		return optionValue2;
	}

	public void setOptionValue2(String optionValue2) {
		this.optionValue2 = optionValue2;
	}

	public List<Long> getDetailNums2() {
		return detailNums2;
	}

	public void setDetailNums2(List<Long> detailNums2) {
		this.detailNums2 = detailNums2;
	}

	public List<String> getOptionValues2() {
		return optionValues2;
	}

	public void setOptionValues2(List<String> optionValues2) {
		this.optionValues2 = optionValues2;
	}

	public int getTotalStock() {
		return totalStock;
	}

	public void setTotalStock(int totalStock) {
		this.totalStock = totalStock;
	}

	public Long getParent() {
		return parent;
	}

	public void setParent(Long parent) {
		this.parent = parent;
	}

	public long getStockNum() {
		return stockNum;
	}

	public void setStockNum(long stockNum) {
		this.stockNum = stockNum;
	}

	public List<String> getListFiles() {
		return listFiles;
	}

	public void setListFiles(List<String> listFiles) {
		this.listFiles = listFiles;
	}
	
	
}
