package com.fa.plus.admin.domain.shop;

public class ShopOrderManage {
	private long orderNum;
	private String orderDate;
	private int totalMoney;
	private int usedSaved;
	private int deliveryCharge;
	private int payment;
	private int cancelAmount;
	private int orderState;
	private String orderStateInfo;
	private String orderStateDate;
	private String invoiceNumber;
	private long memberIdx;
	private String itemName;
	private String deliveryName;
	private String orderName;
	private String orderEmail;
	private String orderTel;
	private String userName;
	
	private int totalOrderCount; // 주문 상품수
	private int totalQty; // 상품 주문 개수
	private int detailCancelCount; // 취소건수(취소요청, 취소완료, 반품요청, 반품완료)
	
	// 결제 정보
	private String payMethod;
	private String cardName;
	private String authNumber;
	private String authDate;
	
	private String schType;
	private String kwd;
	
	private String cancelDate;
	
	public long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public int getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}
	public int getUsedSaved() {
		return usedSaved;
	}
	public void setUsedSaved(int usedSaved) {
		this.usedSaved = usedSaved;
	}
	public int getDeliveryCharge() {
		return deliveryCharge;
	}
	public void setDeliveryCharge(int deliveryCharge) {
		this.deliveryCharge = deliveryCharge;
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
	public String getOrderStateDate() {
		return orderStateDate;
	}
	public void setOrderStateDate(String orderStateDate) {
		this.orderStateDate = orderStateDate;
	}
	public String getInvoiceNumber() {
		return invoiceNumber;
	}
	public void setInvoiceNumber(String invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getDeliveryName() {
		return deliveryName;
	}
	public void setDeliveryName(String deliveryName) {
		this.deliveryName = deliveryName;
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
	public String getSchType() {
		return schType;
	}
	public void setSchType(String schType) {
		this.schType = schType;
	}
	public String getKwd() {
		return kwd;
	}
	public void setKwd(String kwd) {
		this.kwd = kwd;
	}
	public String getOrderStateInfo() {
		return orderStateInfo;
	}
	public void setOrderStateInfo(String orderStateInfo) {
		this.orderStateInfo = orderStateInfo;
	}
	public int getTotalOrderCount() {
		return totalOrderCount;
	}
	public void setTotalOrderCount(int totalOrderCount) {
		this.totalOrderCount = totalOrderCount;
	}
	public int getTotalQty() {
		return totalQty;
	}
	public void setTotalQty(int totalQty) {
		this.totalQty = totalQty;
	}
	public int getDetailCancelCount() {
		return detailCancelCount;
	}
	public void setDetailCancelCount(int detailCancelCount) {
		this.detailCancelCount = detailCancelCount;
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
	public String getCancelDate() {
		return cancelDate;
	}
	public void setCancelDate(String cancelDate) {
		this.cancelDate = cancelDate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
}
