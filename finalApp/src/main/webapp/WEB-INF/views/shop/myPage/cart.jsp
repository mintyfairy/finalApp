<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
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
	margin-bottom: 60px;
	padding-top: 80px;
}

.container .wrap {
	width: 1080px;
	margin: 0 auto;
}

.container .wrap h3 {
	font-weight: 700;
	margin-bottom: 30px;
}

.body-title {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.body-title table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
	table-layout: fixed;
	word-wrap: break-word;
	word-break: keep-all;
}

.body-title table thead tr th {
	padding: 15px 0;
	font-size: 13px;
	font-weight: bold;
	text-align: center;
	border-bottom: 1px solid #e9e9e9;
}

.body-title table tbody tr td {
	padding: 15px 0;
	font-weight: bold;
	border-bottom: 1px solid #e9e9e9;
	text-align: center;
}

.total_price_wrap {
	padding: 35px 20px;
	border-bottom: 1px solid black;
}

.total_price_wrap .total_price_flex {
	display: flex;
	justify-content: space-between;
	align-items: center;
	align-content: center;
}

.total_price_wrap .total_price_flex p {
	font-size: 13px;
	font-weight: 900;
}

.order_wrap {
	margin: 50px 0;
	text-align: center;
}

.order_wrap .order_list {
	display: flex;
	justify-content: center;
}

#order {
	background-color: black;
	transition: 0.3s ease-in-out;
	-webkit-transition: 0.3s ease-in-out;
}

#order a {
	color: #fff;
	transition: 0.3s ease-in-out;
	-webkit-transition: 0.3s ease-in-out;
}

#order:hover {
	background-color: #fff;
	transition: 0.3s ease-in-out;
	-webkit-transition: 0.3s ease-in-out;
}

#order:hover a {
	color: #333;
	transition: 0.3s ease-in-out;
	-webkit-transition: 0.3s ease-in-out;
}

.order_wrap .order_list .order_item {
	margin: 0 3px;
	border: 1px solid black;
}

.order_wrap .order_list .order_item a {
	display: inline-block;
	width: 178px;
	height: 58px;
	line-height: 58px;
	font-weight: bold;
}

.order_wrap .order_list .not_order {
	background-color: #fff;
	transition: 0.3s ease-in-out;
	-webkit-transition: 0.3s ease-in-out;
}

.order_wrap .order_list .not_order a {
	color: black;
	transition: 0.3s ease-in-out;
	-webkit-transition: 0.3s ease-in-out;
}

.order_wrap .order_list .not_order:hover {
	background-color: black;
	transition: 0.3s ease-in-out;
	-webkit-transition: 0.3s ease-in-out;
}

.order_wrap .order_list .not_order:hover a {
	color: #fff;
	transition: 0.3s ease-in-out;
	-webkit-transition: 0.3s ease-in-out;
}

.cart-list > thead tr:first-child { border-top: 2px solid #212529; }
.cart-list td { padding: 3px; }
</style>

<script type="text/javascript">
$(function(){
	let cartSize = "${list.size()}";
	if(cartSize!=="" && cartSize!=="0") {
		$(".cart-chkAll").prop("checked", true);
		$("form input[name=nums]").prop("checked", true);
	}
	
    $(".cart-chkAll").click(function() {
    	$("form input[name=nums]").prop("checked", $(this).is(":checked"));
    });
});

function sendOk() {
	// 구매하기
	const f = document.cartForm;
	
	let cnt = $("form input[name=nums]:checked").length;
    if (cnt === 0) {
		alert("구매할 상품을 먼저 선택 하세요 !!!");
		return;
    }
    
    $("form input[name=nums]").each(function(index, item){
		if(! $(this).is(":checked")) {
			$(this).closest("tr").remove();
		}
	});
	
	f.action = "${pageContext.request.contextPath}/shop/order/main";
	f.submit();
}

function main() {
	// 장바구니 비우기
	if(! confirm('장바구니를 비우시겠습니까 ? ')) {
		return;
	}

	location.href = '${pageContext.request.contextPath}/shop/order/main';	
}

function deleteCartAll() {
	// 장바구니 비우기
	if(! confirm('장바구니를 비우시겠습니까 ? ')) {
		return;
	}

	location.href = '${pageContext.request.contextPath}/shop/myPage/deleteCartAll';	
}

function deleteCartSelect() {
	// 선택된 항목 삭제
	let cnt = $("form input[name=nums]:checked").length;
    if (cnt === 0) {
		alert("삭제할 상품을 먼저 선택 하세요 !!!");
		return;
    }
    
	if(! confirm('선택한 상품을 장바구니에서 비우시겠습니까 ? ')) {
		return;
	}
	
	const f = document.cartForm;
	f.action = "${pageContext.request.contextPath}/shop/myPage/deleteListCart";
	f.submit();
}

function deleteCartItem(detailNum2) {
	// 하나의 항목 삭제
	if(! confirm('선택한 상품을 장바구니에서 비우시겠습니까 ? ')) {
		return;
	}

	location.href = '${pageContext.request.contextPath}/shop/myPage/deleteCart?detailNum2=' + detailNum2;	
}
</script>

<div class="container">
	<div class="wrap">
		<div class="cart_table">
		<h3><i class="bi bi-cart"></i> 장바구니 </h3>
		
		<div class="body-main pt-3">
		
		<form name="cartForm" method="post">
			<div style="padding: 15px 0 5px;">
				<button type="button" class="btn cart-deleteCheck" onclick="deleteCartSelect();">선택삭제</button>
			</div>
		<table class="table cart-list">
			<thead>
				<tr class="bg-light text-center">
					<th width="35">
						<input type="checkbox" class="form-check-input cart-chkAll" name="chkAll">
					</th>
					<th colspan="2">상품명</th>
					<th width="110">수량</th>
					<th width="100">적립</th>
					<th width="100">금액</th>
					<th width="100">배송비</th>
					<th width="95">취소</th>
				</tr>
			</thead>
			
				<tbody>
					<c:forEach var="dto" items="${list}">
						<tr class="text-center" valign="middle">
							<td>
							  	<input type="checkbox" class="form-check-input" name="nums" value="${dto.detailNum}">	
							</td>
							
							<td>
								<img class="border rounded" width="50" height="50" src="${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}">
							</td>
							<td>${dto.productName}

								<p class="product-options p-1 mb-0 left">선택사항 : ${dto.optionValue}, ${dto.optionValue2}</p> 
								<input type="hidden" name="productNums" value="${dto.productNum}"> 
								<input type="hidden" name="detailNums" value="${dto.detailNum}">
								<input type="hidden" name="detailNums2" value="${dto.detailNum2}">
							</td>
							<td>
								${dto.qty}
								<input type="hidden" name="buyQtys" value="${dto.qty}">
							</td>
							<td>${dto.savedMoney}</td>
							<td>${dto.productMoney}</td>
							<td>${dto.delivery}</td>
							<td>
								<button type="button" class="btn cart-delete"
									onclick="deleteCartItem('${dto.detailNum2}')">
									<i class="bi bi-x"></i>
								</button>
							</td>
						</tr>
						
					</c:forEach>
				</tbody>
			</table>

		<c:choose>
			<c:when test="${list.size() == 0}">
				<div class="mt-3 p-3 text-center">추가된 내역이 없습니다.</div>
			</c:when>
			<c:otherwise>
				<div class="mt-3 p-3 text-end">
					<input type="hidden" name="mode" value="cart">
					<button type="button" class="btn border btn-primary" style="width: 200px;" onclick="sendOk();">주문하기</button>
					<button type="button" class="btn border btn-light" onclick="location.href='${pageContext.request.contextPath}/shop/product/list'">
						계속 쇼핑하기
					</button>
					<button type="button" class="btn border btn-light" onclick="location.href='${pageContext.request.contextPath}/shop/myPage/deleteCartAll'">
						장바구니 모두 비우기
					</button>
				</div>
			</c:otherwise>
		</c:choose>
	</form>
</div>
</div>
</div>
</div>