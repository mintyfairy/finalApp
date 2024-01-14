<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style type="text/css">
.body-main {
	width: 1080px;
}
#tab-content{
	width: 100%;
}

img {
	border: 1px solid rightgrey;
}

a {
	color:black; text-decoration: none; outline: none
}

.accordion {
	box-sizing: border-box;
	width: 100%;
	min-height: 50px;
	margin: 50px auto 20px;
}

.accordion h3.question {
	box-sizing: border-box;
	color: #333;
	font-weight: 300;
	border: 1px solid #ccc;
	background-color: #fff;
	padding: 7px 15px 7px;
	border-radius: 4px;
	cursor: pointer;
	margin: 3px 0 0;
}

.accordion h3.question:hover {
	background-color: #F8FFFF;
}

.accordion h3.question .q {
	font-weight: 600;
}

.accordion h3.question .subject:hover {
	color: #0d58ba;
}

.accordion div.answer {
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-top: none;
	min-height: 50px;
	padding: 3px 10px 10px;
	display: none;
}

.accordion div.answer>.category {
	height: 35px;
	line-height: 35px;
	border-bottom: 1px solid #eee;
}

.accordion div.answer>.content {
	padding: 7px 15px 5px;
}

.accordion div.answer>.content div:first-child {
	font-weight: 700;
	/* display: inline-block;  */
	vertical-align: top;
	padding-left: 5px;
}

.accordion div.answer>.content div:last-child {
	display: inline-block;
}

.accordion div.answer>.update {
	text-align: right;
}

.accordion h3.active {
	font-weight: 600;
	background-color: #f8f9fa;
}
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<script type="text/javascript">
$(function(){
	$("#tab-content").on("click", ".accordion h3.question", function(){
		 const $answer = $(this).next(".accordion div.answer");
		 let isVisible = $answer.is(':visible');
		 if(isVisible) {
			 $(this).next(".accordion div.answer").hide();
			 $(this).removeClass("active");
		 } else {
			 $(".accordion div.answer").hide();
			 $(".accordion h3.question").removeClass("active");
			 
			 $(this).next(".accordion div.answer").show();
			 $(this).addClass("active");
		 }
	});
});

$(function(){
	let categoryNum = "${categoryNum}";
	let pageNo = "${pageNo}";
	if(pageNo === "") {
		pageNo = 1;
	}
	$("#tab-"+categoryNum).addClass("active");
	listPage(pageNo);

	$("ul.tabs li").click(function() {
		categoryNum = $(this).attr("data-categoryNum");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+categoryNum).addClass("active");
		
		listPage(1);
	});
});

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
		settings.processData = false;  
		settings.contentType = false; 
	}
	
	$.ajax(url, settings);
}

// 글리스트 및 페이징 처리
function listPage(page) {
	const $tab = $(".tabs .active");
	let categoryNum = $tab.attr("data-categoryNum");
	
	let url = "${pageContext.request.contextPath}/admin/cs/faq/list";
	let query = "pageNo="+page+"&categoryNum="+categoryNum;
	let search = $('form[name=faqSearchForm]').serialize();
	query = query+"&"+search;
	
	let selector = "#tab-content";
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}

// 검색
function searchList() {
	const f = document.faqSearchForm;
	f.schType.value = $("#schType").val();
	f.kwd.value = $("#kwd").val().trim();

	listPage(1);
}

// 새로고침
function reloadFaq() {
	const f = document.faqSearchForm;
	f.schType.value = "all";
	f.kwd.value = "";
	
	$("#schType").val("all");
	$("#kwd").val("");
	
	listPage(1);
}

// 글 삭제
function deleteFaq(num, page) {
	var url = "${pageContext.request.contextPath}/admin/cs/faq/delete"; //admin/cs/faq 이건가?
	var query = "num="+num;
	
	if(! confirm("위 게시물을 삭제 하시 겠습니까 ? ")) {
		  return;
	}
	
	const fn = function(data){
		listPage(page);
	};
	
	ajaxFun(url, "post", query, "json", fn);
}
</script>

<div class="body-container">
	<div class="body-title">
		<h2>
			<i class="fa-solid fa-clipboard-question" style="font-size:23px;"></i> &nbsp;자주받는 질문 
		</h2>
		
	</div>


	<div class="body-main">

		<div>
			<ul class="tabs">
				<li id="tab-0" data-categoryNum="0">모두</li>
				<c:forEach var="dto" items="${listCategory}">
					<li id="tab-${dto.categoryNum}"
						data-categoryNum="${dto.categoryNum}">${dto.category}</li>
				</c:forEach>
			</ul>
			<div id="tab-content">
			
			</div>
			
			
			<table class="table">
				<tr>
				<td align="left" width="150">
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/cs/faq/write     ';">
							<i class="bi bi-arrow-clockwise"></i>
						</button>
					</td>
					<td align="center">
						<form class="row justify-content-center" name="searchForm" action="${pageContext.request.contextPath}/admin/cs/faq/write" method="post">
							<div class="col-auto p-1">
								<select name="schType" class="form-select">
									<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
									<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
									<option value="content" ${schType=="content"?"selected":""}>내용</option>
								</select>
							</div>
							<div class="col-auto p-1">
								<input type="text" name="kwd" value="${kwd}" class="form-control">
								<input type="hidden" name="size" value="${size}">
								<input type="hidden" name="carShow" value="${carShow}">
							</div>
							<div class="col-auto p-1">
								<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
							</div>
						</form>
					</td>
					<td width="150" align="right">
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/cs/faq/write';">글올리기</button>
					</td>
					
					
				</tr>
			</table>
		</div>




	</div>
</div>

<form name="faqSearchForm" method="post">
	<input type="hidden" name="schType" value="all"> 
	<input type="hidden" name="kwd" value="">
</form>

