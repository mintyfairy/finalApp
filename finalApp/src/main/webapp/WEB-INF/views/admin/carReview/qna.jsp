<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style type="text/css">
.body-container {
	max-width: 1080px;
	margin-top: 60px;
	padding-left: 250px;
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

 /*
.table tr {
	border-bottom: 1px solid #dedede;
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
*/

.page-navigation {
	margin: 0 auto;
	display: flex;
	justify-content: center;
	align-content: center;
}

.hidden {
	display: none;
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
/* .item-detail-content { display: none; } */

.answer-form textarea { width: 100%; height: 75px; resize: none; }

.answerQuestion, .deleteQuestion { cursor: pointer; padding-left: 5px; }
.answerQuestion:hover, .deleteQuestion:hover { font-weight: 500; color: #2478FF; }
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
// 모드 : 전체, 미답변, 답변완료
$(function(){
	$('#changeMode').change(function(){
		let mode = $(this).val();
		let col = $('#changeSort option:selected').val()
		let url = '${pageContext.request.contextPath}/admin/carQna/qna';
		
		url += '?mode=' + mode + "&col=" + col;
		location.href = url;
	});
});

// 출력순서 : 최신질문순, 최신답변순, 상품번호순
$(function(){
	$('#changeSort').change(function(){
		let mode = $('#changeMode option:selected').val()
		let col = $(this).val();
		let url = '${pageContext.request.contextPath}/admin/carQna/qna';
		
		url += '?mode=' + mode + "&col=" + col;
		location.href = url;
	});
});

$(function(){
	$('.deleteQuestion').click(function(){
		let qnaNum = $(this).attr('data-num');
		let mode = $('#changeMode option:selected').val();
		let col = $('#changeSort option:selected').val();
		console.log(qnaNum + ', ' + mode + ', ' + col);
				
		if(confirm('게시글을 삭제 하시겠습니까 ? ')) {
			let query = 'page=${page}&mode=' + mode + '&col=' + col + '&qnaNum=' + qnaNum;
			location.href = '${pageContext.request.contextPath}/admin/carQna/qna/delete?' + query;
		}
	});
});
</script>

<!-- <div class="container"> -->
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-chat-right-text" style="font-size:23px;"></i> 캠핑카 문의 </h3>
		</div>
		
		<div class="body-main">
			<div class="tab-content pt-4" id="myTabContent">
		        <div class="row board-list-header">
		            <div class="col-auto me-auto">
		            	<div class="btn-group" role="group">
							<select id="changeMode" name="mode" class="form-select">
									<option value="1" ${ mode == 1 ? 'selected' : '' }>:: 전체 ::</option>
									<option value="2" ${ mode == 2 ? 'selected' : '' }>:: 답변완료 ::</option>
									<option value="3" ${ mode == 3 ? 'selected' : '' }>:: 미답변 ::</option>
							</select>
		            	</div>
		            </div>
		            <div class="col-auto pt-2">
						<select id="changeSort" name="col" class="form-select">
								<option value="question_date" ${ col == 'question_date' ? 'selected' : '' }>:: 최신순 ::</option>
								<option value="answer_date" ${ col == 'answer_date' ? 'selected' : '' }>:: 최신답변순 ::</option>
								<option value="carNum" ${ col == 'carNum' ? 'selected' : '' }>:: 상품번호순 ::</option>
						</select>
		            </div>
		        </div>
				<div class="tab-pane fade show active" id="tab-pane" role="tabpanel" aria-labelledby="tab-1" tabindex="0">
					<div class="row mb-2">
						<div class="col-auto pt-2 text-end">
							${ dataCount }개(${ page }/${ total_page } 페이지)
						</div>
					</div>
						<table class="table table-border table-list" style="width: 1080px;">
							<colgroup>
								<col width="130">
								<col width="*">
								<col width="130">
								<col width="150">
							</colgroup>
							<thead>
								<tr>
									<th>답변상태</th>
									<th>내용</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>
							
							<tbody>
								<c:forEach var="dto" items="${list}" varStatus="status">
									<tr class="middle">
										<td>
											${not empty dto.answer ? '<span class="text-primary">답변완료</span>' : '<span class="text-secondary">답변대기</span>'}
										</td>
										<td class="left ellipsis list-subject">
											<span>${fn:replace(dto.question, "<br>", "")}</span>
										</td>
										<td>${dto.userId}</td>
										<td>${fn:substring(dto.question_date, 0, 10)}</td>
									</tr>
									<tr class="item-detail-content hidden">
										<td colspan="4" class="left p-0">
											<div class="border-bottom p-2 px-3">
												<div class="bg-light p-2">
													<div>
														<div class="p-2 pb-0 fw-semibold">
															${dto.carName}
														</div>
														
														<div class="row p-2">
															<div class="col text-end">
																<span>${dto.question_date}</span>
																|<span class="deleteQuestion" data-num="${dto.qnaNum}">삭제</span>
																|<span class="answerQuestion" data-num="${dto.qnaNum}" data-enabled="${dto.enabled}">${ not empty dto.answer ? '답변수정' : '답변' }</span>
															</div>
														</div>
														
														<div class="p-2">${dto.question}</div>
														
														<c:if test="${not empty dto.listFilename}">
															<div class="row gx-1 mt-2 mb-1 p-1">
																<c:forEach var="filename" items="${dto.listFilename}">
																	<div class="col-md-auto md-img">
																		<img class="border rounded" src="${pageContext.request.contextPath}/uploads/carQna/question/${filename}">
																	</div>
																</c:forEach>
															</div>
														</c:if>
														
													</div>
													
													<c:if test="${not empty dto.answer}">
														<div class="p-2 pt-0 border-top">
															<div class="bg-light">
																<div class="p-3 pb-0">
																	<label class="text-bg-primary px-2"> 관리자 </label> <label>${dto.answer_date}</label>
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
					</div>
				</div>
			
				<div class="page-navigation">
					${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
				</div>

		</div>
	</div>
<!-- </div> -->

<div class="modal hidden" id="answerDialogModal" tabindex="-1" 
		data-bs-backdrop="static" data-bs-keyboard="false"
		aria-labelledby="answerDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="answerDialogModalLabel">상품 문의 답변</h5>
				<button type="button" class="btn-close btnAnswerSendCancel" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="p-2 answer-form">
					<form name="answerForm" method="post">
						<div class="row">
							<div class="col">
								<span class="fw-bold">답변 달기</span>
							</div>
							<div class="col-3 text-end">
								<input type="checkbox" name="enabled" id="enabled1" class="form-check-input" 
									value="1">
								<label class="form-check-label" for="enabled1">표시</label>
							</div>
						</div>
						<div class="p-1">
							<input type="hidden" name="qnaNum">
							<input type="hidden" name="mode" value="${mode}">
							<input type="hidden" name="page" value="${page}">
							<input type="hidden" name="col" value="${col}">
							<textarea name="answer" id="answer" class="form-control"></textarea>
						</div>
					</form>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary btnAnswerSendOk">답변등록 <i class="bi bi-check2"></i> </button>
				<button type="button" class="btn btn-secondary btnAnswerSendCancel" data-bs-dismiss="modal">취소</button>
			</div>			
		</div>
	</div>
</div>

<script type="text/javascript">
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

$(function(){
	$('.list-subject').click(function() {
		$(this).closest('tr').next().toggleClass('hidden')
	});
});

$('.answerQuestion').click(function(){
	let qnaNum = $(this).attr("data-num");
	let enabled = $(this).attr("data-enabled");
	let $answer = $(this).closest("td").find(".answer-content");
	let answer = "";
	if($answer.length) {
		answer = $answer.text();
	}
	const f = document.answerForm;
	f.qnaNum.value = qnaNum;
	if(enabled === "1") {
		f.enabled.checked = true;
	}
	f.answer.value = answer;
	
	$("#answerDialogModal").show();
});

$('.btnAnswerSendOk').click(function(){
	const f = document.answerForm;
	let s;
	
	s = f.answer.value.trim();
	if( ! s ) {
		alert("답변을 입력하세요.")	;
		f.answer.focus();
		return false;
	}
	
	let param = $('form[name=answerForm]').serialize();
	let url = '${pageContext.request.contextPath}/admin/carQna/qna/answer';
	
	const fn = function(data) {
		console.log(data);
		if(data.state === 'true') {
			
			f.reset();
			
			$('#answerDialogModal').hide();
			
			let url2 = '${pageContext.request.contextPath}/admin/carQna/qna';
			url2 += '?page=${page}&mode=${mode}&col=${col}';
			location.href = url2;
		} else {
			alert('발송처리가 실패했습니다.');
		};
	};
	
	ajaxFun(url, "post", param, "json", fn);
	
});

$('.btnAnswerSendCancel').click(function(){
	const f = document.answerForm;
	f.reset();
	
	$("#answerDialogModal").hide();
});
</script>
