<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.main {
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
	text-align: center;
}

.name {
	font-size: 25px;
	font-weight: bold;
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

.tab-pane {
	min-height: 300px;
}

.md-img img {
	width: 150px;
	height: 150px;
	cursor: pointer;
	object-fit: cover;
}

.deleteQuestion {
	cursor: pointer;
	padding-left: 5px;
}

.deleteQuestion:hover {
	font-weight: 500;
	color: #2478FF;
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
</script>

<div class="main">
	<div style="padding-top: 20px;">
		<img class="img"
			src="${pageContext.request.contextPath}/resources/images/campingcar/handle.png"
			style="width: 60px; height: 60px;">
		<p class="name"
			style="line-height: 80px; float: right; margin-left: 10px;">${sessionScope.member.userName}<span>
				운전자님</span>
		</p>
	</div>

	<div style="text-align: center; padding-top: 42px;">
		<a href="${pageContext.request.contextPath}/car/mypage/rider"
			style="color: #cccccc; font-size: 17px;">운전자 정보 </a>
	</div>
	<div style="text-align: center; padding-top: 42px;">
		<a href="${pageContext.request.contextPath}/car/mypage/paymentList"
			style="color: #cccccc; font-size: 17px;">예약 내역 </a>
	</div>
	<div style="text-align: center; padding-top: 40px;">
		<a href="${pageContext.request.contextPath}/car/mypage/question"
			style="color: black; font-size: 19px; font-weight: bold;">문의 내역 </a>
	</div>
</div>

<div class="container">
	<div class="body-container">
		<div class="body-main">

			<ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="tab-2" data-bs-toggle="tab"
						data-bs-target="#tab-pane-2" type="button" role="tab"
						aria-controls="2" aria-selected="true">캠핑카 문의</button>
				</li>
			</ul>

			<div class="tab-content pt-2" id="myTabContent">

				<div class="tab-pane fade show active" id="tab-pane-2"
					role="tabpanel" aria-labelledby="tab-2" tabindex="0">

					<div class="mt-1 p-2 list-question">
						<c:forEach var="dto" items="${list}">
							<div class="mt-1 border-bottom">
								<div class="row p-2">
									<div class="col-auto fw-semibold">${dto.carName}</div>
									<div class="col text-end">
										${not empty dto.answer ? '<span class="text-primary">답변완료</span>' : '<span class="text-secondary">답변대기</span>'}
										| ${dto.question_date} |<span class="deleteQuestion"
											data-num="${dto.qnaNum}">삭제</span>
									</div>
								</div>
								<div class="p-2">${dto.question}</div>
								<c:if test="${not empty dto.listFilename}">
									<div class="row gx-1 mt-2 mb-1 p-1">
										<c:forEach var="filename" items="${dto.listFilename}">
											<div class="col-md-auto md-img">
												<img class="border rounded"
													src="${pageContext.request.contextPath}/uploads/carqna/${filename}">
											</div>
										</c:forEach>
									</div>
								</c:if>
								<c:if test="${not empty dto.answer}">
									<div class="p-3 pt-0">
										<div class="bg-light">
											<div class="p-3 pb-0">
												<label class="text-bg-primary px-2"> 관리자 </label> <label>${dto.answer_date}</label>
											</div>
											<div class="p-3 pt-1">${dto.answer}</div>
										</div>
									</div>
								</c:if>
							</div>
						</c:forEach>
					</div>
					<div class="page-navigation">${paging}</div>
				</div>
			</div>

		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
    // 페이지 로드 시에 listQuestion(1) 호출
    listQuestion(1);
});   
    
$(function(){
	$(".deleteQuestion").click(function(){
		let num = $(this).attr("data-num");
		alert(num);
	});
});
</script>
<script type="text/javascript">
function listQuestion(page) {
	let url = '${pageContext.request.contextPath}/car/qna/list2';
	let query = 'pageNo='+page;
	
	const fn = function(data) {
		printQuestion(data);
	};
	ajaxFun(url, 'get', query, 'json', fn);	
}

function printQuestion(data) {
	let dataCount = data.dataCount;
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	let size = data.size;
	let paging = data.paging;
	
	let out = '';
	for(let item of data.list) {
		let qnaNum = item.qnaNum;
		let userName = item.userName;
		let question = item.question;
		let question_date = item.question_date;
		let answer = item.answer;
		let answer_date = item.answer_date;
		let answerState = answer_date ? '<span class="text-primary">답변완료</span>' : '<span class="text-secondary">답변대기</span>';
		let listFilename = item.listFilename;
		let carName = item.carName;

		out += '<div class="mt-1 border-bottom">';
		out += '  <div class="mt-2 p-2 fw-semibold">' + carName + '</div>';
		out += '  <div class="p-2">' + question + '</div>';

		if(listFilename && listFilename.length > 0) {
			out += '<div class="row gx-1 mt-2 mb-1 p-1">';
				for(let f of listFilename) {
					out += '<div class="col-md-auto md-img">';
					out += '  <img class="border rounded" src="${pageContext.request.contextPath}/uploads/carqna/'+f+'">';
					out += '</div>';
				}
			out += '</div>';
		}
		out += '  <div class="row p-2">';
		out += '     <div class="col-auto pt-2 pe-0">' + answerState + '</div>';
		out += '     <div class="col-auto pt-2 px-0">&nbsp;|&nbsp;<span>'+question_date+'</span>';
		out += '        |<span class="deleteQuestion" data-num="' + qnaNum + '">삭제</span>';
		out += '      </div>';
		if(answer) {
			out += '  <div class="col pt-2 text-end"><button class="btn btnAnswerView"> <i class="bi bi-chevron-down"></i> </button></div>';
		}
		out += '  </div>';
		if(answer) {
			out += '  <div class="p-3 pt-0 answer-content" style="display: none;">';
			out += '    <div class="bg-light">';
			out += '      <div class="p-3 pb-0">';
			out += '        <label class="text-bg-primary px-2"> 관리자 </label> <label>' + answer_date + '</label>';
			out += '      </div>';
			out += '      <div class="p-3 pt-1">' + answer + '</div>';
			out += '    </div>';
			out += '  </div>';
		}
		out += '</div>';
	}
	
	if(dataCount > 0) {
		out += '<div class="page-navigation">' + paging + '</div>';
	}

	$('.list-question').html(out);
}

$(function(){
	$('.list-question').on('click', '.btnAnswerView', function(){
		const $btn = $(this);
		const $EL = $(this).closest('.row').next('.answer-content');
		if($EL.is(':visible')) {
			$btn.html(' <i class="bi bi-chevron-down"></i> ');
			$EL.hide(100);
		} else {
			$btn.html(' <i class="bi bi-chevron-up"></i> ');
			$EL.show(100);
		}
	});
});


$(function(){
	$('.list-question').on('click', '.deleteQuestion', function(){
		let qnaNum = $(this).attr('data-num');
		
		if(confirm('질문을 삭제하시겠습니까?')) {
			let query = 'qnaNum=' + qnaNum;
			location.href = '${pageContext.request.contextPath}/car/qna/delete?' + query;
		}
	});
});

</script>