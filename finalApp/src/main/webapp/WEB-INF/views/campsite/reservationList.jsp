<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style type="text/css">

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

.md-img { width: 100px; height: 100px; object-fit: cover; }

.payment-dropdown, .payment-delete { cursor: pointer; }
.payment-dropdown:hover, .payment-delete:hover { color: #0d6efd; }

.payment-menu {
	display: none; position: absolute; width: 100px; min-height: 65px; background:#fff; border: 1px solid #d5d5d5; border-radius: 3px; z-index: 9999;
}
.payment-menu-item { text-align: center; cursor: pointer; padding: 7px; }
.payment-menu-item:nth-child(1) { border-bottom: 1px solid #d5d5d5; }
.payment-menu-item:hover { color: #0d6efd; font-weight: 500; }

.review-form textarea { width: 100%; height: 75px; resize: none; }
.review-form .star { font-size: 0; letter-spacing: -4px; }
.review-form .star a {
	font-size: 22px; letter-spacing: 1px; display: inline-block;
	color: #ccc; text-decoration: none;
}
.review-form .star a:first-child { margin-left: 0; }
.star a.on { color: #FFBB00; }

.review-form .img-grid {
	display: grid;
	grid-template-columns:repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.review-form .img-grid .item {
	object-fit:cover;
	width: 50px; height: 50px; border-radius: 10px;
	border: 1px solid #c2c2c2;
	cursor: pointer;
}

</style>


<script type="text/javascript">
	<!-- function추가 -->
	
	
</script>



<div class="container">
	<div class="body-container">	

		<ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane-1" type="button" role="tab" aria-controls="1" aria-selected="true">예약 내역</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane-2" type="button" role="tab" aria-controls="2" aria-selected="false">예약취소 내역</button>
			</li>			
		</ul>

		<div class="tab-content pt-2" id="myTabContent">
			<div class="tab-pane fade show active" id="tab-pane-1" role="tabpanel" aria-labelledby="tab-1" tabindex="0">
				<div class="mt-3 pt-3 border-bottom">
					<p class="fs-4 fw-semibold">예약 내역</p> 
				</div>
				<div class="mt-3">

					<c:forEach var="dto" items="${dto.##}">
						<div class="mt-3 p-2 border-bottom payment-list">
							<div class="row pb-2">
								<div class="col-6">
									<div class="fs-6 fw-semibold text-black-50"><label> ${이용완료 (이용상태여부 없으면 삭제)} </label><label></label></div>
								</div>
								<div class="col-6 text-end">
									<label class='payment-delete' title="주문내역삭제" data-orderDetailNum="${dto.##}"><i class="bi bi-x-lg"></i></label>
								</div>
							</div>
							<div class="row">
								<div class="col-auto">
									<img class="border rounded md-img" src="${pageContext.request.contextPath}/경로/경로/dto.썸네일">
								</div>
								<div class="col">
									<div class="pt-1">
										<label class="text-black-50">${2024.01.12 (구매일자부분)} </label>
									</div>
									<div class="fw-semibold pt-2">${dto.푸른바다 캠핑장}</div>
									<div class="pt-1">
										<label>예약한 사이트(방) : ${사이드 오션뷰 A-12}</label>
										
									</div>									
								</div>
							</div>
							<div class="mt-3 p-3 text-end">


								<!--이용완료면 리뷰쓰기, 이용 전이면 이용 전 버튼 생성  혹은 alert창으로 이용 전입니다 띄우기-->						
								<button type="button" class="btn border btnReviewWriteForm" style="width: 130px;"> 리뷰작성</button>
								
								<button type="button" class="btn border" style="width: 130px;" data-orderDetailNum="${dto.##}"> 상세내역 </button>
																						
								<button type="button" class="btn border" style="width: 130px;" onclick="location.href='${pageContext.request.contextPath}/product/${dto.##}';"> 다시예약 </button>
							</div>
							
							
								<!-- 리뷰쓰기 -->
								<div class="review-form border border-secondary p-3 mt-2" style="display: none;">
									<form name="reviewForm">
										<div class="p-1">
											<p class="star">
												<a href="#" class="on"><i class="bi bi-star-fill"></i></a>
												<a href="#" class="on"><i class="bi bi-star-fill"></i></a>
												<a href="#" class="on"><i class="bi bi-star-fill"></i></a>
												<a href="#" class="on"><i class="bi bi-star-fill"></i></a>
												<a href="#" class="on"><i class="bi bi-star-fill"></i></a>
												<input type="hidden" name="score" value="5">
												<input type="hidden" name="productNum" value="${dto.productNum}">
											</p>
										</div>
										<div class="p-1">
											<textarea name="review" class="form-control"></textarea>
										</div>
										<div class="p-1">
											<div class="img-grid">
												<img class="item img-add" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
											</div>
											<input type="file" name="selectFile" accept="image/*" multiple class="form-control" style="display: none;">
										</div>
										<div class="p-1 text-end">
											<input type="hidden" name="num" value="${dto.orderDetailNum}">
											<button type="button" class="btn btn-dark btnReviewSend ps-5 pe-5">등록하기</button>
										</div>
									</form>
								</div>
						</div>
					</c:forEach>
					
					<div class="page-navigation">
						${dataCount == 0 ? "주문 내역이 없습니다." : paging }
					</div>
				</div>				
			</div>
			<div class="tab-pane fade" id="tab-pane-2" role="tabpanel" aria-labelledby="tab-2" tabindex="0">
				<div class="mt-3 pt-3 border-bottom">
					<p class="fs-4 fw-semibold">예약 취소 내역</p> 
				</div>
				<div class="mt-3">
					<p> 예약 취소 내역 입니다. </p>
				</div>
			</div>
		</div>

	</div>
</div>








