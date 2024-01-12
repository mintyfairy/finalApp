<%@ page contentType="text/html; charset=UTF-8" %>
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

ol,
ul {
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

.cart_table {
  border-top: 1px solid black;
  border-bottom: 1px solid black;
}

.cart_table table {
  width: 100%;
  border-collapse: collapse;
  border-spacing: 0;
  table-layout: fixed;
  word-wrap: break-word;
  word-break: keep-all;
}

.cart_table table thead tr th {
  padding: 15px 0;
  font-size: 13px;
  font-weight: bold;
  text-align: center;
  border-bottom: 1px solid #e9e9e9;
}

.cart_table table tbody tr td {
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
      <h3>장바구니</h3>
      <div class="cart_table">
        <table summary="사진, 제품명, 수량, 적립, 가격, 배송비, 취소">
          <colgroup>
            <col width="120">
            <col width="*">
            <col width="110">
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="95">
          </colgroup>
          <thead>
            <tr>
              <th>사진</th>
              <th>상품명</th>
              <th>수량</th>
              <th>적립</th>
              <th>금액</th>
              <th>배송비</th>
              <th>취소</th>
            </tr>
          </thead>
          <tbody>
          	<c:forEach var="dto" items="${list}">
	            <tr>
	              <td>
	              	<img class="border rounded" width="50" height="50" src="${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}">
	              </td>
	              <td>
		              	${dto.productName}
		              	
						<p class="product-options p-1 mb-0 left">선택사항 : ${dto.optionValue}, ${dto.optionValue2}</p>
									
		              	<input type="hidden" name="productNums" value="${dto.productNum}">
						<input type="hidden" name="detailNums" value="${dto.detailNum}">
						<input type="hidden" name="detailNums2" value="${dto.detailNum2}">
	              </td>
	              <td>
	              		${dto.qty}
	              </td>
	              <td>
	              		${dto.savedMoney}
	              </td>
	              <td>
	              		${dto.productMoney}
	              </td>
	              <td>
	              		${dto.delivery}
	              </td>
	              <td>
	              		<button type="button" class="btn cart-delete" onclick="deleteCartItem('${dto.detailNum2}')"><i class="bi bi-x"></i></button>
	              </td>
	            </tr>
            </c:forEach>
            
          </tbody>
        </table>
      </div>

      <div class="order_wrap">
        <ul class="order_list">
          <li id="order" class="order_item">
            <a href="${pageContext.request.contextPath}/shop/order/main">주문하기</a>
          </li>
          <li class="order_item not_order">
            <a href="${pageContext.request.contextPath}/shop/product/list">계속 쇼핑하기</a>
          </li>
          <li class="order_item not_order">
            <a href="${pageContext.request.contextPath}/shop/myPage/deleteCartAll">장바구니 비우기</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
  