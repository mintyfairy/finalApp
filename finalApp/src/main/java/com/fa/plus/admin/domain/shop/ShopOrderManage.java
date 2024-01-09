package com.fa.plus.admin.domain.shop;

public class ShopOrderManage {
	private long productNum;
	private String productName;
	private int price;
    private int discountRate;
    private int delivery;
	
	private long orderNum;
	private long orderDetailNum;
	private long memberIdx;
	private String userName;
	private String orderDate;
	
	private int totalMoney;
	private int usedSaved;
	private int deliveryCharge;
	private int salePrice;
	private int qty;
	private int productMoney;
	private int savedMoney;
	private int payment;
	private int cancelAmount;
	private int orderState;
	private String orderStateInfo;
	private int detailState;
	private String detailStateInfo;
	private String stateMemo;
	private String stateDate;
	private String stateProduct;
	
	private long detailNum;
	private String optionValue;
	private Long detailNum2;
	private String optionValue2;
	
	private String orderStateDate;
	private String deliveryName;
	private String invoiceNumber;
	
	private String itemName;
	private String orderName;
	private String orderEmail;
	private String orderTel;
	
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

	public int getDelivery() {
		return delivery;
	}

	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}

	public long getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
	}

	public long getOrderDetailNum() {
		return orderDetailNum;
	}

	public void setOrderDetailNum(long orderDetailNum) {
		this.orderDetailNum = orderDetailNum;
	}

	public long getMemberIdx() {
		return memberIdx;
	}

	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getProductMoney() {
		return productMoney;
	}

	public void setProductMoney(int productMoney) {
		this.productMoney = productMoney;
	}

	public int getSavedMoney() {
		return savedMoney;
	}

	public void setSavedMoney(int savedMoney) {
		this.savedMoney = savedMoney;
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

	public String getOrderStateInfo() {
		return orderStateInfo;
	}

	public void setOrderStateInfo(String orderStateInfo) {
		this.orderStateInfo = orderStateInfo;
	}

	public int getDetailState() {
		return detailState;
	}

	public void setDetailState(int detailState) {
		this.detailState = detailState;
	}

	public String getDetailStateInfo() {
		return detailStateInfo;
	}

	public void setDetailStateInfo(String detailStateInfo) {
		this.detailStateInfo = detailStateInfo;
	}

	public String getStateMemo() {
		return stateMemo;
	}

	public void setStateMemo(String stateMemo) {
		this.stateMemo = stateMemo;
	}

	public String getStateDate() {
		return stateDate;
	}

	public void setStateDate(String stateDate) {
		this.stateDate = stateDate;
	}

	public String getStateProduct() {
		return stateProduct;
	}

	public void setStateProduct(String stateProduct) {
		this.stateProduct = stateProduct;
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

	public Long getDetailNum2() {
		return detailNum2;
	}

	public void setDetailNum2(Long detailNum2) {
		this.detailNum2 = detailNum2;
	}

	public String getOptionValue2() {
		return optionValue2;
	}

	public void setOptionValue2(String optionValue2) {
		this.optionValue2 = optionValue2;
	}

	public String getOrderStateDate() {
		return orderStateDate;
	}

	public void setOrderStateDate(String orderStateDate) {
		this.orderStateDate = orderStateDate;
	}

	public String getDeliveryName() {
		return deliveryName;
	}

	public void setDeliveryName(String deliveryName) {
		this.deliveryName = deliveryName;
	}

	public String getInvoiceNumber() {
		return invoiceNumber;
	}

	public void setInvoiceNumber(String invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
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

	public String getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(String cancelDate) {
		this.cancelDate = cancelDate;
	}
	
}
