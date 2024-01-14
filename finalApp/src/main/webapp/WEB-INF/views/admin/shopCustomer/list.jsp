<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
.body-container {
	max-width: 1080px;
	margin: 10px auto;
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-chat-right-text"></i> 상품 리뷰 </h3>
		</div>
		
		<div class="body-main">

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
			
			<table class="table table-borderless board-list">
				<thead class="table-light">
					<tr class="border-bottom1">
						<th width="100">답변상태</th>
						<th>내용</th>
						<th width="100">작성자</th>
						<th width="100">작성일</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr class="item-basic-content border-bottom">
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
				</tbody>
			</table>
			
			<div class="page-navigation">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>

		</div>
	</div>
</div>