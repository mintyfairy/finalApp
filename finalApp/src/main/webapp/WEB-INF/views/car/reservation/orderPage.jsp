<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>

<style>
@charset "utf-8";

* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	color: #333;
	box-sizing: border-box;
}

ol, ul {
	list-style: none;
}

.container {
	width: 800px;
	padding-top: 40px;
	margin: 0 auto;
}

.container .wrap {
	width: 100%;
	margin: 0 auto;
	display: flex;
}

main {
	margin-bottom: 150px;
}

.navi_container {
	border-top: 1px solid #cecece;
	border-bottom: 1px solid #cecece;
}

.navi_container .navi_wrap {
	width: 1080px;
	height: 60px;
	margin: 0 auto;
}

.navi_container .navi_wrap .navi_list {
	display: flex;
	height: 100%;
}

.navi_list .navi_item {
	width: calc(( 100% - 60px)/7);
	height: 100%;
}

.navi_list .navi_item a {
	display: block;
	height: 100%;
	text-align: center;
	line-height: 60px;
}

.hamburger {
	width: 60px;
	height: 60px;
	border-left: 1px solid #cecece;
	border-right: 1px solid #cecece;
}

.hamburger a {
	display: block;
	height: 100%;
}

.car_wrap {
	width: 750px;
	margin: 30px auto;
	display: flex;
	flex-wrap: wrap;
	/* border: 1px solid silver; */
}


.goods_wrap {
	width: 1100px;
	margin: 30px auto;
	/* border: 1px solid silver; */
}

/*
.goods_wrap .goods_list {
    height: 2500px;
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    grid-template-rows: repeat(5, 1fr);
    column-gap: 18px;
}
*/
.goods_wrap .goods_list {
	width: 700px;
	margin: 0 auto;
}

.goods_list li p {
	font-size: 15px;
	font-weight: 600;
	margin: 20px 0 0 10px;
}

.goods_item {
	width: 700px;
	border-radius: 15px;
	display: flex;
	justify-content: space-between;
	margin: 10px auto;
	padding: 20px;
}

.goods_item ul {
	width: 100%;
}

.goods_item ul li {
	font-size: 18px;
	margin: 10px 0;
}

.datebox {
	text-align: center;
	padding: 0 10px;
}

#reservation_check {
	width: 400px;
	height: 50px;
	font-size: 27px;
	font-weight: 700;
	color: white;
	background-color: hsl(39, 100%, 52%);
	border: 0;
	border-radius: 10px;
	margin: 0 auto;
}

#reservation_check:hover {
	background-color: #FF8200 ;
}

.goods_list .goods_item .goods_photo {
	display: block;
	height: 200px;
	overflow: hidden;
	border: 1px solid #dedede;
	border-radius: 12px;
	float: left;
}

.goods_list .goods_item .goods_text {
	height: 200px;
	padding-top: 8px;
	margin-bottom: 28px;
}

.car_wrap .car_list {
	display: flex;
	flex-wrap: wrap;
	margin: 0 auto;
}

.car_wrap .car_list .car_item {
	width: 90%; display : flex;
	margin: 0 auto;
	display: flex;
	/* border: 1px solid skyblue */
}

.car_text {
	width: 300px;;
	height: 200px;
	margin: 0 auto;
}

.car_star {
	font-size: 14px;
	float: right;
	margin-right: 5px;
}

.car_title {
	font-size: 17px;
	margin: 0 10px 20px 10px;
}

.car_sort {
	font-size: 10px;
	font-weight: 500;
	margin: 0 0 30px 10px;
}

.car_content {
	margin: 0 0 3px 10px;
	font-size: 13px;
}

.car_option {
	margin: 3px 0 0 10px;
	font-size: 13px;
}

.price {
	float: right;
	margin-top: 20px;
	margin-right: 5px;
	font-size: 14px;
	font-weight: 700;
}

h4 {
	margin-left: 30px;
	padding-top: 20px;
}

table {
	width: 400px;
	font-size: 17px;
}

table tr {
	height: 40px;
}

</style>

<script type="text/javascript">
	function sendOk() {
		const f = document.paymentForm;

		// 결제 API에서 응답 받을 파라미터
		let payMethod = "카카오페이결제"; // 결제유형
		let cardName = "카카오페이머니"; // 카드 이름
		let authNumber = "1234567890"; // 승인번호
		let authDate = ""; // 승인 날짜
		// toISOString() : "YYYY-MM-DDTHH:mm:ss.sssZ" 형식
		authDate = new Date().toISOString().replace('T', ' ').slice(0, -5); // YYYY-MM-DD HH:mm:ss

		// 결제 API에 요청할 파라미터
		let payment = f.payment.value; // 결제할 금액
		let merchant_uid = "${carReservationOrderNumber}"; // 고유 주문번호
		let carName = "${dto.carName}"; // 주문상품명
		let buyer_email = "${orderUser.email}"; // 구매자 이메일
		let buyer_name = "${orderUser.userName}"; // 구매자 이름
		let buyer_tel = "${orderUser.tel}"; // 구매자 전화번호(필수)

		// 결제 API로 결제 진행

		// 결제가 성공한 경우 ------------------------

		// 결제 방식, 카드번호, 승인번호, 결제 날짜
		f.payMethod.value = payMethod;
		f.cardName.value = cardName;
		f.authNumber.value = authNumber;
		f.authDate.value = authDate;

		f.action = "${pageContext.request.contextPath}/car/reservation/paymentOk"
		f.submit();
	}

	document.getElementById('driverInfoCheckbox').addEventListener(
			'change',
			function() {
				var driverInfoFields = document
						.getElementById('driverInfoFields');
				driverInfoFields.style.display = this.checked ? 'block'
						: 'none';
			});
</script>


<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="reservation.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<body>
	<div class="container">
		<h2 style="padding-left: 30px; margin: 0 0 10px 0;"><i class="fa-solid fa-angles-left"></i></h2>
        <h2 style="padding-left: 30px; margin-bottom: 30px; font-weight: 600; ">차량 예약 </h2>
		<div class="accordion" id="accordionPanelsStayOpenExample">
			<form name="paymentForm" method="post" enctype="multipart/form-data">
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true"
							aria-controls="panelsStayOpen-collapseOne">선택한 여정</button>
					</h2>
					<div id="panelsStayOpen-collapseOne"
						class="accordion-collapse collapse show">
						<div class="accordion-body">
							<div class="car_wrap" id="wrap">
								<div>
								<img
									src="${pageContext.request.contextPath}/uploads/caravan/${dto.thumbnail}"
									style="width: 250px; height: 200px; margin-left: 40px;" />
								</div>
								<div class="car_text">
									<div>
										<p class="car_sort">${dto.carSize}</p>
										<span class="car_title">${dto.carName}</span>
										<!-- <span class="car_star" style="margin-left: 160px;">★ 4.7 ·&nbsp;</span> -->
										<p class="car_content" style="color: #aaaaaa;">${dto.description}</p>
									</div>
									<div class="car_option">
										<span><i class="fa-solid fa-user-group"></i>&nbsp;${dto.carMaxNum}인&nbsp;</span>
										<span><i class="fa-solid fa-campground"></i>&nbsp;${dto.sleepNum}인&nbsp;</span>
										<c:if test="${dto.petOrNot == 1}">
											<span><i class="fa-solid fa-dog"></i>반려동물동반가능</span>
										</c:if>
									</div>


									<input type="hidden" name="carNum" value="${dto.carNum}">
									<input type="hidden" name="thumbnail" value="${dto.thumbnail}">
									<input type="hidden" name="carSize" value="${dto.carSize}">
									<input type="hidden" name="carName" value="${dto.carName}">
									<input type="hidden" name="description"
										value="${dto.description}"> <input type="hidden"
										name="carMaxNum" value="${dto.carMaxNum}"> <input
										type="hidden" name="sleepNum" value="${dto.sleepNum}">
									<input type="hidden" name="petOrNot" value="${dto.petOrNot}">
									<input type="hidden" name="weekCost" value="${dto.weekCost}">
									<input type="hidden" name="wkndCost" value="${dto.wkndCost}">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#panelsStayOpen-collapseThree"
							aria-expanded="false"
							aria-controls="panelsStayOpen-collapseThree">선택 일정</button>
					</h2>
					<div id="panelsStayOpen-collapseThree"
						class="accordion-collapse collapse show">
						<div class="accordion-body goods_item">
							<div class="datebox">
                            <ul>
                                <li>
                                    <span><i class="fa-solid fa-calendar-days"
                                            style="color: #d0dbeb;"></i>&nbsp;대여일</span>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <span style="font-size: 20px;">${dto.start_date}</span>
                                     <input type="hidden" name="start_date" value="${dto.start_date}">
                                </li>
                            </ul>
                        </div>
                        <div class="datebox">
                            <ul>
                                <li>
                                    <span><i class="fa-solid fa-calendar-days"
                                            style="color: #d0dbeb;"></i>&nbsp;반납일</span>
                                </li>
                            </ul>

                            <ul>
                                <li>
                                    <span style="font-size: 20px;">${dto.end_date}</span>
                                    <input type="hidden" name="end_date" value="${dto.end_date}">
                                    <input type="hidden" name="userName" value="${sessionScope.member.userName}">
                            		<input type="hidden" name="tel" value="${orderUser.tel}">
                                	
                                	<input type="hidden" name="orderNum" value="${carReservationOrderNumber}">
                                	 
                                </li>
                            </ul>
                        </div>
                        <div class="datebox">
                            <ul>
                                <li>
                                    <span>총</span> 
                                </li>
                            </ul>

                            <ul>
                                <li>
                                    <span style="font-size: 20px;">1박(24시간)</span>
                                </li>
                            </ul>
                        </div>
							
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#panelsStayOpen-collapseTwo"
							aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
							운전자 정보</button>
					</h2>
					<div id="panelsStayOpen-collapseTwo"
						class="accordion-collapse collapse show">
						<div class="accordion-body">
							<table>
								<tr>
									<th>이름</th>
									<td>${sessionScope.member.userName}</td>
								</tr>
								<tr>
									<th>휴대폰 번호</th>
									<td>${orderUser.tel}</td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td>${orderUser.birth}</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#panelsStayOpen-collapseFour"
							aria-expanded="false" aria-controls="panelsStayOpen-collapseFour">
							결제</button>
					</h2>
					<div id="panelsStayOpen-collapseFour"
						class="accordion-collapse collapse show">
						<div class="accordion-body">
							<table>
								<tr id="totalFee">
									<th>차량대여료</th>
									<td><fmt:formatNumber value="${dto.totMoney}" /> 원 <input
										type="hidden" name="totMoney" value="${dto.totMoney}">
									</td>
								</tr>
								<tr>
									<th>할인율</th>
									<td>${dto.discountRate}% <input type="hidden"
										name="discountRate" value="${dto.discountRate}">
									</td>
								</tr>
								<tr>
									<th>할인가격</th>
									<td><fmt:formatNumber value="${dto.discount}" /> 원 <input
										type="hidden" name="discount" value="${dto.discount}">
									</td>
								</tr>
								<tr>
									<th>결제할 금액</th>
									<td><fmt:formatNumber value="${dto.payment}" /> 원 <input
										type="hidden" name="payment" value="${dto.payment}"></td>
								</tr>
								<tr>
									<th>&nbsp;</th>
									<td>&nbsp;</td>
								</tr>
							</table>

							<div>
								<input type="checkbox" name="submit"> &nbsp;위 내용을
								확인하였으며, 결제 및 예약에 동의합니다.

								<div style="width: 100%;">
									<div style="width: 400px; margin: 30px auto;">
										<button type="submit" id="reservation_check"
											onclick="sendOk()">결제하기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<input type="hidden" name="payMethod" value=""> <input
					type="hidden" name="cardName" value=""> <input
					type="hidden" name="authNumber" value=""> <input
					type="hidden" name="authDate" value="">
			</form>
		</div>
	</div>
</body>


