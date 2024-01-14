<%@ page contentType="text/html; charset=UTF-8" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<style type="text/css">
.body-main {
	max-width:1200px;
	margin: 0 auto;
}

.badge {
	display: inline-block; padding:2px 3px; background: #0d6efd; color: #fff; font-weight: 500;
	font-size: 11px;
}

.paginate{
	width:1200px;
	margin: 0 auto;
}

.form-select{
	width:100px;
	margin: auto;
	
}
	
.form-control{
	width:100;
	margin: auto;
	
}


</style>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>

<div class="body-container">
    <div class="body-title">
		<h2><i class="fas fa-clipboard-list"></i> 공지사항 </h2>
    </div>
    
    <div class="body-main">

		<table class="table">
			<tr>
				<td align="left" width="50%">
					${dataCount}개(${page}/${total_page} 페이지)
				</td>
				<td align="right">
					&nbsp;
				</td>
			</tr>
		</table>
		
		<table class="table table-border table-list">
			<thead>
				<tr>
					<th width="60">번호</th>
					<th>제목</th>
					<th width="100">작성자</th>
					<th width="100">작성일</th>
					<th width="70">조회수</th>
					<th width="50">첨부</th>
					<th width="50">표시</th>
				</tr>
			</thead>
		 
		 	<tbody>
				<c:forEach var="dto" items="${noticeList}">
					<tr> 
						<td><span class="badge">공지</span></td>
						<td class="left">
							<a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
						</td>
						<td>${dto.userName}</td>
						<td>${dto.reg_date}</td>
						<td>${dto.hitCount}</td>
						<td>
							<c:if test="${dto.fileCount != 0}">
								<a href="${pageContext.request.contextPath}/admin/cs/notice/zipdownload?num=${dto.num}"><i class="fa-solid fa-file-zipper"></i></a>
							</c:if>		      
						</td>
						<td>&nbsp;</td>
					</tr>
				</c:forEach>

				<c:forEach var="dto" items="${list}" varStatus="status">
					<tr> 
						<td>${dataCount - (page-1) * size - status.index}</td>
						<td class="left">
							<a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
							<c:if test="${dto.gap < 1}">
								<img src='${pageContext.request.contextPath}/resources/images/new.gif'>
							</c:if>
						</td>
						<td>${dto.userName}</td>
						<td>${dto.reg_date}</td>
						<td>${dto.hitCount}</td>
						<td>
							<c:if test="${dto.fileCount != 0}">
								<a href="${pageContext.request.contextPath}/admin/cs/notice/zipdownload?num=${dto.num}"><i class="fa-solid fa-file-zipper"></i></a>
							</c:if>		      
						</td>
						<td>${dto.showNotice == 1 ? "표시" : "숨김" }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		 
		<div class="page-navigation">
			${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
		</div>
		
		<table class="table">
			<tr>
				<td align="left" width="150">
					<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/cs/notice/list';" title="새로고침"><i class="fa-solid fa-arrow-rotate-left"></i></button>
				</td>
				<td align="center">
					<form class="row justify-content-center" name="searchForm" action="${pageContext.request.contextPath}/admin/cs/notice/list" method="post">
						<div class="col-auto p-1">
							<select name="schType" class="form-select">
								<option value="all" ${schType=="all"?"selected":""}>모두</option>
								<option value="userName" ${schType=="userName"?"selected":""}>작성자</option>
								<option value="reg_date" ${schType=="reg_date"?"selected":""}>등록일</option>
								<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
								<option value="content" ${schType=="content"?"selected":""}>내용</option>
							</select>
						</div>						
						<div class="col-auto p-1">
							<input type="text" name="kwd" value="${kwd}" class="form-control">						
						</div>
						<div class="col-auto p-1">						
							<button type="button" class="btn" onclick="searchList()"><i class="bi bi-search"></i></button>
						</div>
					</form>
				</td>
				<td align="right" width="150">
					<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/cs/notice/write';">글올리기</button>
				</td>
			</tr>
		</table>

	</div>
</div>
