<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.main{
		width: 950px;
		height: 120px;
        margin: 0 auto;
   		margin-top: 50px;
        border: 3px solid #e2e2e2;
        border-radius: 20px;
        display: flex;
        justify-content: space-between;
        padding: 0 40px;
	}
	
	
	.main div {
		margin: 0 10px;
		text-align:center;
	}
	
	.name {
		font-size: 25px;
		font-weight:bold;
	}
	
	.name span {
		color: gray;
		font-size: 20px;
		font-weight: normal;
	}

.body-container {
	max-width: 850px;
}

.nav-tabs .nav-link {
	min-width: 170px;
	background: #f3f5f7;
	border-radius: 0;
	border-right: 1px solid #dbdddf;
	color: #333;
	font-weight: 600;
}
.nav-tabs .nav-link.active {
	background: #3d3d4f;
	color: #fff;
}
.tab-pane { min-height: 300px; }

.md-img { width: 200px; height: 200px; object-fit: cover; }


.detail_table tr th { width: 60%; }

table tr td:nth-child(2) {
	text-align: left;
	padding-left: 20px;
}

</style>

<script type="text/javascript">
function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
}

function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			dataType:dataType,
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

$(function() {
	$('.detailBtn').click(function() {
		$(this).closest('div').find('#collapseExample').toggleClass('show');
	});
});
</script>

	<div class="main">
		<div style="padding-top: 20px;">
			<img class="img" src="${pageContext.request.contextPath}/resources/images/campingcar/handle.png" style="width: 60px; height: 60px;">
			<p class="name" style="line-height:80px; float:right; margin-left: 10px;">${sessionScope.member.userName}<span> 운전자님</span></p>
		</div>
	
		<div style="text-align: center; padding-top: 42px;">
			<a href="${pageContext.request.contextPath}/car/mypage/rider" style="color:#cccccc; font-size: 17px;">운전자 정보
			</a>
		</div>
		<div style="text-align: center; padding-top: 40px;">
			<a href="${pageContext.request.contextPath}/car/mypage/paymentList" style="color:black; font-size: 19px; font-weight: bold;">예약 내역
			</a>
		</div>
		<div style="text-align: center; padding-top: 42px;">
			<a href="${pageContext.request.contextPath}/car/mypage/question" style="color:#cccccc; font-size: 17px;">문의 내역
			</a>
		</div>
	</div>

<div class="container">
	<div class="body-container">	

		<ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane-1" type="button" role="tab" aria-controls="1" aria-selected="true">이용 내역</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane-2" type="button" role="tab" aria-controls="2" aria-selected="false">취소 내역</button>
			</li>
		</ul>
		<div class="tab-content pt-2" id="myTabContent">
			<div class="tab-pane fade show active" id="tab-pane-1" role="tabpanel" aria-labelledby="tab-1" tabindex="0">
				<div class="mt-3">
					<c:forEach var="dto" items="${list}">
						<div class="mt-3 p-2 border-bottom payment-list">
							<div class="row">
								<div class="pt-1 fs-4 mb-3 fw-semibold">
									<label class="text-black-50">${dto.orderDate} 예약</label>
								</div>
								<div class="col-auto">
									<img class="border rounded md-img" src="${pageContext.request.contextPath}/uploads/caravan/${dto.thumbnail}">
								</div>
								<div class="col">
									<div class="pt-1 fs-6 fw-bold">
										<div>
											<c:if test="${dto.orderState==1}">
												<span class="badge text-bg-primary">예약완료</span>
											</c:if>
											<c:if test="${dto.orderState==2}">
												<span class="badge text-bg-secondary">이용완료</span>
											</c:if>
										</div>
										${dto.start_date} ~ ${dto.end_date}
									</div>
									<div class="fw-semibold pt-2">${dto.carName}</div>
									<div class="pt-1">
										금액 : <fmt:formatNumber value="${dto.totMoney}"/>원
										<p>할인 금액 : <fmt:formatNumber value="${dto.discount}"/>원</p>
										<p>실 결제 금액 : <fmt:formatNumber value="${dto.payment}"/>원</p>
									</div>
								</div>
							</div>
							<div class="mt-3 p-3 text-end">
								<p class="d-inline-flex gap-1">
								  <a class="btn btn-dark-subtle detailBtn" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="collapseExample">
								    상세 보기
								  </a>
								</p>
								<div class="collapse" id="collapseExample" style="width: 350px; text-align: right; margin-left: 440px;">
								  <div class="card card-body">
								  	<h6 style="text-align: left; padding: 10px 0 10px 24px;">예약번호 ${dto.orderNum}</h6>
								    <table class="detail_table">
								    	<tr>
								    		<td>예약금액</td>
								    		<td>${dto.totMoney}</td>
								    	</tr>
								    	<tr>
								    		<td>할인금액</td>
								    		<td>${dto.discount}</td>
								    	</tr>
								    	<tr>
								    		<td>결제금액</td>
								    		<td>${dto.payment}</td>
								    	</tr>
								    	<tr>
								    		<td>결제수단</td>
								    		<td>${dto.payMethod}</td>
								    	</tr>
								    	<tr>
								    		<td>카드이름</td>
								    		<td>${dto.cardName}</td>
								    	</tr>
								    	<tr>
								    		<td>승인번호</td>
								    		<td>${dto.authNumber}</td>
								    	</tr>
								    	<tr>
								    		<td>결제일시</td>
								    		<td>${dto.authDate}</td>
								    	</tr>
								    </table>
								  </div>
								</div>								
							</div>
						</div>
					</c:forEach>
					
					<div class="page-navigation">
						${dataCount == 0 ? "예약 내역이 없습니다." : paging }
					</div>

				</div>				
			</div>
			<div class="tab-pane fade" id="tab-pane-2" role="tabpanel" aria-labelledby="tab-2" tabindex="0">
				
			</div>
		</div>

	</div>
</div>



<!-- 구매취소 대화상자  -->
<div class="modal fade" id="orderDetailUpdateDialogModal" tabindex="-1" aria-labelledby="orderDetailUpdateDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="orderDetailUpdateDialogModalLabel">구매취소</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<div class="p-1">
					<form name="userOrderDetailForm" method="post" class="row justify-content-center">
						<div class="col-7 p-1">
							<input type="text" name="stateMemo" class="form-control" placeholder="사유를 입력 하세요">
						</div>
						<div class="col-auto p-1">
							<input type="hidden" name="page" value="${page}">
							<input type="hidden" name="orderDetailNum">
							<input type="hidden" name="detailState">
							<button type="button" class="btn btn-light btnUserOrderDetailUpdateOk"> 요청하기 </button>
						</div>
					</form>
				</div>
				
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
