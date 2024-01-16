<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<style type="text/css">
.body-container {
	max-width: 1000px;
}

.left { text-align: left; padding-left: 7px; }
.right { text-align: right; padding-right: 7px; }

.product-title{ font-weight: 600; }
.product-options { color: #777; font-size: 12px; }

.cart-delete, .cart-deleteCheck { cursor: pointer; }
.cart-delete:hover, .cart-deleteCheck:hover { color: #1712AB; }

.select-count-label { color: #777; font-size: 12px; }
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
	
    f.action = "${pageContext.request.contextPath}/campsite/reservation";
    
    f.submit();
}



function deleteCartSelect() {
	// 선택삭제
	let cnt = $("form input[name=nums]:checked").length;
    if (cnt === 0) {
		alert("삭제할 상품을 먼저 선택 하세요 !!!");
		return;
    }
    
	if(! confirm('선택한 상품을 장바구니에서 비우시겠습니까 ? ')) {
		return;
	}
	
	const f = document.cartForm;
	f.action = "${pageContext.request.contextPath}/campsite/deleteListCart";
	f.submit();
}


</script>



<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-cart"></i> 장바구니 </h3>
		</div>
		
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
							<th colspan="2">
								예약한 캠핑장
							</th>
                            <th width="100">방이름</th>
							<th width="140">체크인</th>
							<th width="110">체크아웃</th>
							
							<th width="200">금액</th>
							
							
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${list}">
							<tr class="text-center" valign="middle">
								<td>
									<input type="checkbox" class="form-check-input" name="nums" value="${dto.detailNum}">
									
								</td>
								<td width="55">
									<img class="border rounded" width="50" height="50" src="${pageContext.request.contextPath}/uploads/room/${dto.thumbnail}">
								</td>
								<td>
									<p class="product-title p-1 mb-0 left">${dto.content}</p>
									<p class="product-options p-1 mb-0 left"> 수용인원 : ${dto.capacity}</p>

                                  
									<input type="hidden" name="memberIdx" value="${dto.memberIdx}">
									<input type="hidden" name="detailNum" value="${dto.detailNum}">
									
                                   
								</td>
								<td>
									<div class="input-group">
										<p class="product-title p-1 mb-0 left">${dto.detailName}</p>
									</div>
								</td>
								<td>
									${dto.startDate}
								</td>
								<td>
									${dto.endDate}
								</td>
								<td>
									<label class="productMoneys"><fmt:formatNumber value="${dto.periodPrice}"/></label><label>원</label>
									<input type="hidden" name="dayPrice" value="${dto.price}">
								</td>
								
							</tr>
						
						</c:forEach>
					</tbody>
				</table>
				
				<c:choose>
					<c:when test="${list.size() == 0}">
						<div class="mt-3 p-3 text-center">
							추가된 내역이 없습니다.
						</div>
					</c:when>
					<c:otherwise>
						<div class="mt-3 p-3 text-end">
							<input type="hidden" name="mode" value="cart">
							<button type="button" class="btn border btn-primary" style="width: 200px;" onclick="sendOk();"> 선택 캠핑장 예약하기 </button>
							<button type="button" class="btn border btn-light" onclick="deleteCartAll();"> 장바구니 모두 비우기 </button>
						</div>
					</c:otherwise>
				</c:choose>
			</form>
			
		</div>
	</div>
</div>

