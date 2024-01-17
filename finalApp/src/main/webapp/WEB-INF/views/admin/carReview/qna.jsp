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

.tab-table {
  border: 1px solid white;
}
</style>

<script type="text/javascript">
$(function(){
   $("#tab-1").addClass("active");

   $("ul.tabs li").click(function() {
      let tab = $(this).attr("data-tab");
      
      $("ul.tabs li").each(function(){
         $(this).removeClass("active");
      });
      
      $("#tab-"+tab).addClass("active");
      
      let url = "${pageContext.request.contextPath}/admin/carReview/review";   
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
						<th width="80">번호</th>
						<th width="200">예약자 성명</th>
						<th width="200">대여시작일자</th>
						<th width="200">대여종료일자</th>
						<th width="200">예약확인</th>
					</tr>
				</thead>
				
				<tbody>
						<tr class="hover" onclick="" style="vertical-align: middle;"> 
							<td>1</td>
							<td>김뚜띠</td>
							<td>2023-01-02</td>
							<td>2023-01-03</td>
							<td>
								<c:url var="updateUrl" value="/admin/carManage/update">
									<c:param name="carNum" value="${dto.carNum}"/>
									<c:param name="page" value="${page}"/>
								</c:url>
								<button type="button" class="btn border" onclick="location.href='${updateUrl}';">예약상세확인</button>
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
						<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/carManage/insert';">등록하기</button>
					</td>
				</tr>
			</table>
	</div>
</div>
