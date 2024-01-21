package com.fa.plus.domain.car;

public class CarReservation {
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
	
	private long memberIdx;
	private String userId;
	private String userName;
	private String tel;
	
	private int fee;

	// 결제 내역 정보
	private String payMethod;
	private String cardName;
	private String authNumber;
	private String authDate;
	
	// 운전자 정보
	private String birth;
	private String licenseDate;
	private String licenseImage;
	
	// 동승운전자 정보
	private String addBirth;
	private String addRegist;
	private String addLicenseImage;
	private String addRiderName;
	private String addRiderTel;
	
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
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	public String getAuthNumber() {
		return authNumber;
	}
	public void setAuthNumber(String authNumber) {
		this.authNumber = authNumber;
	}
	public String getAuthDate() {
		return authDate;
	}
	public void setAuthDate(String authDate) {
		this.authDate = authDate;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getLicenseDate() {
		return licenseDate;
	}
	public void setLicenseDate(String licenseDate) {
		this.licenseDate = licenseDate;
	}
	public String getLicenseImage() {
		return licenseImage;
	}
	public void setLicenseImage(String licenseImage) {
		this.licenseImage = licenseImage;
	}
	public String getAddBirth() {
		return addBirth;
	}
	public void setAddBirth(String addBirth) {
		this.addBirth = addBirth;
	}
	public String getAddRegist() {
		return addRegist;
	}
	public void setAddRegist(String addRegist) {
		this.addRegist = addRegist;
	}
	public String getAddLicenseImage() {
		return addLicenseImage;
	}
	public void setAddLicenseImage(String addLicenseImage) {
		this.addLicenseImage = addLicenseImage;
	}
	public String getAddRiderName() {
		return addRiderName;
	}
	public void setAddRiderName(String addRiderName) {
		this.addRiderName = addRiderName;
	}
	public String getAddRiderTel() {
		return addRiderTel;
	}
	public void setAddRiderTel(String addRiderTel) {
		this.addRiderTel = addRiderTel;
	}
	

}
