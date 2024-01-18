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
			<form name="paymentForm" method="post" action="${pageContext.request.contextPath}/campsite/go">
				<table class="table">
					<tr class="bg-light text-center">
						<th width="120">&nbsp;</th>
						<th>캠핑장</th>
						<th>방이름</th>
                        <th>체크인</th>
                        <th>체크아웃</th>			
                        <th>총금액</th>
					</tr>
					
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr class="text-center" valign="middle">
							<td>
								<img class="border rounded md-img" src="${pageContext.request.contextPath}/uploads/room/${dto.thumbnail}">
							</td>
							<td>
								${dto.siteName}
								
								
								
							</td>
                                
							<td>
								${dto.detailName }

							</td>
							<td>
									${dto.startDate }
							</td>
							<td>
								${dto.endDate }
							</td>
							
							<td>
								<label class="fw-semibold">
									<fmt:formatNumber value="${dto.periodPrice }"/>
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
							<label class="fs-6 fw-semibold">이름 : </label>
							<label class="fw-semibold fs-6">${member.userName}</label> 
						</div>
					</div>
					<div class="pt-2">
						<div class="pt-2"> 예약일자: ${nowdate }</div>
						<div class="pt-2"> 전화번호: ${member.tel}</div>
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
							<fmt:formatNumber value="${totalPrice}"/>
						</label>
					</div>
					
				</div>								
				
				<div class="pt-3 pb-3 text-center">
					<button type="submit" class="btn btn-primary btn-lg" style="width: 250px;" >결제하기</button>
					<button type="button" class="btn btn-light btn-lg" style="width: 250px;" onclick="location.href='${pageContext.request.contextPath}/';">결제취소</button>
					<input type="hidden" name="listNum" value="${listNum}">
					<input type="hidden" name="totalPrice" value="${totalPrice}">
	 				<input type="hidden" name="perchaseMethod" value="${perchaseMethod}">
				</div>
			</form>
		</div>
	</div>
</div>



