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

ol, ul {
	list-style: none;
}

.container {
	padding-top: 110px;
	margin-bottom: 140px;
}

.container .wrap {
	width: 1080px;
	margin: 0 auto;
}

.product_info_wrap {
	display: flex;
	justify-content: space-between;
}

.product_info_wrap .product_thumb {
	flex-basis: 50%;
}

.product_info_wrap .product_info {
	flex-basis: 47%;
}

.product_info .product_title {
	position: relative;
	border-bottom: 1px solid #efefef;
	margin-bottom: 28px;
}

.product_info .product_title .brand {
	display: block;
	font-size: 18px;
	margin-bottom: 5px;
}

.product_info .product_title .product_name {
	font-size: 28px;
	margin-bottom: 28px;
}

.product_info .product_title .like_btn {
	position: absolute;
	top: 0;
	right: 0;
}

.product_value {
	margin-bottom: 72px;
}

.product_value div {
	display: flex;
	align-items: center;
	flex-wrap: nowrap;
}

.product_value .product_price {
	margin-bottom: 14px;
}

.product_value div p:first-child {
	width: 130px;
	font-size: 13px;
	font-weight: bold;
}

.product_value .product_delivery {
	margin-bottom: 28px;
}

.product_value .product_delivery p:nth-child(2) {
	font-size: 13px;
}

.product_value .brand_name {
	color: #575757;
	font-size: 15px;
	margin-bottom: 15px;
}

.product_value .cnt_price {
	display: flex;
	justify-content: space-between;
	margin-bottom: 28px;
	padding-right: 30px;
	padding-bottom: 28px;
	border-bottom: 1px solid #efefef;
}

.product_value .cnt_price .qty input {
	width: 60px;
	height: 35px;
	padding-left: 15px;
	font-size: 13px;
	text-align: left;
	border-radius: 0;
	border: 1px solid #e6e6e6;
}

.product_value .cnt_price .qty button {
	width: 35px;
	height: 35px;
	font-size: 20px;
	cursor: pointer;
	background-color: #fff;
	border-radius: 0;
	border: 1px solid #e6e6e6;
}

.product_value .total_price {
	padding-bottom: 0.5rem !important;
	margin-top: 0.5rem !important;
	font-weight: 600 !important;
}

.btn_list {
	display: flex;
}

.btn_list button {
	display: block;
	width: 138px;
	height: 60px;
	margin-left: 7px;
	color: black;
	text-align: center;
	line-height: 30px;
	cursor: pointer;
	background-color: #fff;
	border: 1px solid #efefef;
}

.btn_list button:first-child {
	width: 224px;
	color: #fff;
	background-color: #000;
	border: 1px solid black;
}

.detail_wrap {
	padding-top: 100px;
}

.detail_wrap .detail_tab .tab_list {
	display: flex;
}

.tab_list .tab_item {
	width: 25%;
}

.tab_list .tab_item a {
	display: block;
	height: 60px;
	font-size: 15px;
	color: #9f9f9f;
	line-height: 60px;
	text-align: center;
	border-bottom: 2px solid #e5e5e5;
}

.tab_list .tab_item a:active {
	color: #000;
	border-bottom: 2px solid #000;
}

.detail_wrap .detail_img {
	padding-top: 60px;
	padding-bottom: 100px;
	text-align: center;
}

.detail_review {
	margin-bottom: 100px;
	padding-top: 60px;
}

.detail_review .review_table table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
	table-layout: fixed;
	word-wrap: break-word;
	word-break: keep-all;
	border-top: 1px solid black;
}

.detail_review .review_table table tbody tr {
	border-bottom: 1px solid #e5e5e5;
}

.detail_review .review_table table tbody tr td {
	padding: 15px 0;
	text-align: center;
	font-size: 13px;
	font-weight: bold;
}

.detail_review .review_write {
	position: relative;
	margin-top: 20px;
}

.detail_review .review_write a {
	position: absolute;
	right: 0;
	display: block;
	width: 108px;
	height: 38px;
	font-size: 13px;
	color: #000;
	text-align: center;
	line-height: 38px;
	border: 1px solid #231f20;
	background: #fff;
}

.detail_qna {
	margin-bottom: 100px;
	padding-top: 60px;
}

table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
	table-layout: fixed;
	word-wrap: break-word;
	word-break: keep-all;
	border-top: 1px solid black;
}

.detail_qna .qna_table table tbody tr {
	border-bottom: 1px solid #e5e5e5;
}

.detail_qna .qna_table table tbody tr td {
	padding: 15px 0;
	text-align: center;
	font-size: 13px;
	font-weight: bold;
}

.detail_qna .qna_write {
	position: relative;
	margin-top: 20px;
}

.detail_qna .qna_write a {
	position: absolute;
	right: 0;
	display: block;
	width: 108px;
	height: 38px;
	font-size: 13px;
	color: #000;
	text-align: center;
	line-height: 38px;
	border: 1px solid #231f20;
	background: #fff;
}

.detail_as .as_table table tbody tr th {
	font-size: 16px;
	font-weight: 500;
	border-bottom: 1px solid #e6e6e6;
	background: #f9f9f9;
}

.detail_as .as_table table tbody tr td {
	padding: 45px 20px;
	font-size: 13px;
	border-bottom: 1px solid #e6e6e6;
}

 .order-area {
    border: 1px solid #e9e9e9;
    padding: 15px;
    margin: 10px;
    background-color: #f7f7f7;
     margin-bottom: 20px;
  }
  
   .total-price {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
    padding: 0 20px;
    align-items: center;
    border-top: 1px solid #e9e9e9;
  }

  .total-price .col-auto {
    font-weight: bold;
    padding-top: 1px;
  }

  .total-price label {
    margin-right: 10px;
  }

  .product-totalAmount {
    font-size: 1.25rem;
    font-weight: bold;
  }
</style>

<script type="text/javascript">
function login() {
	location.href = '${pageContext.request.contextPath}/login/login';
}

function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			success:function(data) {
				fn(data);
			},
			beforeSend: function(jqXHR) {
				jqXHR.setRequestHeader('AJAX', true);
			},
			complete: function () {
			},
			error: function(jqXHR) {
				if(jqXHR.status === 403) {
					login();
					return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	}
		    	
				console.log(jqXHR.responseText);
			}
	};
	
	if(file) {
		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
	}
	
	$.ajax(url, settings);
}
</script>

<script type="text/javascript">
$(function(){
	// 필수 옵션-1
	$(".requiredOption").change(function(){
		$(".requiredOption2 option").each(function(){
			if($(this).is(":first-child")) {
				return true; // continue
			}
			
	    	$(this).remove();
	    });
		
		let detailNum = $(this).val();
		if(! detailNum) {
			return false;
		}
		
		let optionNum = $(".requiredOption").attr("data-optionNum");
		let optionNum2 = $(".requiredOption2").attr("data-optionNum2");
		
		let url = "${pageContext.request.contextPath}/shop/product/listOptionDetail2";
		$.get(url, {optionNum:optionNum, optionNum2:optionNum2, detailNum:detailNum}, function(data){
			$(data).each(function(index, item){
				let detailNum = item.detailNum;
				let optionValue = item.optionValue;
				
				$(".requiredOption2").append("<option value='"+detailNum+"'>"+optionValue+"</option>");
			});
		});
	});
	
	//필수 옵션-2
	$(".requiredOption2").change(function(){
		if(! $(this).val()) {
			return false;
		}
		let productNum = "${dto.productNum}";
		if(! productNum) {
			return false;
		}
		
		let detailNum = $(".requiredOption").val();
		let detailNum2 = $(this).val();
		
		let b = true;
		$(".order-area input[name=detailNums2]").each(function(){
			let dnum = $(this).closest(".input-group").find("input[name=detailNums]").val();
			let dnum2 = $(this).val();
			if(detailNum === dnum && detailNum2 === dnum2) {
				alert("선택된 옵션입니다.");
				$(".requiredOption").val("");
				$(".requiredOption").trigger("change");
				b = false;
				return false;
			}
		});
		if(! b) {
			return false;
		}
		
		let optionValue = $(".requiredOption :selected").text();
		let optionValue2 = $(".requiredOption2 :selected").text();
		
		let salePrice = ${dto.salePrice};
		let totalPrice = salePrice.toLocaleString();
		
		let s = optionValue + " / " + optionValue2;
		let out = "";
		out += "<div class='order-qty'>";
		out += "  <div class='mt-2 pb-1'>";
		out += "    <label>"+s+"</label>";
		out += "  </div>";
		out += "  <div class='row border-bottom mt-1 pb-2'>";
		out += "    <div class='col'>";
		out += "      <div class='input-group'>";
		out += "        <i class='bi bi-dash input-group-text bg-white qty-minus'></i>";
		out += "        <input type='text' name='buyQtys' class='form-control' value='1' style='flex:none; width: 60px; text-align: center;' readonly>";
		out += "        <input type='hidden' name='productNums' value='"+productNum+"'>";
		out += "        <input type='hidden' name='detailNums' value='"+detailNum+"'>";
		out += "        <input type='hidden' name='detailNums2' value='"+detailNum2+"'>";
		out += "        <i class='bi bi-plus input-group-text bg-white qty-plus'></i>";
		out += "      </div>";
		out += "    </div>";
		out += "    <div class='col text-end product-salePrice' data-salePrice='"+salePrice+"';>";
		out += "      <label class='pt-2 fs-6 fw-semibold item-totalPrice'>"+totalPrice+"원</label>";
		out += "      <label class='pt-2 ps-1'><i class='bi bi-x qty-remove'></i></label>";
		out += "    </div>";
		out += "  </div>";
		out += "</div>";
		
		$(".order-area").append(out);
		
		totalProductPrice();
	});
	
	//수량 더하기
	$(".order-area").on("click", ".qty-plus", function() {
		let $order = $(this).closest(".order-qty");
		let qty = parseInt($order.find("input[name=buyQtys]").val()) + 1;
		$order.find("input[name=buyQtys]").val(qty);
		let salePrice = $order.find(".product-salePrice").attr("data-salePrice");
		let item = qty * salePrice;
		let totalPrice = item.toLocaleString();
		$order.find(".item-totalPrice").text(totalPrice+"원");
		
		totalProductPrice();
	});
	
	// 수량 빼기
	$(".order-area").on("click", ".qty-minus", function() {
		let $order = $(this).closest(".order-qty");
		let qty = parseInt($order.find("input[name=buyQtys]").val()) - 1;
		if(qty <= 0) {
			alert("구매 수량은 한개 이상입니다.");
			$(".requiredOption").val("");
			$(".requiredOption").trigger("change");
			$order.remove();
			
			totalProductPrice()
			
			return false;
		}
		
		$order.find("input[name=buyQtys]").val(qty);
		let salePrice = $order.find(".product-salePrice").attr("data-salePrice");
		let item = qty * salePrice;
		let totalPrice = item.toLocaleString();
		$order.find(".item-totalPrice").text(totalPrice+"원");
		
		totalProductPrice();
	});
	
	// 수량 제거
	$(".order-area").on("click", ".qty-remove", function() {
		let $order = $(this).closest(".order-qty");
		
		$(".requiredOption").val("");
		$(".requiredOption").trigger("change");
		$order.remove();
		
		totalProductPrice();
	});

	function totalProductPrice() {
		let totalQty = 0;
		let totalPrice = 0;
		$(".order-qty").each(function(){
			let qty = parseInt($(this).find("input[name=buyQtys]").val());
			let salePrice = parseInt($(this).find(".product-salePrice").attr("data-salePrice"));
			
			totalQty += qty;
			totalPrice += (salePrice * qty);
		});
		
		let s = totalPrice.toLocaleString();
		
		$(".product-totalQty").text(totalQty);
		$(".product-totalAmount").text(s);
	}
});

$(function(){
	$(".sm-img img").click(function(){
		let url = $(this).attr("src");
		$(".lg-img img").attr("src", url);
	});
});

function sendOk(mode) {
	let totalQty = 0;
	$(".order-qty").each(function(){
		let qty = parseInt($(this).find("input[name=buyQtys]").val());
		
		totalQty += qty;
	});
	
	if(totalQty <= 0) {
		alert("구매 상품의 수량을 선택하세요 !!! ");
		return;
	}

	const f = document.buyForm;
	if(mode === "buy") {
		// GET 방식으로 전송. 로그인후 결제화면으로 이동하기 위해
		// 또는 자바스크립트 sessionStorage를 활용 할 수 있음
		f.method = "get";
		f.action = "${pageContext.request.contextPath}/shop/order/main";
	} else {
		if(! confirm("선택한 상품을 장바구니에 담으시겠습니까 ? ")) {
			return false;
		}
		
		f.method = "post";
		f.action = "${pageContext.request.contextPath}/shop/myPage/saveCart";
	}
	
	f.submit();
}
</script>



<div class="container">
	<div class="wrap">
		<div class="product_info_wrap">
			<div class="product_thumb">
				<img src="https://via.placeholder.com/538x540" alt="thumb"
					width="538">
			</div>
			<div class="product_info">
				<form name="buyForm">
					<div class="product_title">
						<strong class="brand">${dto.brandName}</strong>
						<div class="product_name">${dto.productName}</div>
						<a href="#" class="like_btn"> <img src="../image/like_btn.png"
							alt="like_btn">
						</a>
					</div>
					<div class="product_value">
						<div class="product_price">
							<p>판매가</p>
							<h3 id="price">${dto.price}</h3>
						</div>
						<div class="product_delivery">
							<p>배송비</p>
							<p>총 결제금액이 50,000원 미만시 배송비 3,000원이 청구됩니다.</p>
						</div>
						<p class="brand_name">[브랜드명]상품명</p>
						<div class="mt-2">* 필수 옵션</div>

						<div class="mt-2">
							<select class="form-select requiredOption"
								data-optionNum="${listOption[0].optionNum}">
								<option value="">${listOption[0].optionName}</option>
								<c:forEach var="vo" items="${listOptionDetail}">
									<option value="${vo.detailNum}">${vo.optionValue}</option>
								</c:forEach>
							</select>
						</div>

						<div class="mt-2 pb-2">
							<select class="form-select requiredOption2"
								data-optionNum2="${listOption[1].optionNum}">
								<option value="">${listOption[1].optionName}</option>
							</select>
						</div>

						<div class="order-area"></div>

						<div class="total_price d-flex justify-content-between mt-3 px-3">
							<label>총 수량 <span class="product-totalQty">0</span>개 |
							</label> <label><span
								class="product-totalAmount fs-5 fw-semibold text-black">0</span>원</label>
						</div>



					</div>

					<div class="btn_list">
						<input type="hidden" name="mode" value="buy">
						<button type="button" class="btn btn-dark w-50 btn-buySend"
							onclick="sendOk('buy');">바로 구매하기</button>
						<button type="button" class="btn border w-35 btn-productCart"
							onclick="sendOk('cart');"
							${empty sessionScope.member.memberIdx ? "disabled='disabled'" : ""}>
							장바구니 <i class="bi bi-bag"></i>
						</button>
						<button type="button" class="btn border w-35 btn-productBlind"
							${empty sessionScope.member.memberIdx ? "disabled='disabled'" : ""}>
							찜하기 <i class="bi bi-heart"></i>
						</button>
					</div>
				</form>
			</div>
		</div>

		<div class="detail_wrap">
			<div id="tabs1" class="detail_tab detail_tab1">
				<ul class="tab_list">
					<li class="tab_item" onclick="detailInfo();"><a href="#">상세정보</a></li>
					<li class="tab_item" onclick="productReview();"><a href="#">상품후기0</a></li>
					<li class="tab_item" onclick="productQuestion();"><a href="#">상품문의0</a></li>
					<li class="tab_item" onclick="productAs();"><a href="#">배송/교환/반품/AS</a></li>
				</ul>
			</div>
			<div class="detail_img">
				<img src="https://via.placeholder.com/538x540" alt="detail_img">
			</div>
			<div class="detail_tab detail_tab2">
				<ul class="tab_list">
					<li class="tab_item" onclick="detailInfo();"><a href="#">상세정보</a></li>
					<li class="tab_item" onclick="productReview();"><a href="#">상품후기0</a></li>
					<li class="tab_item" onclick="productQuestion();"><a href="#">상품문의0</a></li>
					<li class="tab_item" onclick="productAs();"><a href="#">배송/교환/반품/AS</a></li>
				</ul>
			</div>
			<div class="detail_review">
				<div class="review_table">
					<table summary="번호, 평점, 내용, 작성자, 작성일, 조회">
						<colgroup>
							<col width="40">
							<col width="40">
							<col width="*">
							<col width="95">
							<col width="110">
							<col width="40">
						</colgroup>
						<tbody>
							<tr>
								<td colspan="6">등록된 리뷰가 없습니다.</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="review_write">
					<a href="#">글쓰기</a>
				</div>
			</div>
			<div class="detail_tab detail_tab3">
				<ul class="tab_list">
					<li class="tab_item" onclick="detailInfo();"><a href="#">상세정보</a></li>
					<li class="tab_item" onclick="productReview();"><a href="#">상품후기0</a></li>
					<li class="tab_item" onclick="productQuestion();"><a href="#">상품문의0</a></li>
					<li class="tab_item" onclick="productAs();"><a href="#">배송/교환/반품/AS</a></li>
				</ul>
			</div>
			<div class="detail_qna">
				<div class="qna_table">
					<table summary="번호, 평점, 내용, 작성자, 작성일, 조회">
						<colgroup>
							<col width="40">
							<col width="40">
							<col width="*">
							<col width="95">
							<col width="110">
							<col width="40">
						</colgroup>
						<tbody>
							<tr>
								<td colspan="6">등록된 리뷰가 없습니다.</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="qna_write">
					<a href="#">글쓰기</a>
				</div>
			</div>
			<div class="detail_tab detail_tab4">
				<ul class="tab_list">
					<li class="tab_item" onclick="detailInfo();"><a href="#">상세정보</a></li>
					<li class="tab_item" onclick="productReview();"><a href="#">상품후기0</a></li>
					<li class="tab_item" onclick="productQuestion();"><a href="#">상품문의0</a></li>
					<li class="tab_item" onclick="productAs();"><a href="#">배송/교환/반품/AS</a></li>
				</ul>
			</div>
			<div class="detail_as">
				<div class="as_table">
					<table>
						<colgroup>
							<col width="250">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th style="text-align: center">배송안내</th>
								<td><b>제품 수령 후 구성품을 꼭 확인해주세요.</b> <br>" 수령 후 30일이 지난
									제품의 구성품 누락 및 오배송에 대한 문의는 당사에서 해결해 드리기 어려우니, " <br>"반드시 수령
									후 구성품과 제품확인으로 문제가 없는지 확인해주시기 바랍니다." <br> <br> <b>제품
										사진은 촬영시 카메라 플래쉬, 모니터에 따라 실제 제품 이미지와 다소 차이가 있을 수 있습니다.</b> <br>
									<br> <b>제품 실측 사이즈는 측정에 따라 실제 사이즈와 약간의 오차가 발생할 수 있습니다.</b>
									<br> <br> <b>주문상품 배송은 결제 확인 후 2~5일 정도 소요되며, 제품에
										따라 배송일이 지연될 수 있음을 양해바랍니다.</b> <br> <br> <b>택배사는
										로젠택배를 이용하고 있으며, 배송 및 택배 관련 문의는 1588-9988 로젠택배로 문의하시기 바랍니다.</b> <br>
									<br> <b>총 결제금액 50,000원 미만시 배송비 3,000원이 청구됩니다.(도서 산간지역
										별도 적용)</b> <br> <br> <b>제품에 따라 묶음배송 불가상품이 있으며, 주문금액과
										상관없이 별도 배송비가 부과될 수 있습니다.</b></td>
							</tr>
							<tr>
								<th style="text-align: center">교환/반품안내</th>
								<td><b>교환/반품이 가능한 경우</b> <br> " - 단순변심으로 인한 교환/반품은
									왕복배송비를 고객님께서 지불해 주셔야 합니다." <br> " - 초기불량, 배송오류는 오캠몰에서 왕복
									택배비를 부담하여 교환 및 반품처리 해드립니다." <br> <br> <b>교환/반품이
										불가능한 경우</b> <br> " - 상품 수령 후 7일을 초과한 경우 변심 또는 제품 만에 대한 교환/반품은
									불가합니다.(디자인,사이즈,실측정보,소재,색상,스크래치,실밥 등)" <br> " - 고객부주의 또는 제품
									사용으로 상품훼손 등 상품 가치가 떨어진 경우 교환/반품이 불가합니다." <br> " - 브랜드 박스
									개봉 및 훼손, 상품태그 제거 등 상품 가치가 떨어진 경우 교환/반품이 불가합니다." <br> " -
									상품 초기불량 확인 후 고객의 과실에 의한 상품훼손 및 사용으로 상품 가치가 떨어진 경우 교환/반품이
									불가합니다." <br> "- 세탁,수선 등 취급부주의로 인하여 상품이 훼손된 경우 교환/반품이
									불가합니다."</td>
							</tr>
							<tr>
								<th style="text-align: center">A/S안내</th>
								<td><b>제품 A/S는 반드시 손상된 제품이 입고되어야 A/S가 가능합니다.</b> <br>
									<br> <b>본사제품의 경우 제품 결함에 의한 수리는 제품 구입일로부터 30일간 무상 A/S를
										받으실 수 있습니다.</b> <br> "그외 A/S는 모두 유상 수리로 진행되며, 일부 손상 정도에 따라
									A/S가 불가할 수 있습니다." <br> <br> <b>자세한 A/S 정책은 AS라운지의
										게시판을 참고해 주시기 바랍니다.</b></td>
							</tr>
							<tr>
								<th style="text-align: center">교환/반품/AS 주소</th>
								<td><b>주소 : (13550) 경기도 성남시 분당구 대왕판교로 361번길(궁내동) 오캠몰</b> <br>
									<b> 연락처 : 031-712-4371</b> <br> <br> " 교환/반품/AS접수는
									로젠택배(1588-9988)로 전화하셔서 배송 운송장 번호 또는 개별접수로 반송해 주시면 됩니다."</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
//변수명 변경
let detailInfo = document.querySelector("#tabs1").offsetTop;
let productReview = document.querySelector(".detail_tab2").offsetTop;
let productQuestion = document.querySelector(".detail_tab3").offsetTop;
let productAs = document.querySelector(".detail_tab4").offsetTop;

// 함수명 변경
function scrollToDetailInfo() {
   window.scrollTo({top: detailInfo, left: 0, behavior: 'smooth'});
}

function scrollToProductReview() {
   window.scrollTo({top: productReview, left: 0, behavior: 'smooth'});
}

function scrollToProductQuestion() {
   window.scrollTo({top: productQuestion, left: 0, behavior: 'smooth'});
}

function scrollToProductAs() {
   window.scrollTo({top: productAs, left: 0, behavior: 'smooth'});
}

</script>
