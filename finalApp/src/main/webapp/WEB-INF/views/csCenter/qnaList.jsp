<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 1080px; /*수정*/
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

.tab-content { width: 1080px; margin: 20px auto; } /*수정*/

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
</script>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	
	f.submit();
}
</script>

<div class="container">
	<div class="body-container">				
		<div class="body-main">
			<ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="1" aria-selected="false">공지사항</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="2" aria-selected="false">자주 묻는 질문</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="tab-3" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="3" aria-selected="true">1:1 질문</button>
				</li>
                <li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-4" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="4" aria-selected="false">이벤트</button>
				</li>
			</ul>
			
			<div class="tab-content pt-4" id="myTabContent">
				<div class="tab-pane fade show active" id="tab-pane" role="tabpanel" aria-labelledby="tab-3" tabindex="0">

			        <div class="row board-list-header">
			            <div class="col-auto me-auto">
			            	${dataCount}개(${page}/${total_page} 페이지)
			            </div>
			            <div class="col-auto">&nbsp;</div>
			        </div>				
					
					<table class="table table-hover board-list">
						<thead class="table-light">
							<tr>
								<th width="100">분류</th>
								<th>제목</th>
								<th width="100">작성자</th>
								<th width="90">문의일자</th>
								<th width="90">처리결과</th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach var="dto" items="${list}">
								<tr>
									<td>${dto.category}</td>
									<td class="left">
										<a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
									</td>
									<td>${dto.userName}</td>
									<td>${dto.reg_date}</td>
									<td>${(empty dto.answer_date)?"답변대기":"답변완료"}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<div class="page-navigation">
						${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
					</div>
		
					<div class="row board-list-footer">
						<div class="col">
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/csCenter/qna/list';" title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>
						</div>
						<div class="col-6 text-center">
							<form class="row" name="searchForm" action="${pageContext.request.contextPath}/csCenter/qna/list" method="post">
								<div class="col-auto p-1">
									<select name="schType" class="form-select">
										<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
										<option value="reg_date" ${schType=="reg_date"?"selected":""}>등록일</option>
										<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
										<option value="content" ${schType=="content"?"selected":""}>내용</option>
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
						<div class="col text-end">
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/csCenter/qna/write';">질문등록</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>