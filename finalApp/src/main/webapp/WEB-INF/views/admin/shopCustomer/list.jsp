<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
.body-container {
	max-width: 1080px;
	margin: 10px auto;
}

.nav-tabs .nav-link {
	min-width: 110px;
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

.tab-pane {
	min-height: 300px;
}

.table .ellipsis {
	position: relative;
	min-width: 200px;
}
.table .ellipsis span {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	position: absolute;
	left: 9px;
	right: 9px;
	cursor: pointer;
}
.table .ellipsis:before {
	content: '';
	display: inline-block;
}

.page-navigation {
	margin: 0 auto;
	display: flex;
	justify-content: center;
	align-content: center;
}

.score-star { font-size: 0; letter-spacing: -4px; }
.score-star .item {
	font-size: 22px; letter-spacing: 1px; display: inline-block;
	color: #ccc; text-decoration: none; vertical-align: middle;
}
.score-star .item:first-child{ margin-left: 0; }
.score-star .on { color: #00D8FF; }

.md-img img { width: 150px; height: 150px; cursor: pointer; object-fit: cover; }

.item-basic-content { cursor: pointer; }
.item-detail-content { display: none; }

.answer-form textarea { width: 100%; height: 75px; resize: none; }

.answerReview, .deleteReview { cursor: pointer; padding-left: 5px; }
.answerReview:hover, .deleteReview:hover { font-weight: 500; color: #2478FF; }
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
// 탭
$(function(){
	$("button[role='tab']").on('click', function(){
		let tabs = $(this).attr("aria-controls");
		
		if(tabs === 1) {
			location.href="${pageContext.request.contextPath}/admin/shopCustomer/list?tab=1";
		} else if(tabs === 2) {
			location.href="${pageContext.request.contextPath}/admin/shopCustomer/list?tab=2";
		}
	});
});
</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-chat-right-text"></i> 상품 리뷰 </h3>
		</div>
		
		<div class="body-main">
			<ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link ${tab=='1'?'active':''}" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="1" aria-selected="${tab==1?'true':'false'}">모든상품</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link ${tab=='2'?'active':''}" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="2" aria-selected="${tab==2?'true':'false'}">특가상품</button>
				</li>
			</ul>
			
			<!-- 
	        <div class="row board-list-header">
	            <div class="col-auto me-auto ">
	            	<div class="btn-group" role="group">
	            		<button type="button" class="btn btnSearctList ${mode==1?'fw-semibold text-primary':'' }" data-mode="1"> 전체 </button>
	            		<button type="button" class="btn btnSearctList ${mode==2?'fw-semibold text-primary':'' }" data-mode="2"> 답변완료 </button>
	            		<button type="button" class="btn btnSearctList ${mode==3?'fw-semibold text-primary':'' }" data-mode="3"> 미답변 </button>
	            	</div>
	            </div>
	            <div class="col-auto pt-2">
	            	<span>${dataCount}개(${page}/${total_page} 페이지)</span>
	            </div>
	        </div>
	         -->
		<div class="tab-content pt-4" id="myTabContent">
			<div class="tab-pane fade show active" id="tab-pane" role="tabpanel" aria-labelledby="tab-1" tabindex="0">
				<div class="row mb-2">
				<!-- 
					<c:if test="${ tab == 1 }">
					<div id="option_wrap" class="col">
						<div class="row text-end">
							<div class="col-auto pe-1">
								<select id="changeCategory" class="form-select" onchange="changeList();">
									<c:if test="${listCategory.size() == 0}">
										<option value="0">:: 텐트 ::</option>
									</c:if>
									<option value="0">대분류</option>
									<c:forEach var="vo" items="${listCategory}">
										<option value="${vo.categoryNum}" ${parentNum==vo.categoryNum?"selected":""}>${ vo.categoryName }</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-auto pe-1">
								<select id="changeSubCategory" class="form-select" onchange="changeSubList();">
									<c:if test="${listSubCategory.size() == 0}">
										<option value="0">:: 베이직 텐트 ::</option>
									</c:if>
									<option value="0">상세분류</option>
									<c:forEach var="vo" items="${listSubCategory}">
										<option value="${vo.categoryNum}" ${categoryNum==vo.categoryNum?"selected":""}>${ vo.categoryName }</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-auto pe-1">
								<select id="changeBrand" class="form-select" onchange="changeList();">
									<c:if test="${listBrand.size() == 0}">
										<option value="0">:: 브랜드 ::</option>
									</c:if>
									<option value="0">브랜드</option>
									<c:forEach var="vo" items="${listBrand}">
										<option value="${vo.brandNum}" ${brandNum==vo.brandNum?"selected":""}>${vo.brandName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-auto ps-1">
								<select id="changeShowProduct" class="form-select" onchange="changeList();">
									<option value="-1">:: 숨김 여부 ::</option>
									<option value="1" ${productShow==1?"selected":""}>상품 진열</option>
									<option value="0" ${productShow==0?"selected":""}>상품 숨김</option>
								</select>						
							</div>
						</div>
					</div>
					</c:if>
					 -->
					<div class="col-auto pt-2 text-end">
						${ dataCount }개(${ page }/${ total_page } 페이지)
					</div>
				</div>
					<table class="table table-borderless board-list" style="width: 1080px;">
						<colgroup>
							<col width="100">
							<col width="*">
							<col width="100">
							<col width="100">
						</colgroup>
						<thead class="table-light">
							<tr class="border-top border-dark table-light">
								<th>답변상태</th>
								<th>내용</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						
						<tbody>
							<c:choose>
								<c:when test="${ tab == 1 }">
									<c:forEach var="dto" items="${list}" varStatus="status">
										<tr class="middle">
											<td>
												${not empty dto.answer ? '<span class="text-primary">답변완료</span>' : '<span class="text-secondary">답변대기</span>'}
											</td>
											<td class="left ellipsis">
												<span>${fn:replace(dto.review, "<br>", "")}</span>
											</td>
											<td>${dto.userName}</td>
											<td>${fn:substring(dto.reviewDate, 0, 10)}</td>
										</tr>
										<tr class="item-detail-content">
											<td colspan="6" class="left p-0">
												<div class="border-bottom p-2 px-3">
													<div class="bg-light p-2">
														<div>
															<div class="p-2 pb-0 fw-semibold">
																${dto.productName}(${dto.optionValue}/${dto.optionValue2})
															</div>
															
															<div class="row p-2">
																<div class="col-auto pt-0 ps-2 pe-1 score-star">
																	<c:forEach var="n" begin="1" end="5">
																		<span class="item fs-6 ${dto.score>=n ? 'on' : ''}"><i class="bi bi-star-fill"></i></span>
																	</c:forEach>
																</div>
																<div class="col text-end">
																	<span>${dto.reviewDate}</span>
																	|<span class="deleteReview" data-num="${dto.orderDetailNum}">삭제</span>
																	|<span class="answerReview" data-num="${dto.orderDetailNum}" data-showReview="${dto.showReview}">답변</span>
																</div>
															</div>
															
															<div class="p-2">${dto.review}</div>
															
															<c:if test="${not empty dto.listFilename}">
																<div class="row gx-1 mt-2 mb-1 p-1">
																	<c:forEach var="filename" items="${dto.listFilename}">
																		<div class="col-md-auto md-img">
																			<img class="border rounded" src="${pageContext.request.contextPath}/uploads/review/${filename}">
																		</div>
																	</c:forEach>
																</div>
															</c:if>
															
														</div>
														
														<c:if test="${not empty dto.answer}">
															<div class="p-2 pt-0 border-top">
																<div class="bg-light">
																	<div class="p-3 pb-0">
																		<label class="text-bg-primary px-2"> 관리자 </label> <label>${dto.answerDate}</label>
																	</div>
																	<div class="p-3 pt-1 pb-1 answer-content">${dto.answer}</div>
																</div>
															</div>						
														</c:if>
														
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:when test="${ tab == 2 }">
								</c:when>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="page-navigation">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>

		</div>
	</div>
</div>