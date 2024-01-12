<%@ page contentType="text/html; charset=UTF-8" %>
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


</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<script type="text/javascript">
$(function(){
   $("#tab-0").addClass("active");

   $("ul.tabs li").click(function() {
      let tab = $(this).attr("data-tab");
      
      $("ul.tabs li").each(function(){
         $(this).removeClass("active");
      });
      
      $("#tab-"+tab).addClass("active");
      
      let url = "${pageContext.request.contextPath}/admin/carManage/insert";   
      location.href = url;
   });
});

function login() {
	   location.href = '${pageContext.request.contextPath}/member/login';
}

function searchList() {
	const f = document.searchForm;
	f.submit();
}


function changeList() {
	let carShow = $("#changeShowCar").val();
	
	const f = document.searchForm;
	f.carShow.value = carShow;
	searchList();
}



</script>



<div class="body-container">
    <div class="body-title">
		<h2><i class="fa-solid fa-caravan" style="font-size:23px;"></i>&nbsp;캠핑카관리 </h2>
    </div>
    
    <div class="body-main">
    	
		<div>
			<ul class="tabs">
				<li id="tab-0" data-tab="0"><i class="fa-regular fa-note-sticky"></i>&nbsp;리스트</li>
				<li id="tab-1" data-tab="1"><i class="fa-regular fa-pen-to-square"></i>&nbsp;등록</li>
			</ul>
		</div>
		<div id="tab-content" style="padding: 20px 10px 0;">
		
			<table class="table">
				<tr>
					<td align="left" width="50%">
						${dataCount}개(${page}/${total_page} 페이지)
					</td>
					<td align="right">
						<select id="changeShowCar" class="form-select" onchange="changeList();">
							<option value="-1">::진열 여부::</option>
							<option value="1" ${carShow==1?"selected":""}>진열</option>
							<option value="0" ${carShow==0?"selected":""}>숨김</option>
							<option value="2" ${carShow==2?"selected":""}>단종</option>
						</select>
					</td>
				</tr>
			</table>
				
			<table class="table table-border table-list">
				<thead>
					<tr> 
						<th width="60">차량코드</th>
						<th width="60">썸네일</th>
						<th width="200">캠핑카이름</th>
						<th width="50">주중가격</th>
						<th width="50">주말가격</th>
						<th width="30">할인율</th>
						<th width="70">수정일</th>
						<th width="100">변경</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr class="hover" onclick="" style="vertical-align: middle;"> 
							<td>${dto.carNum}</td>
							<td><a href="${pageContext.request.contextPath}/car/car_detail?carNum=${dto.carNum}"><img src="${pageContext.request.contextPath}/uploads/caravan/${dto.thumbnail}" alt="thumbnail" width="50" height="50"></a></td>
							<td><a href="${pageContext.request.contextPath}/car/car_detail?carNum=${dto.carNum}">${dto.carName}</a></td>
							<td>${dto.weekCost}</td>
							<td>${dto.wkndCost}</td>
							<td>${dto.discountRate}%</td>
							<td>${dto.reg_date}</td>
							<td>
								<c:url var="updateUrl" value="/admin/carManage/update">
									<c:param name="carNum" value="${dto.carNum}"/>
									<c:param name="page" value="${page}"/>
								</c:url>
								<button type="button" class="btn border" onclick="location.href='${updateUrl}';">수정</button>
							</td>
						</tr>
					</c:forEach>
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
</div>

<div id="member-dialog" style="display: none;"></div>