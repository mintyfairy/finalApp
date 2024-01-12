package com.fa.plus.domain.car;

public class CampingCar {
	private long carNum;
	private String carName;
	private String carSize;
	private String thumbnail;
	private int discountRate;
	private int carMaxNum;
	private int sleepNum;
	private String content;
	private String description;
	private int petOrNot;
	private int carShow;
	
	private String caravanNum;
	private int weekCost;
	private int wkndCost;
	private String carBirth;
	
	private int carReservaionPrice;
	
	// 결제 (예약) 
	private String orderNum;
	private String orderDate;
	private int totMoney;
	private int discount;
	private int payment;
	private int orderState;
	private String start_date;
	private String end_date;
	private int addRider;
		
	private int memberIdx;
	
	private int carImagenum;
	private String imageFilename;
	
	private double score;
	private int reviewCount;
	private int questionCount;
	
	
	
	
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
	public int getCarImagenum() {
		return carImagenum;
	}
	public void setCarImagenum(int carImagenum) {
		this.carImagenum = carImagenum;
	}
	public String getImageFilename() {
		return imageFilename;
	}
	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}
	public int getCarReservaionPrice() {
		return carReservaionPrice;
	}
	public void setCarReservaionPrice(int carReservaionPrice) {
		this.carReservaionPrice = carReservaionPrice;
	}
	
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
	private int powerbank;
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
	public int getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getPetOrNot() {
		return petOrNot;
	}
	public void setPetOrNot(int petOrNot) {
		this.petOrNot = petOrNot;
	}
	public int getCarShow() {
		return carShow;
	}
	public void setCarShow(int carShow) {
		this.carShow = carShow;
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
	public int getPowerbank() {
		return powerbank;
	}
	public void setPowerbank(int powerbank) {
		this.powerbank = powerbank;
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
	
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public int getTotMoney() {
		return totMoney;
	}
	public void setTotMoney(int totMoney) {
		this.totMoney = totMoney;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public int getOrderState() {
		return orderState;
	}
	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public int getAddRider() {
		return addRider;
	}
	public void setAddRider(int addRider) {
		this.addRider = addRider;
	}
	public int getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}

	
	
}
