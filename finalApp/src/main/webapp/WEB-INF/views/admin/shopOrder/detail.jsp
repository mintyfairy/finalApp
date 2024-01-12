<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div>
	<div class="mt-3">
		<div class="p-3 shadow bg-body rounded">
			<p class="fs-6 fw-semibold mb-0">주문 정보</p> 
		</div>
		<div class="mt-3 p-2">
			<table class="table table-bordered mb-1">
				<tr>
					<td class="table-light" width="105">주문번호</td>
					<td width="150">${order.orderNum}</td>
					<td class="table-light" width="105">주문자</td>
					<td width="150">${order.userName}</td>
					<td class="table-light" width="105">주문일자</td>
					<td width="150">${order.orderDate}</td>
					<td class="table-light" width="110">주문상태</td>
					<td width="150">${order.orderStateInfo}</td>
				</tr>
				<tr>
					<td class="table-light">총금액</td>
					<td class="text-primary"><fmt:formatNumber value="${order.totalMoney}"/></td>
					<td class="table-light">적림금사용액</td>
					<td class="text-primary"><fmt:formatNumber value="${order.usedSaved}"/></td>
					<td class="table-light">결제금액</td>
					<td class="text-primary"><fmt:formatNumber value="${order.payment}"/></td>
					<td class="table-light">취소금액</td>
					<td class="text-warning order-cancelAmount" data-cancelAmount="${order.cancelAmount}">
						<fmt:formatNumber value="${order.cancelAmount}"/>
					</td>
				</tr>
				<tr>
					<td class="table-light">배송비</td>
					<td class="text-primary"><fmt:formatNumber value="${order.deliveryCharge}"/></td>
					<td class="table-light">배송업체</td>
					<td>${order.deliveryName}</td>
					<td class="table-light">송장번호</td>
					<td>${order.invoiceNumber}</td>
					<td class="table-light">상태변경일</td>
					<td>${order.orderStateDate}</td>
				</tr>
				<tr>
					<td class="table-light">결제구분</td>
					<td>${order.payMethod}</td>
					<td class="table-light">결제카드</td>
					<td>${order.cardName}</td>
					<td class="table-light">결제승인번호</td>
					<td>${order.authNumber}</td>
					<td class="table-light">승인일자</td>
					<td>${order.authDate}</td>
				</tr>
			</table>
			<table class="table table-borderless mb-1">
				<tr>
					<td width="50%">
						<c:if test="${order.orderState < 3}">
							<button type="button" class="btn btn-light btn-cancel-order" data-orderNum="${order.orderNum}">판매취소</button>
						</c:if>
					</td>
					<td class="text-end">
						<c:if test="${order.orderState == 0}">
							<button type="button" class="btn btn-light btn-prepare-pay" data-orderNum="${order.orderNum}">입금확인</button>
						</c:if>
						<c:if test="${order.orderState == 1}">
							<button type="button" class="btn btn-light btn-prepare-order" data-orderNum="${order.orderNum}">발송처리</button>
						</c:if>
					
						<div class="row justify-content-end delivery-update-area">
							<c:if test="${order.orderState > 1 && order.orderState < 5 }">
								<div class="col-auto">
									<select class="form-select delivery-select">
										<option value="2" ${order.orderState==2?"selected":"" }>발송준비</option>
										<option value="3" ${order.orderState==3?"selected":"" }>배송시작</option>
										<option value="4" ${order.orderState==4?"selected":"" }>배송중</option>
										<option value="5" ${order.orderState==5?"selected":"" }>배송완료</option>
									</select>
								</div>
								<div class="col-auto">
									<button type="button" class="btn btn-light btn-delivery-order" data-orderNum="${order.orderNum}" data-orderState="${order.orderState}">배송변경</button>
								</div>
							</c:if>
							<c:if test="${order.orderState == 5}">
								<div class="col-auto">
									<label>배송완료 일자 : ${order.orderStateDate}</label>
								</div>
							</c:if>
							
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="mt-2 border-top pt-2">	
		<div class="p-3 shadow bg-body rounded">
			<p class="fs-6 fw-semibold mb-0">주문 상세정보</p> 
		</div>
		<div class="mt-3 p-3">
			
			<table class="table board-list order-detail-list">
				<thead class="table-light">
					<tr>
						<th width="80">상세번호</th>
						<th>상품명</th>
						<th width="90">상품가격</th>
						<th width="90">할인가격</th>
						<th width="130">옵션</th>
						<th width="80">주문수량</th>
						<th width="100">주문총금액</th>
						<th width="90">적립금</th>
						<th width="110">주문상태</th>
						<th width="60">변경</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${listDetail}" varStatus="status">
						<tr valign="middle" id="orderDetail-list${dto.orderDetailNum}">
							<td>${dto.orderDetailNum}</td>
							<td>${dto.productName}</td>
							<td><fmt:formatNumber value="${dto.price}"/></td>
							<td><fmt:formatNumber value="${dto.salePrice}"/></td>
							<td>${dto.optionValue} / ${dto.optionValue2}</td>
							<td>${dto.qty}</td>
							<td><fmt:formatNumber value="${dto.productMoney}"/></td>
							<td><fmt:formatNumber value="${dto.savedMoney}"/></td>
							<td>${order.orderState==1 && dto.detailState==0?"상품준비중":dto.detailStateInfo}</td>
							<td >
								<c:if test="${ order.orderState < 2}">
									<span class="orderDetailStatus-cancel" 
											data-orderNum="${order.orderNum}" 
											data-orderState="${order.orderState}"
											data-productMoney="${dto.productMoney}"
											data-orderDetailNum="${dto.orderDetailNum}" 
											data-detailState="${dto.detailState}"
											data-productNum="${dto.productNum}"
											data-detailNum="${dto.detailNum}"
											data-detailNum2="${dto.detailNum2}"
											data-cancelAmount="${dto.qty}">판매취소</span>
								</c:if>
								<span class="orderDetailStatus-update" 
										data-orderNum="${order.orderNum}" 
										data-orderState="${order.orderState}"
										data-productMoney="${dto.productMoney}"
										data-orderDetailNum="${dto.orderDetailNum}" 
										data-detailState="${dto.detailState}">수정</span>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		
		</div>
	</div>
</div>

<!-- 입금확인 대화상자 -->
<div class="modal hidden" id="payDialogModal" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Modal title</h5>
				<button type="button" class="btn-close closeModal" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<p>입금이 제대로 되었는지 확인했습니까?</p>
			</div>
			<div class="modal-footer">
				<form name="payCheckForm">
					<input type="hidden" name="orderNum" value="${ order.orderNum }">
					<input type="hidden" name="orderState" value="1">
				</form>
				<button type="button" class="btn btn-secondary closeModal" data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary payCheckBtn">입금 확인 완료</button>
			</div>
		</div>
	</div>
</div>

<!-- 발송처리 대화상자 -->
<div class="modal hidden" id="prepareDialogModal" tabindex="-1" aria-labelledby="prepareDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="prepareDialogModalLabel">발송처리</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<form class="row text-center" name="invoiceNumberForm">
					<div class="col-auto p-1">
						<select name="deliveryName" class="form-select">
							<c:forEach var="vo" items="${listDeliveryCompany}">
								<option>${vo.DELIVERYNAME}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col p-1">
						<input name="invoiceNumber" type="text" class="form-control" placeholder="송장번호입력">
					</div>
					<div class="col-auto p-1">
						<input type="hidden" name="orderNum" value="">
						<input type="hidden" name="orderState" value="2">
						<button type="button" class="btn btn-light btnInvoiceNumberOk">변경완료</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- 주문상세정보-상태변경/상태확인 대화상자  -->
<div class="modal hidden" id="orderDetailStateDialogModal" tabindex="-1" aria-labelledby="orderDetailStateDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="orderDetailStateDialogModalLabel">주문상세정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<div class="mt-1 p-1">
					<div class="p-1"><p class="form-control-plaintext optionDetail-value"></p></div>
					<table class="table board-list">
						<thead class="table-light">
							<tr>
								<td width="50">코드</td>
								<td width="120">구분</td>
								<td width="90">작성자</td>
								<td width="120">날짜</td>
								<td>설명</td>
							</tr>
						</thead>
						<tbody class="detailState-list"></tbody>	
					</table>
				</div>
				
				<div class="p-1 detailStateUpdate-form">
					<form name="detailStateForm" class="row justify-content-center">
						<div class="col-auto p-1">
							<select name="detailState" class="form-select"></select>
						</div>
						<div class="col-6 p-1">
							<input type="text" name="stateMemo" class="form-control" placeholder="상태 메시지 입력">
						</div>
						<div class="col-auto p-1">
							<input type="hidden" name="orderNum">
							<input type="hidden" name="orderDetailNum">
							<input type="hidden" name="productMoney">
							<input type="hidden" name="cancelAmount">
							<button type="button" class="btn btn-light btnDetailStateUpdateOk"> 변경 </button>
						</div>
					</form>
				</div>
				
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
}

function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			dataType: dataType,
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

// 입금확인 대화상자
$(function(){
	$(".btn-prepare-pay").on("click", function(){
		
		$("#payDialogModal").show();
	});
});

// 입금확인 완료
$(function() {
	$('.payCheckBtn').click(function(){
		
		if(! confirm('금액이 정확히 입금되었습니까?')) {
			return false;
		}
		
		let param = $('form[name=payCheckForm]').serialize();
		let url = '${pageContext.request.contextPath}/admin/shopOrder/detail/pay';
		
		const fn = function(data) {
			console.log(data);
			//const f = document.payCheckForm;
			if(data.state === "true") {
				//f.reset();
				$("#payDialogModal").hide();
				let url = "${pageContext.request.contextPath}/admin/shopOrder/status";
				location.href = url;
			} else {
				alert("발송처리가 실패 했습니다.");
			}
		};
		ajaxFun(url, "post", param, "json", fn);
	});
});

//발송처리 대화상자(송장번호 입력)
$(function(){
	$(".btn-prepare-order").on("click" ,function(){
		let orderNum = $(this).attr("data-orderNum");
		
		document.invoiceNumberForm.orderNum.value = orderNum;
		
		$("#prepareDialogModal").show();
	});
});

//송장번호 등록
$(function(){
	$(".btnInvoiceNumberOk").click(function(){
		const f = document.invoiceNumberForm;
		if(! f.invoiceNumber.value.trim()) {
			alert('송장 번호를 입력하세요');
			return false;
		}
		
		let param = $('form[name=invoiceNumberForm]').serialize();
		let url = '${pageContext.request.contextPath}/admin/shopOrder/detail/invoiceNumber';
		// qs : deliveryName : 택배회사 이름, invoiceNumber : 운송장 번호, orderNum : 주문번호, orderState : 주문상태
		
		const fn = function(data) {
			console.log(data);
			if(data.state === "true") {
				
				f.reset();
				
				$("#prepareDialogModal").hide();
				// $("#orderDialogModal").modal("hide");
				
				let url2 = "${pageContext.request.contextPath}/admin/shopOrder/status";
				location.href = url2;
			} else {
				alert("발송처리가 실패 했습니다.");
			}
		};
		
		ajaxFun(url, "post", param, "json", fn);
	});
});

//배송 변경(배송중/배송완료)
$(function(){
	$(".btn-delivery-order").on("click", function(){
		const $EL = $(this);
		let orderNum = $EL.attr("data-orderNum");
		let preState = $EL.attr("data-orderState");
		
		let orderState = $EL.closest(".delivery-update-area").find("select").val();
		let orderStateInfo = $EL.closest(".delivery-update-area").find("select option:selected").text();
		
		if(preState >= orderState) {
			alert('배송 변경은 현 배송 단계보다 적거나 같을수 없습니다.');
			return false;
		}
		
		let query = 'orderNum=' + orderNum + '&orderState=' + orderState;
		let url = '${pageContext.request.contextPath}/admin/shopOrder/detail/delivery';

		const fn = function(data) {
			if(data.state === "true") {
				
				// $("#orderDialogModal").modal("hide");
				
				let url = "${pageContext.request.contextPath}/admin/shopOrder/status";
				location.href = url;
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

//판매 취소
$(function(){
	$('.orderDetailStatus-cancel').on('click', function(){
		let orderNum = $(this).attr('data-orderNum');
		let orderDetailNum = $(this).attr('data-orderDetailNum');
		let productNum = $(this).attr('data-productNum');
		let detailNum = $(this).attr('data-detailNum');
		let detailNum2 = $(this).attr('data-detailNum2');
		let orderState = $(this).attr('data-orderState');
		let cancelAmount = $(this).attr('data-cancelAmount');
		
		console.log(orderNum);
		console.log(orderDetailNum);
		console.log(productNum);
		console.log(detailNum);
		console.log(detailNum2);
		console.log(orderState);
		console.log(cancelAmount);
		
		alert('구매내역 판매취소');
		
		if (!confirm("제품 판매 취소하시겠습니까?")) {
			return false;
		}
		
		let query = {orderNum:orderNum, 
					orderDetailNum:orderDetailNum,
					productNum:productNum, 
					detailNum:detailNum, 
					detailNum2:detailNum2, 
					orderState:orderState, 
					cancelAmount:cancelAmount};
		let url = '${pageContext.request.contextPath}/admin/shopOrder/detail/cancel';
		
		const fn = function(data) {
			if(data.state === "true") {
				alert('취소완료');
			}
		};
		
		ajaxFun(url, "get", query, "json", fn);
	});
});

//주문상세 - 상태확인/변경
$(function(){
	$('.orderDetailStatus-update').on('click', function(){
		const f = document.detailStateForm;
		f.reset();
		
		let orderNum = $(this).attr("data-orderNum");
		let orderState = $(this).attr("data-orderState");
		let orderDetailNum = $(this).attr("data-orderDetailNum");
		let detailState = $(this).attr("data-detailState");
		let productMoney = $(this).attr("data-productMoney");
		let cancelAmount = $(".order-cancelAmount").attr("data-cancelAmount");
		
		f.orderNum.value = orderNum;
		f.orderDetailNum.value = orderDetailNum;
		f.productMoney.value = productMoney;
		f.cancelAmount.value = cancelAmount;
		
		let opt = $(this).closest("tr").find("td").eq(4).text();

		let $SELECT = $('form[name=detailStateForm] select[name=detailState]');
		$('form[name=detailStateForm] select[name=detailState] option').remove();
		
		if(orderState==="6") {
			// 주문상태-판매취소
			$(".detailStateUpdate-form").hide();
		} else if(detailState==='1' || detailState==='2' || detailState==='3' || detailState==='5' || detailState==='12') {
			// 주문상세상태- 구매확정,자동구매확정,취소완료,반품완료,판매취소
			$SELECT.append('<option value="14">기타</option>');
		} else if(detailState==='4') { // 주문상세상태-주문취소요청
			$SELECT.append('<option value="5">주문취소완료</option>');
		} else if(detailState==='6'){ // 주문상세상태-교환요청
			$SELECT.append('<option value="7">교환접수</option>');
			$SELECT.append('<option value="8">교환발송완료</option>');
			$SELECT.append('<option value="9">교환불가</option>');
		} else if(detailState==='10'){ // 주문상세상태-반품요청
			$SELECT.append('<option value="11">반품접수</option>');
			$SELECT.append('<option value="12">반품완료</option>');
			$SELECT.append('<option value="13">반품불가</option>');
		} else {
			 // 배송완료
			if(orderState==="5") {
				$SELECT.append('<option value="2">자동구매확정</option>');
			}
			
			$SELECT.append('<option value="3">판매취소</option>');
			$SELECT.append('<option value="14">기타</option>');
		}
		
		$('.optionDetail-value').html('옵션 : ' + opt + ' ');
		$('#orderDetailStateDialogModal').show();
	});
	
	function listDetailState() {
		$('.detailState-list').empty();
		
		const f = document.detailStateForm;
		let orderDetailNum = f.orderDetailNum.value;
		
		let qs = 'orderDetailNum=' + orderDetailNum;
		let url = '${pageContext.request.contextPath}/admin/order/detail/listDetailState';

		const fn = function(data) {
			let out;
			for(let item of data.list) {
				out  = '<tr>';
				out += '<td>'+item.DETAILSTATE+'</td>';
				out += '<td>'+item.DETALSTATEINFO+'</td>';
				out += '<td>'+item.USERNAME+'</td>';
				out += '<td>'+item.DETAILSTATEDATE+'</td>';
				out += '<td align="left">'+item.STATEMEMO+'</td>';
				out += '</tr>';
				
				$('.detailState-list').append(out);
			}
		};
		
		ajaxFun(url, "get", qs, "json", fn);
	}
	
	const modalEl = document.getElementById('orderDetailStateDialogModal');
	modalEl.addEventListener('show.bs.modal', function(){
		// 모달 대화상자가 보일때
		listDetailState();
	});
	
	modalEl.addEventListener('hidden.bs.modal', function(){
		// 모달 대화상자가 안보일때
	});
	
	$(".btnDetailStateUpdateOk").click(function(){
		// 주문상세 상태정보변경 등록
		const f = document.detailStateForm;
		let orderDetailNum = f.orderDetailNum.value;
		let productMoney = f.productMoney.value;
		let cancelAmount = f.cancelAmount.value;
		
		// 이전상태
		let preDetailState = $("#orderDetail-list" + orderDetailNum).find("td").eq(9).attr("data-detailState");
		if(preDetailState === "3" || preDetailState === "5" || preDetailState === "12") {
			alert("판매취소 또는 반품완료 상품은 변경이 불가능합니다.");
			return false;
		}

		let changeStateInfo = $("form[name=detailStateForm] select option:selected").text();
		
		if(! f.stateMemo.value.trim()) {
			alert("상태 메시지를 등록하세요");
			f.stateMemo.focus();
			return false;
		}
		
		let qs = $('form[name=detailStateForm]').serialize();
		let url = '${pageContext.request.contextPath}/admin/order/detail/updateDetailState';

		const fn = function(data) {
			if(data.state === "true") {
				listDetailState();
				
				let detailState = data.detailState;

				$("#orderDetail-list" + orderDetailNum).find("td").eq(8).html(changeStateInfo);
				$("#orderDetail-list" + orderDetailNum).find("td").eq(9).attr("data-detailState", detailState);
				
				// 주문취소완료인 경우
				if(detailState == 3 || detailState == 5 || detailState == 12) {
					cancelAmount = parseInt(cancelAmount) + parseInt(productMoney);
					$(".order-cancelAmount").attr("data-cancelAmount", cancelAmount);
					$(".order-cancelAmount").text(cancelAmount.toLocaleString());
				}
				
				alert("정보가 변경되었습니다.");
				f.reset();
			}
		};
		
		ajaxFun(url, "post", qs, "json", fn);
		
	});
});

//모달창 닫기
$(function() {
	$('.closeModal').click(function() {
		$(this).closest(".modal").hide();
	});
	
	$('.btn-close').click(function() {
		$(this).closest(".modal").hide();
	});
});
</script>







