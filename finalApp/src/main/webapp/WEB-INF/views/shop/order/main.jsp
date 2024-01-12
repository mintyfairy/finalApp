<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
@charset "utf-8";

* {
  margin: 0;
  padding: 0;
  text-decoration: none;
  color: #333;
  box-sizing: border-box;
}

ol,
ul {
  list-style: none;
}

table {
  width: 100%;
  border-collapse: collapse;
  border-spacing: 0;
  table-layout: fixed;
  word-wrap: break-word;
  word-break: keep-all;
  font-size: 12px;
  border-top: 1px solid black;
}

input,
button,
select,
textarea,
a {
  vertical-align: middle;
  font-size: 12px;
}

table thead th {
  padding: 15px 5px;
  font-size: 13px;
  color: #101010;
  border-bottom: 1px solid #e9e9e9;
  background: #f7f7f7;
}

table tbody tr th {
  padding: 0 15px;
  text-align: left;
  border-bottom: 1px solid #e9e9e9;
}

table tbody tr td {
  padding: 10px 0;
  border-bottom: 1px solid #e9e9e9;
}

table input[type=text] {
  width: 168px;
  height: 25px;
  line-height: 25px;
  padding: 0 5px;
  border: 1px solid #ddd;
}

table textarea {
  width: 500px;
  padding: 10px;
  border: 1px solid #ddd;
}

.container {
  padding-top: 100px;
}

.container .wrap {
  width: 1080px;
  margin: 0 auto;
}

.container .wrap h3 {
  margin-top: 40px;
  padding-bottom: 10px;
  font-size: 18px;
  font-weight: bold;
}

.delivery_info {
  position: relative;
  margin-top: 40px;
}

.delivery_info label {
  position: absolute;
  top: 0;
  right: 0;
  font-size: 12px;
}

.wrap .myAddr_label {
  display: inline-block;
  margin: 10px 0 0 15px;
  font-size: 12px;
  vertical-align: middle;
}

.wrap .ocamall_title {
  margin-top: 40px;
}

.product_info .product_table tbody tr td {
  padding: 10px 0;
  text-align: center;
  border-bottom: 1px solid #e9e9e9;
}

.product_info .product_table tbody tr td .thumb_wrap {
  text-align: center;
}

.product_info .product_table tbody tr td .thumb_wrap .thumb img {
  vertical-align: middle;
}

.product_table .total td .total_price {
  padding: 10px 20px;
  text-align: right;
}

.pay_table {
  margin-top: 10px;
}

.pay_table table thead th {
  padding: 15px;
  background-color: #ececec;
  border-bottom: 1px solid #ccc;
  font-size: 14px;
}

.pay_table table thead td {
  padding: 25px 0 28px;
  text-align: center;
}

.pay_table table thead td .pay_info_wrap {
  position: relative;
}

.pay_table table thead td .pay_info_wrap strong {
  font-size: 16px;
}

.pay_table table thead td .pay_info_wrap strong span {
  font-size: 26px;
  font-weight: normal;
  letter-spacing: -1px;
}

.pay_table table thead td .pay_info_wrap .plus {
  position: absolute;
  top: 9px;
  left: 9px;
  width: 23px;
  height: 23px;
}

.pay_table table thead td .pay_info_wrap .minus {
  position: absolute;
  top: 9px;
  left: 9px;
  width: 23px;
  height: 23px;
}

.pay_table table thead td .pay_info_wrap .equal {
  position: absolute;
  top: 9px;
  left: 9px;
  width: 23px;
  height: 23px;
}

.pay_method table tbody .pay_list .pay_item {
  margin: 10px 0;
  padding-left: 18px;
}

.radio_chk {
  width: 13px;
  height: 13px;
  vertical-align: middle;
}

#pay_btn {
  margin-top: 40px;
  text-align: center;
}

#pay_btn a {
  width: 162px;
  height: 48px;
  font-size: 16px;
  line-height: 48px;
}
</style>

<script type="text/javascript">
function sendOk() {
	const f = document.paymentForm;
	
	if(! f.recipientName.value) {
		alert("먼저 배송정보를 등록하세요..");
		return;
	}

	// 결제 API에서 응답 받을 파라미터
	let payMethod = "카드결제"; // 결제유형
	let cardName = "BC 카드";  // 카드 이름
	let authNumber = "1234567890"; // 승인번호
	let authDate = ""; // 승인 날짜
	// toISOString() : "YYYY-MM-DDTHH:mm:ss.sssZ" 형식
	authDate = new Date().toISOString().replace('T', ' ').slice(0, -5); // YYYY-MM-DD HH:mm:ss

	// 결제 API에 요청할 파라미터
	let payment = f.payment.value; // 결제할 금액
	let merchant_uid = "${productOrderNumber}";  // 고유 주문번호
	let productName = "${productOrderName}";  // 주문상품명
	let buyer_email = "${orderUser.email}";  // 구매자 이메일
	let buyer_name = "${orderUser.userName}";  // 구매자 이름
	let buyer_tel = "${orderUser.tel}";   // 구매자 전화번호(필수)
	let buyer_addr = "${orderUser.addr1}" + " " + "${orderUser.addr2}";  // 구매자 주소
	buyer_addr = buyer_addr.trim();
	let buyer_postcode = "${orderUser.zip}"; // 구매자 우편번호
	
	// 결제 API로 결제 진행
	
	
	
	// 결제가 성공한 경우 ------------------------
	
	// 결제 방식, 카드번호, 승인번호, 결제 날짜
	f.payMethod.value = payMethod;
	f.cardName.value = cardName;
	f.authNumber.value = authNumber;
	f.authDate.value = authDate;
	
	f.action = "${pageContext.request.contextPath}/shop/order/paymentOk"
	f.submit();
}
</script>

<div class="container">
<form name="paymentForm" method="post">
  <div class="wrap">
    <h3>주문자정보</h3>
    <div class="order_wrap">
        <table class="order_table">
          <colgroup>
            <col width="130">
            <col width="*">
          </colgroup>
          <tbody>
            <tr>
              <th>이름</th>
              <td>${orderUser.userName}</td>
            </tr>
            <tr>
              <th>이메일</th>
              <td>${orderUser.email}</td>
            </tr>
            <tr>
              <th>연락처</th>
              <td>${orderUser.tel}</td>
            </tr>
            

          </tbody>
        </table>
    </div>
    <h3 class="delivery_info">
      배송정보
      <label for="same">
        <input type="checkbox" id="same" onclick="copydata()"> 위 정보와 같음
      </label>
    </h3>
    
    <div class="delivery_wrap">
        <table class="delivery_table">
          <colgroup>
            <col width="130">
            <col width="*">
          </colgroup>
          <tbody>
            <tr>
              <th>이름</th>
              <td><input type="text" name="recipientName"></td>
            </tr>
            <tr>
              <th>연락처</th>
              <td>
                <select name="tel1" id="tel1" style="height: 25px;">
                  <option value="">선택</option>
                  <option value="010">010</option>
                  <option value="011">011</option>
                  <option value="016">016</option>
                  <option value="017">017</option>
                  <option value="018">018</option>
                  <option value="019">019</option>
                </select>
                &nbsp;&#45;&nbsp;
                <input type="text" name="tel2" id="tel2" style="width: 70px;">
                &nbsp;&#45;&nbsp;
                <input type="text" name="tel3" id="tel3" style="width: 70px;">
              </td>
            </tr>
            <tr>
              <th>주소</th>
              <td>
                <input type="text" name="zip" id="zip" placeholder="우편번호" style="width: 110px;" readonly>
                <button type="button" onclick="daumPostcode();"
                  style="vertical-align: middle; margin-left: 4px; cursor: pointer; background-color: #fff; padding: 2px 4px; border: 1px solid #e5e5e5;">우편번호</button>
                <br>
                <input type="text" name="add1" id="addr1" style="margin-top: 7px; width: 300px;" placeholder="기본주소"
                  readonly>
                <input type="text" name="add1" id="addr1" style="margin-top: 7px; margin-left: 4px; width: 300px;"
                  placeholder="상세주소">
              </td>
            </tr>
            <tr>
              <th>배송시메모</th>
              <td>
                <textarea name="memo" id="memo" cols="50" rows="5" style="width: 100%; height: 50px;"></textarea>
              </td>
            </tr>
          </tbody>
        </table>
      
    </div>
    <label for="myAddr" class="myAddr_label">
      <input type="checkbox" name="mtAddr" id="myAddr">&nbsp;해당 배송지 정보를 나의 회원정보로 등록합니다.
    </label>
    <h3 class="ocamall_title"><i class="fa-solid fa-shop"></i>&nbsp;ocamall</h3>
    <div class="product_info">
      <table class="product_table">
        <colgroup>
          <col width="100">
          <col width="*">
          <col width="130">
          <col width="190">
          <col width="190">
        </colgroup>
        <thead>
          <tr>
            <th>&nbsp;</th>
            <th>상품/옵션정보</th>
            <th>수량</th>
            <th>할인</th>
            <th>주문금액</th>
          </tr>
        </thead>
        <tbody>
        
        <c:forEach var="dto" items="${listProduct}" varStatus="status">
          <tr>
            <td>
              <div class="thumb_wrap">
                <div class="thumb">
                  <img src="https://via.placeholder.com/70x70" alt="thumb" width="70">
                </div>
              </div>
            </td>
            <td style="text-align: left; vertical-align: middle; padding-left: 18px;">
              <strong>${productOrderName}</strong><br>
              <div>
              		${dto.optionName} : ${dto.optionValue} / 
					${dto.optionName2} : ${dto.optionValue2}
				</div>
            </td>
            <td style="text-align: left; font-weight: bold;">
            	&nbsp; &nbsp; ${dto.qty} 
            </td>
            <td style="font-size: 13px; font-weight: bold; text-align: left;">
				&nbsp; &nbsp;${dto.discountRate}
			</td>
            <td style="text-align: left; font-weight: bold;">
				&nbsp; &nbsp; ${dto.productMoney}
           		<input type="hidden" name="productNums" value="${dto.productNum}">
				<input type="hidden" name="detailNums" value="${dto.detailNum}">
				<input type="hidden" name="detailNums2" value="${dto.detailNum2}">
				<input type="hidden" name="buyQtys" value="${dto.qty}">
				<input type="hidden" name="productMoneys" value="${dto.productMoney}">
				<input type="hidden" name="prices" value="${dto.price}">
				<input type="hidden" name="payments" value="${dto.payment}">
				<input type="hidden" name="salePrices" value="${dto.salePrice}">
				<input type="hidden" name="savedMoneys" value="${dto.savedMoney}">
			</td>
          </tr>
       </c:forEach>   
          
          <tr class="total">
            <td colspan="5">
              <div class="total_price">
                주문금액
                <strong>${totalMoney}</strong>
                &nbsp;+&nbsp;배송비
                <strong>${deliveryCharge}원</strong>
                &nbsp;=&nbsp;
                <strong>결제금액&nbsp;${payment}원</strong>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
      
		<input type="hidden" name="orderNum" value="${productOrderNumber}">
		<input type="hidden" name="totalMoney" value="${totalMoney}">
		<input type="hidden" name="deliveryCharge" value="${deliveryCharge}">
		<input type="hidden" name="payment" value="${payment}">
		
		<input type="hidden" name="mode" value="${mode}">
	
		<input type="hidden" name="payMethod" value="">
		<input type="hidden" name="cardName" value="">
		<input type="hidden" name="authNumber" value="">
		<input type="hidden" name="authDate" value="">
    </div>
    <div id="pay_btn">
     <button type="button" class="btn btn-primary" style="width: 250px;" onclick="sendOk()">결제하기</button>
	<button type="button" class="btn btn-light btn-lg" style="width: 250px;" onclick="location.href='${pageContext.request.contextPath}/';">결제취소</button>
    </div>
  </div>
  
</form>  
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
  function daumPostcode() {
      new daum.Postcode({
          oncomplete: function(data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
              var fullAddr = ''; // 최종 주소 변수
              var extraAddr = ''; // 조합형 주소 변수

              // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
              if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                  fullAddr = data.roadAddress;

              } else { // 사용자가 지번 주소를 선택했을 경우(J)
                  fullAddr = data.jibunAddress;
              }

              // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
              if(data.userSelectedType === 'R'){
                  //법정동명이 있을 경우 추가한다.
                  if(data.bname !== ''){
                      extraAddr += data.bname;
                  }
                  // 건물명이 있을 경우 추가한다.
                  if(data.buildingName !== ''){
                      extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                  }
                  // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                  fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
              }

              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
              document.getElementById('addr1').value = fullAddr;

              // 커서를 상세주소 필드로 이동한다.
              document.getElementById('addr2').focus();
          }
      }).open();
  }
</script>