package com.fa.plus.admin.domain.car;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class CampingCar { // 관리자 화면에서 상품 등록 
	// campingCar
	private long carNum;
	private String carName;
	private String carSize;
	private String thumbnail;
	private String description;
	private int discountRate; 
	private int carShow;
	private String reg_date;
	private String rev_date;
	private int carMaxNum;
	private int sleepNum;
	private String content; // CLOB
	private int petOrNot;
	private MultipartFile thumbnailFile;
	
	// addImageFile : 추가 이미지 파일
	private long carImagenum;
	private String imageFilename;
	private List<MultipartFile> addFiles;
	
	// carDetail
	private String caravanNum;
	private int weekCost;
	private int wkndCost;
	private String carBirth;
	
	// carOption
	private int toilet;
	private int shower;
	private int bed;
	private int sink;
	private int microwave;
	private int frige;
	private int waterHeater;
	private int desk;
	private int tv;
	private int airCondition;
	private int heater;
	private int powerBank;
	private int induction;
	private int gasStove;
	
	
	public long getCarNum() {
		return carNum;
	}
	public void setCarNum(long carNum) {
		this.carNum = carNum;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getCarSize() {
		return carSize;
	}
	public void setCarSize(String carSize) {
		this.carSize = carSize;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}
	public int getCarShow() {
		return carShow;
	}
	public void setCarShow(int carShow) {
		this.carShow = carShow;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getRev_date() {
		return rev_date;
	}
	public void setRev_date(String rev_date) {
		this.rev_date = rev_date;
	}
	public int getCarMaxNum() {
		return carMaxNum;
	}
	public void setCarMaxNum(int carMaxNum) {
		this.carMaxNum = carMaxNum;
	}
	public int getSleepNum() {
		return sleepNum;
	}
	public void setSleepNum(int sleepNum) {
		this.sleepNum = sleepNum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPetOrNot() {
		return petOrNot;
	}
	public void setPetOrNot(int petOrNot) {
		this.petOrNot = petOrNot;
	}
	public MultipartFile getThumbnailFile() {
		return thumbnailFile;
	}
	public void setThumbnailFile(MultipartFile thumbnailFile) {
		this.thumbnailFile = thumbnailFile;
	}
	public long getCarImagenum() {
		return carImagenum;
	}
	public void setCarImagenum(long carImagenum) {
		this.carImagenum = carImagenum;
	}
	public String getImageFilename() {
		return imageFilename;
	}
	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}
	public List<MultipartFile> getAddFiles() {
		return addFiles;
	}
	public void setAddFiles(List<MultipartFile> addFiles) {
		this.addFiles = addFiles;
	}
	public String getCaravanNum() {
		return caravanNum;
	}
	public void setCaravanNum(String caravanNum) {
		this.caravanNum = caravanNum;
	}
	public int getWeekCost() {
		return weekCost;
	}
	public void setWeekCost(int weekCost) {
		this.weekCost = weekCost;
	}
	public int getWkndCost() {
		return wkndCost;
	}
	public void setWkndCost(int wkndCost) {
		this.wkndCost = wkndCost;
	}
	public String getCarBirth() {
		return carBirth;
	}
	public void setCarBirth(String carBirth) {
		this.carBirth = carBirth;
	}
	public int getToilet() {
		return toilet;
	}
	public void setToilet(int toilet) {
		this.toilet = toilet;
	}
	public int getShower() {
		return shower;
	}
	public void setShower(int shower) {
		this.shower = shower;
	}
	public int getBed() {
		return bed;
	}
	public void setBed(int bed) {
		this.bed = bed;
	}
	public int getSink() {
		return sink;
	}
	public void setSink(int sink) {
		this.sink = sink;
	}
	public int getMicrowave() {
		return microwave;
	}
	public void setMicrowave(int microwave) {
		this.microwave = microwave;
	}
	public int getFrige() {
		return frige;
	}
	public void setFrige(int frige) {
		this.frige = frige;
	}
	public int getWaterHeater() {
		return waterHeater;
	}
	public void setWaterHeater(int waterHeater) {
		this.waterHeater = waterHeater;
	}
	public int getDesk() {
		return desk;
	}
	public void setDesk(int desk) {
		this.desk = desk;
	}
	public int getTv() {
		return tv;
	}
	public void setTv(int tv) {
		this.tv = tv;
	}
	public int getAirCondition() {
		return airCondition;
	}
	public void setAirCondition(int airCondition) {
		this.airCondition = airCondition;
	}
	public int getHeater() {
		return heater;
	}
	public void setHeater(int heater) {
		this.heater = heater;
	}
	public int getPowerBank() {
		return powerBank;
	}
	public void setPowerBank(int powerBank) {
		this.powerBank = powerBank;
	}
	public int getInduction() {
		return induction;
	}
	public void setInduction(int induction) {
		this.induction = induction;
	}
	public int getGasStove() {
		return gasStove;
	}
	public void setGasStove(int gasStove) {
		this.gasStove = gasStove;
	}
	

	
	
	
}
