<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 예약 페이지 -->

<style type="text/css">
.body-container {
	max-width: 850px;
    margin: 0 auto;
}
.md-img {
	width: 100px; height: 100px; object-fit: cover;
}
</style>

<script type="text/javascript">

<!-- 결제부분 API 필요하면 -->

</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-credit-card"></i> 예약 / 결제 </h3>
		</div>
		
		<div class="body-main pt-3">
			<form name="paymentForm" method="post">
				<table class="table">
					<tr class="bg-light text-center">
						<th width="120">&nbsp;</th>
						<th>캠핑장</th>
						<th >방이름</th>
                        <th>체크인</th>
                        <th>체크아웃</th>			
                        <th>총금액</th>
					</tr>
					
					<c:forEach var="dto" items="${listProduct}" varStatus="status">
						<tr class="text-center" valign="middle">
							<td>
								<img class="border rounded md-img" src="${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}">
							</td>
							<td>
								<div class="fw-semibold">솔향기 캠핑장</div>
								
								<!--
								<input type="hidden" name="productNums" value="${dto.productNum}">
								<input type="hidden" name="detailNums" value="${dto.detailNum}">
								<input type="hidden" name="detailNums2" value="${dto.detailNum2}">
								<input type="hidden" name="buyQtys" value="${dto.qty}">
								<input type="hidden" name="productMoneys" value="${dto.productMoney}">
								<input type="hidden" name="prices" value="${dto.price}">
								<input type="hidden" name="salePrices" value="${dto.salePrice}">
								<input type="hidden" name="savedMoneys" value="${dto.savedMoney}">
							</td>
                                -->
							<td>
								<fmt:requestEncoding value="UTF-8"/>
								<c:out value="${방이름 }"/>

							</td>
							<td>
								<fmt:formatDate value="입실일자"/>

							</td>
							<td>
								<fmt:formatDate value="퇴실일자"/>
							</td>
							
							<td>
								<label class="fw-semibold">
									<fmt:formatNumber value="${결제금액} type="currency/>
								</label>
							</td>
                            

						</tr>
					</c:forEach>
				</table>
				
				<!-- hidden있음 추가 -->

				<div class="p-3 bg-light">
					<div class="fs-5 fw-semibold border-bottom pb-1">예약자 정보</div>
					<div class="row pt-2">
						<div class="col-auto pe-2 mt-2">
							<label class="fw-semibold fs-6">김아무개</label> <label class="text-primary">기본 등록정보</label>
						</div>
						<div class="col-auto">
							<button type="button" class="btn border"> 등록 정보변경 </button>
						</div>
					</div>
					<div class="pt-2">
						<div class="pt-2"> 예약일자: 2024.01.12</div>
						<div class="pt-2">010-1111-1111</div>
						<div class="pt-2 w-50">
						
							<!-- hidden내역 있음 추가 -->
							
							<input type="text" name="destMeno" class="form-control" placeholder="요청사항을 입력합니다.">
						</div>
					</div>
				</div>
				
				<div class="pt-3">
					<div class="text-end">
						<label class="fs-6 fw-semibold">총 결제금액 : </label>
						<label class="product-totalAmount fs-4 fw-bold text-primary">
							<fmt:formatNumber value="${payment}"/>150,000원
						</label>
					</div>
					
				</div>								
				
				<div class="pt-3 pb-3 text-center">
					<button type="button" class="btn btn-primary btn-lg" style="width: 250px;" onclick="sendOk()">결제하기</button>
					<button type="button" class="btn btn-light btn-lg" style="width: 250px;" onclick="location.href='${pageContext.request.contextPath}/';">결제취소</button>
				</div>
			</form>
		</div>
	</div>
</div>



