package com.fa.plus.admin.domain.car;

import org.springframework.web.multipart.MultipartFile;

public class CarReservation {
	// carReservation 
	private String orderNum;
	private String orderDate;
	private int totMoney;
	private int disCount;
	private int payment;
	private int cancelAmount;
	private int orderState;
	private String start_date;
	private String end_date;
	private int addRider;
	
	// member
	private long memberIdx;
	private String userId;
	private String userName;
	
	// member2
	private String tel;
	private String email;
	
	// campingCar
	private String carName;
	
	// licence
	private String birth;
	private String licenseDate;
	private String licenseImage;
	
	public String getLicenseImage() {
		return licenseImage;
	}

	public void setLicenseImage(String licenseImage) {
		this.licenseImage = licenseImage;
	}

	// addLicence
	private String addBirth;
	private String addRegist;
	private String addRiderName;
	private String addLicenceImage;
	private MultipartFile addLicenceFile;
	private String addRiderTel;
	
	public String getAddRiderTel() {
		return addRiderTel;
	}

	public void setAddRiderTel(String addRiderTel) {
		this.addRiderTel = addRiderTel;
	}

	// carCancel`
	private String cancelDate;

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

	public int getDisCount() {
		return disCount;
	}

	public void setDisCount(int disCount) {
		this.disCount = disCount;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public int getCancelAmount() {
		return cancelAmount;
	}

	public void setCancelAmount(int cancelAmount) {
		this.cancelAmount = cancelAmount;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
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

	public String getAddRiderName() {
		return addRiderName;
	}

	public void setAddRiderName(String addRiderName) {
		this.addRiderName = addRiderName;
	}

	public String getAddLicenceImage() {
		return addLicenceImage;
	}

	public void setAddLicenceImage(String addLicenceImage) {
		this.addLicenceImage = addLicenceImage;
	}

	public MultipartFile getAddLicenceFile() {
		return addLicenceFile;
	}

	public void setAddLicenceFile(MultipartFile addLicenceFile) {
		this.addLicenceFile = addLicenceFile;
	}

	public String getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(String cancelDate) {
		this.cancelDate = cancelDate;
	}


	
	
	
}
