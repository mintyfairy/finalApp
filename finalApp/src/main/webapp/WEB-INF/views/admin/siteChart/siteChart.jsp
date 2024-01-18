<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-main {
	max-width: 930px;
}
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">


<div class="container body-container">
    <div class="inner-page">
    
    	<div class="row g-1 mt-4 p-1">
			<div class="col p-2">
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 전년 판매 현황</div>
				<div class="border rounded p-5 text-center">
					<div class="fs-5 mb-2">총 판매 건수 : 
						<span class="product-totalAmount fw-semibold text-primary">${previousYear.CNT}</span>
					</div>
					<div class="fs-5">총 판매 금액 : 
						<span class="product-totalAmount fw-semibold text-danger"><fmt:formatNumber value="${previousYear.TOT}"/></span>원
					</div>
				</div>
			</div>
			
			<div class="col p-2">
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 전월 판매 현황</div>
				<div class="border rounded p-5 text-center">
					<div class="fs-5 mb-2">총 판매 건수 : 
						<span class="product-totalAmount fw-semibold text-primary">${previousMonth.CNT}</span>
					</div>
					<div class="fs-5">총 판매 금액 : 
						<span class="product-totalAmount fw-semibold text-danger"><fmt:formatNumber value="${previousMonth.TOT}"/></span>원
					</div>
				</div>
			</div>
    	
			<div class="col p-2">
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> </div>
				<div class="border rounded p-5 text-center">
					<div class="fs-5 mb-2">총 판매 건수 : 
						<span class="product-totalAmount fw-semibold text-primary">2</span>
					</div>
					<div class="fs-5">총 판매 금액 : 
						<span class="product-totalAmount fw-semibold text-danger"><fmt:formatNumber value="1"/></span>원
					</div>
				</div>
			</div>
    	</div>
    
		<div class="row g-1 mt-4 p-1">
			<div class="col p-2">
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 최근 1주일 판매 현황</div>
				<div class="charts-day border rounded" style="height: 500px;" ></div>
			</div>
			<div class="col p-2">
				<div class="fs-6 fw-semibold mb-2 "><i class="bi bi-chevron-right"></i> <label class="charts-dayOfWeek-title">전월 요일별 판매건수</label></div>
				<div class="charts-dayOfWeek border rounded" style="height: 500px;"></div>
			</div>
			<div class="col p-2">
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 최근 6개월 판매 현황</div>
				<div class="charts-month border rounded" style="height: 500px;"></div>
			</div>
		</div>		


    </div>
</div>