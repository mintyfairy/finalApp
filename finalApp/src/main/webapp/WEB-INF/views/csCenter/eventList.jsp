<%@ page contentType="text/html; charset=UTF-8" %>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

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

$(function(){
	let menu = "${category}";
	$("#tab-"+menu).addClass("btnActive");

	$(".btn-category").on("click", function(e) {
		const menu = $(this).attr("data-menu");
		let url = "${pageContext.request.contextPath}/csCenter/event/"+menu+"/list";
		location.href = url;
    });
});

function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>

<div class="container">
	<div class="body-container">	
			<ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="1" aria-selected="false">공지사항</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="2" aria-selected="false">자주 묻는 질문</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-3" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="3" aria-selected="false">1:1 질문</button>
				</li>
                <li class="nav-item" role="presentation">
					<button class="nav-link active" id="tab-4" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="4" aria-selected="true">이벤트</button>
				</li>
			</ul>
			&nbsp;
			&nbsp;
			&nbsp;
			<div class="body-main">
				<div class="category-tab">
					<button class="btn-category" id="tab-progress" type="button" data-menu="progress">진행중인 이벤트</button>
					<button class="btn-category" id="tab-winner" type="button" data-menu="winner">당첨자 발표</button>
					<button class="btn-category" id="tab-ended" type="button" data-menu="ended">종료된 이벤트</button>
				</div>				
				
				<div class="tab-content pt-2" id="nav-tabContent">
				
			        <div class="row board-list-header">			  
			            <div class="col-auto me-auto">	          
			            	${dataCount}개(${page}/${total_page} 페이지)
			            </div>
			            <div class="col-auto">&nbsp;</div>
			        </div>				
					
					<table class="table table-hover board-list">
						<thead class="table-light">
							<tr>
								<th width="60">번호</th>
								<th>제목</th>
								<th width="140">시작일</th>
								<th width="140">종료일</th>
								<th width="70">${category=="winner" ? "발표" : "조회수"}</th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach var="dto" items="${list}" varStatus="status">
								<tr>
									<td>${dataCount - (page-1) * size - status.index}</td>
									<td class="left">
										<a href="${articleUrl}&num=${dto.num}" class="text-reset">${dto.title}</a>
									</td>
									<td>${dto.startDate}</td>
									<td>${dto.endDate}</td>
									<td>${category=="winner" ? (dto.winnerCount==0?"예정":"완료") : dto.hitCount}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<div class="page-navigation">
						${dataCount == 0 ? "등록된 이벤트가 없습니다." : paging}
					</div>
		
					<div class="row board-list-footer">
						<div class="col">
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/csCenter/event/${category}/list';" title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>
						</div>
						<div class="col-6 text-center">
							<form class="row" name="searchForm" action="${pageContext.request.contextPath}/csCenter/event/${category}/list" method="post">
								<div class="col-auto p-1">
									<select name="schType" class="form-select">
										<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
										<option value="startDate" ${schType=="startDate"?"selected":""}>시작일</option>
										<option value="endDate" ${schType=="endDate"?"selected":""}>종료일</option>
										<option value="winningDate" ${schType=="winningDate"?"selected":""}>발표일</option>
									</select>
								</div>
								<div class="col-auto p-1">
									<input type="text" name="kwd" value="${kwd}" class="form-control">
								</div>
								<div class="col-auto p-1">
									<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
								</div>
							</form>
						</div>
						<div class="col text-end"> &nbsp;</div>
					</div>
				
				</div>
		</div>
	</div>
</div>