<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 1100px;
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

.body-main { width: 850px; margin: 20px auto; }

.table-list { width: 100%; }
.table-list thead { color: #787878; }
.table-list tr>th { padding-top: 10px; padding-bottom: 10px; }
.table-list tr>th, .table-list tr>td { text-align: center; }
.table-list .left { text-align: left; padding-left: 7px; }
.table-list .right { text-align: right; padding-left: 7px; padding-right: 7px; }

button.btn-category {
	cursor: pointer;
	border: none;
	background: #fff;
	padding: 7px;
	
}

button.btnActive {
	font-weight: 600;
	border-bottom:1px solid #333;
}

</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
//탭
$(function(){
	$("button[role='tab']").on('click', function(){
		const tab = $(this).attr("aria-controls");
		
		if(tab === "1") { // 공지
			location.href="${pageContext.request.contextPath}/csCenter/notice/list";
		} else if( tab === "2") { // FAQ
			location.href="${pageContext.request.contextPath}/csCenter/faq/main";
		} else if( tab === "3") { // 1:1
			location.href="${pageContext.request.contextPath}/csCenter/qna/list";
		} else if( tab === "4") { // 이벤트
			location.href="${pageContext.request.contextPath}/csCenter/event/progress/list";
		}
	});
});
</script>

<div class="container">
	<div class="body-container">	
			<ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="1" aria-selected="false">공지사항</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="2" aria-selected="true">자주 묻는 질문</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-3" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="3" aria-selected="false">1:1 질문</button>
				</li>
                <li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-4" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="4" aria-selected="false">이벤트</button>
				</li>
			</ul>

		<div class="body-main">
		
			<div class="category-tab">
				<c:forEach var="dto" items="${listCategory}" varStatus="status">
					<button class="btn-category ${status.index==0?'btnActive':'' }" type="button" data-categoryNum="${dto.categoryNum}">${dto.category}</button>
				</c:forEach>
			</div>
			
			<div class="tab-content pt-2" id="nav-tabContent"></div>
			
			<div>
					<div class="row py-3">
						<div class="col">
							<button type="button" class="btn btn-light" onclick="reloadFaq();" title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>
						</div>
						<div class="col-6 text-center">
							<form class="row" name="searchForm" method="post">
								<div class="col-auto p-1">
									<select name="schType" id="schType" class="form-select">
										<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
										<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
										<option value="content" ${schType=="content"?"selected":""}>내용</option>
									</select>
								</div>
								<div class="col-auto p-1">
									<input type="text" name="kwd" id="kwd" value="${kwd}" class="form-control">
								</div>
								<div class="col-auto p-1">
									<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
								</div>
							</form>
						</div>
						<div class="col text-end">&nbsp;</div>
					</div>
				
			</div>
			
		</div>
	</div>
</div>

<form name="faqSearchForm" method="post">
	<input type="hidden" name="schType" value="all">
    <input type="hidden" name="kwd" value="">
</form>

<script type="text/javascript">
function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
}

function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
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
	listPage(1);
	
    $(".btn-category").on("click", function(e) {
    	let $btn = $(this);
    	$('.category-tab .btn-category').each(function(){
    		$(this).removeClass('btnActive');
    	});
    	
    	$btn.addClass('btnActive');
    	
    	listPage(1);
    	
    });
});

// 글리스트 및 페이징 처리
function listPage(page) {
	const $btn = $("button.btnActive");
	let categoryNum = $btn.attr("data-categoryNum");
	
	let url = "${pageContext.request.contextPath}/csCenter/faq/list";
	let query = "pageNo="+page+"&categoryNum="+categoryNum;
	let search = $('form[name=faqSearchForm]').serialize();
	query = query+"&"+search;
	
	let selector = "#nav-tabContent";
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "text", fn);
}

// 검색
function searchList() {
	const f = document.faqSearchForm;
	f.schType.value = $("#schType").val();
	f.kwd.value = $.trim($("#kwd").val());

	listPage(1);
}

// 새로고침
function reloadFaq() {
	const f = document.faqSearchForm;
	f.schType.value = "all";
	f.kwd.value = "";
	
	listPage(1);
}
</script>
