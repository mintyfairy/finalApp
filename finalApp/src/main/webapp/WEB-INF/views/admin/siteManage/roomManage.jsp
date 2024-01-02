<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-main {
	max-width: 930px;
}
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">




<div class="body-container">
    <div class="body-title">
		<h2><i class="fa-solid fa-user-group"></i> ${dto.siteName} 관리 </h2>
		<table class="table">
			<tr>
				<td align="right">
					<button type="button" class="btn-border-primary" onclick="
								location.href ='${pageContext.request.contextPath}/siteManage/room/1/write'">장소 등록</button>
				</td>
			</tr>
		</table>
		<table class="table table-border table-list">
			<thead>
				<tr>
					<th class="num">번호</th>
					<th class="boardTitle">장소 이름</th>
					<th class="boardUrl"> 가격</th>
					<th class="boardManage text-center">관리</th>
				</tr>
			</thead>
			
			<tbody>

				<c:forEach var="dto" items="${ list}" varStatus="status">
					<tr>
						<td>${dataCount-(page-1)*size-status.index}</td>
						<td><p>${dto.detailname}</p></td>
						<td>${dto.price}</td>

						<td>
							<button type="button" class="btn-border-primary" onclick="updateRoom('${dto.detailnum},${dto.sitenum}')">수정</button>
							<button type="button" class="btn-border-primary" onclick="deleteRoom('${dto.detailnum}')">삭제</button>
						</td>
					</tr>
				</c:forEach>
			<tbody>
			
		</table>
		
		<div class="page-navigation">
			${paging!=null?paging:"데이터가없습니다."}
		</div>
    </div>
 </div>

<div id="member-dialog" style="display: none;"></div>
<script>
function deleteRoom(num){
	if(confirm('게시판 및 게시판의 게시글을 삭제하시겠습니까?')){
		let q="detailnum="+num;
		location.href="${pageContext.request.contextPath}/siteManage/deleteRoom?"+q;
	}
}
function updateRoom(num,sitenum){
	let q="detailnum="+num;
	location.href="${pageContext.request.contextPath}/siteManage/site/"+sitenum+"/update?"+q;
	
}
</script>