<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<style>
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
.second-tabs {
	margin-top: 20px;
	width: 100%;
}

/* 테이블 */
.table-list > tbody > tr > td:nth-child(2) {
  width:250px;
}

.table-list > tbody > tr > td:nth-child(2) > p {
  overflow: hidden;  		
  text-overflow: ellipsis;  
  white-space: nowrap; 		
  word-break:break-all;
  width:250px;
  height:45px;
  line-height: 45px;
  margin-bottom: 0;
  
}

.table-list > tbody > tr > td:nth-child(3) {
  width:350x;
}

.table-list > tbody > tr > td:nth-child(3) > p {
  overflow: hidden;  		
  text-overflow: ellipsis;  
  white-space: nowrap; 		
  word-break:break-all;
  height:45px;
  width:350px;
  line-height: 45px;
  margin-bottom: 0;
  
}

.tab-table {
  border: 1px solid white;
}

.tab-table > tr > td:nth-child(1) {
  vertical-align: middle;
}

</style>

<script type="text/javascript">
$(function(){
   $("#tab-0").addClass("active");

   $("ul.tabs li").click(function() {
      let tab = $(this).attr("data-tab");
      
      $("ul.tabs li").each(function(){
         $(this).removeClass("active");
      });
      
      $("#tab-"+tab).addClass("active");
      
      let url = "${pageContext.request.contextPath}/admin/carReview/ask";   
      location.href = url;
   });
});
</script>


<div class="body-container">
    <div class="body-title">
		<h2><i class="fa-solid fa-user-group"></i> 캠핑카리뷰 및 문의관리 </h2>
    </div>
    
    <div class="body-main">
		<div>
			<ul class="tabs">
				<li id="tab-0" data-tab="0">&nbsp;리뷰관리</li>
				<li id="tab-1" data-tab="1">&nbsp;문의관리</li>
			</ul>
		</div>
		
		<table class="table tab-table">
				<tr>
					<td align="left" width="50%">
						${dataCount}1개(${page}1/${total_page}2 페이지)
					</td>
					<td align="right">
						<select id="changeShowCar" class="form-select" onchange="changeList();" style="width:160px; text-align:center;">
							<option value="-1">::전체::</option>
							<option value="1" ${carShow==1?"selected":""}>답변완료</option>
							<option value="0" ${carShow==0?"selected":""}>답변대기</option>
						</select>
					</td>
				</tr>
		</table>
		
		<table class="table table-border table-list">
				<thead>
					<tr> 
						<th width="80">답변상태</th>
						<th width="200">제목</th>
						<th width="300">내용</th>
						<th width="60">작성자</th>
						<th width="90">작성일</th>
						<th width="100">답변하기</th>
					</tr>
				</thead>
				
				<tbody>
						<tr class="hover" onclick="" style="vertical-align: middle;"> 
							<td>답변대기</td>
							<td><p>스타렉스김수연 구려요!스타렉스김수연 구려요!</p></td>
							<td><p>구리구리구리구리구리구리구리구</p></td>
							<td>양양양</td>
							<td>2023-01-03</td>
							<td>
								<c:url var="updateUrl" value="/admin/carManage/update">
									<c:param name="carNum" value="${dto.carNum}"/>
									<c:param name="page" value="${page}"/>
								</c:url>
								<button type="button" class="btn border" onclick="location.href='${updateUrl}';">답변하기</button>
							</td>
						</tr>
				</tbody>
			</table>
					 
			<div class="page-navigation">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>
					
			<table class="table" style="width:100%">
				<tr>
					<td align="left" width="150">
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/carManage/car';">
							<i class="bi bi-arrow-clockwise"></i>
						</button>
					</td>
					
					<td align="center">
						<form class="row justify-content-center" name="searchForm" action="${pageContext.request.contextPath}/admin/carManage/car" method="post">
							<div class="col-auto p-1">
								<select name="schType" class="form-select">
									<option value="all" ${schType=="all"?"selected":""}>전체</option>
									<option value="carName" ${schType=="carSize"?"selected":""}>캠핑카이름</option>
									<option value="carNum" ${schType=="productName"?"selected":""}>차량코드</option>
									<option value="reg_date" ${schType=="reg_date"?"selected":""}>등록일</option>
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
					</td>
				</tr>
			</table>
	</div>
</div>
