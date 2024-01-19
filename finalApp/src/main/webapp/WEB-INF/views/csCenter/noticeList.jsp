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

.tab-content { width: 850px; margin: 20px auto; }

.table-list { width: 100%; }
.table-list thead { color: #787878; }
.table-list tr>th { padding-top: 10px; padding-bottom: 10px; }
.table-list tr>th, .table-list tr>td { text-align: center; }
.table-list .left { text-align: left; padding-left: 7px; }
.table-list .right { text-align: right; padding-left: 7px; padding-right: 7px; }
</style>

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

function searchList() {
	const f = document.searchForm;
	f.submit();
}

function changeList() {
	let parentNum = $("#changeCategory").val();
	let productShow = $("#changeShowProduct").val();

	const f = document.searchForm;
	f.parentNum.value = parentNum;
	f.categoryNum.value = 0;
	f.productShow.value = productShow;
	searchList();
}

function changeSubList() {
	let parentNum = $("#changeCategory").val();
	let categoryNum = $("#changeSubCategory").val();
	let productShow = $("#changeShowProduct").val();

	const f = document.searchForm;
	f.parentNum.value = parentNum;
	f.categoryNum.value = categoryNum;
	f.productShow.value = productShow;
	searchList();
}
</script>

<div class="container">
	<div class="body-container">

		<div class="body-main">
			<ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="1" aria-selected="true">공지사항</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="2" aria-selected="false">자주 묻는 질문</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-3" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="3" aria-selected="false">1:1 질문</button>
				</li>
                <li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-4" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="4" aria-selected="false">이벤트</button>
				</li>
			</ul>
			
			<div class="tab-content pt-4" id="myTabContent">
				<div class="tab-pane fade show active" id="tab-pane" role="tabpanel" aria-labelledby="tab-1" tabindex="0">
					<div class="row mb-2">
						
						<div class="col-auto pt-2 text-end">
							${dataCount}개(${page}/${total_page} 페이지)
						</div>
					</div>
					
					<table class="table table-border table-list">
						<thead>
							<tr class="border-top border-dark table-light">
								<th width="60">번호</th>
								<th>제목</th>
                                <th width="100">작성자</th>
                                <th width="100">작성일</th>
                                <th width="70">조회수</th>
                                <th width="50">첨부</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${noticeList}" varStatus="status">
								<tr valign="middle">
									<td><span class="badge bg-primary">공지</span></td>
                                    <td class ="center"> 
                                        <a href="${articleUrl}&num=${dto.num}" class="text-reset">${dto.subject}</a>
                                    </td>
									<td>관리자</td>
									<td>${dto.reg_date}</td>
									<td>${dto.hitCount}</td>
									<td>
										<c:if test="${dto.fileCount != 0}">
											<a href="${pageContext.request.contextPath}/csCenter/notice/zipdownload?num=${dto.num}" class="text-reset"><i class="bi bi-file-arrow-down"></i></a>
										</c:if>
									</td>
								</tr>					
							</c:forEach>
							
							<c:forEach var="dto" items="${list}" varStatus="status">
								<tr valign="middle">
									<td>${dataCount - (page-1) * size - status.index}</td>
                                    <td class ="center"> 
                                        <a href="${articleUrl}&num=${dto.num}" class="text-reset">${dto.subject}</a>
                                    </td>
									<td>관리자</td>
									<td>${dto.reg_date}</td>
									<td>${dto.hitCount}</td>
									<td>
										<c:if test="${dto.fileCount != 0}">
											<a href="${pageContext.request.contextPath}/csCenter/notice/zipdownload?num=${dto.num}" class="text-reset"><i class="bi bi-file-arrow-down"></i></a>
										</c:if>
									</td>
								</tr>					
							</c:forEach>
							
						</tbody>
					</table>

					<div class="page-navigation">
						${dataCount == 0 ? "등록된 상품이 없습니다." : paging}
					</div>
					
					<table class="table table-borderless">
						<tr>
							<td width="150">
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/csCenter/notice/list';"> <i class="bi bi-arrow-clockwise"></i> </button>				
							</td>
							<td align="center">
								<form class="row justify-content-center" name="searchForm" action="${pageContext.request.contextPath}/csCenter/notice/list" method="post">
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
							</td>					
							<td width="150" align="right">
								
							</td>
						</tr>
					</table>
					
				</div>
			</div> <!-- tab-content _ end -->

		</div> <!-- body-main -->
	</div>
</div>


