<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<style>
.body-container {
	margin-top: 60px;
	padding-left: 250px;
}

.body-main {
	width: 1080px;
}
#tab-content{
	width: 100%;
}

.tabs {
	width: 100%;
    display: flex;
    margin: 0;
    padding: 0;
    list-style: none;
    height: 35px;
    width: 100%;
    border-bottom: 1px solid #ddd;
}

img {
	border: 1px solid rightgrey;
}

a {
	color:black; text-decoration: none; outline: none
}

.tabs {
	width: 100%;
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
      
      let url = "${pageContext.request.contextPath}/admin/carReservation/chart";   
      location.href = url;
   });
});

function searchList() {
	const f = document.searchForm;
	f.submit();
}

function changeList() {
	let orderState = $("#changeShowState").val();
	
	const f = document.searchForm;
	f.orderState.value = orderState;
	searchList();
}
</script>

<script>
function detailModal() {
	
}
</script>

<div class="body-container">
    <div class="body-title">
		<h3><i class="fa-solid fa-clipboard" style="font-size:24px;"></i> 예약 및 매출관리 </h3>
    </div>
    
    <div class="body-main">
		<div>
			<ul class="tabs">
				<li id="tab-0" data-tab="0"><i class="fa-solid fa-chart-simple"></i>&nbsp;매출확인</li>
				<li id="tab-1" data-tab="1"><i class="fa-regular fa-note-sticky"></i>&nbsp;예약리스트</li>
			</ul>
		</div>
		
		<table class="table">
			<tr>
				<td align="left" width="50%" style="border-bottom:white;">
					${dataCount}개(${page}/${total_page} 페이지)
				</td>
				<td align="right" style="border-bottom:white;">
					<select id="changeShowState" class="form-select" onchange="changeList();">
						<option value="1">::예약 리스트::</option>
						<option value="2" ${orderState==2?"selected":""}>이용완료</option>
						<option value="3" ${orderState==3?"selected":""}>취소</option>
					</select>
				</td>
			</tr>
		</table>
	
		<table class="table table-border table-list" style="margin-top: 20px;">
				<thead>
					<tr> 
						<th width="200">예약번호</th>
						<th width="200">ID</th>
						<th width="200">예약자 성명</th>
						<th width="200">대여시작일자</th>
						<th width="200">대여종료일자</th>
						<th width="200">예약확인</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr class="hover" onclick="" style="vertical-align: middle;"> 
							<td>${dto.orderNum}</td>
							<td>${dto.userId}</td>
							<td>${dto.userName}</td>
							<td>${dto.start_date}</td>
							<td>${dto.end_date}</td>
							<td>
								<c:url var="detailUrl" value="/admin/carReservation/list">
									<c:param name="orderNum" value="${dto.orderNum}"/>
								</c:url>
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-primary btn-detailView" data-orderNum="${dto.orderNum}">
								  상세보기
								</button>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			 
			<div class="page-navigation" style="width:100%; margin: 0 auto;">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>
					
			<table class="table" style="width:100%">
				<tr>
					<td align="left" width="150">
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/carReservation/list';">
							<i class="bi bi-arrow-clockwise"></i>
						</button>
					</td>
					
					<td align="center">
						<form class="row justify-content-center" name="searchForm" action="${pageContext.request.contextPath}/admin/carReservation/list" method="post">
							<div class="col-auto p-1">
								<select name="schType" class="form-select">
									<option value="all" ${schType=="all"?"selected":""}>전체</option>
									<option value="orderNum" ${schType=="orderNum"?"selected":""}>예약번호</option>
									<option value="userId" ${schType=="userId"?"selected":""}>아이디</option>
								</select>
							</div>
							<div class="col-auto p-1">
								<input type="text" name="kwd" value="${kwd}" class="form-control">
								<input type="hidden" name="orderNum" id="orderNum" value="${orderNum}">
								<input type="hidden" name="orderState" id="orderState" value="${orderState}">
							</div>
							<div class="col-auto p-1">
								<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
							</div>
						</form>
					</td>
				</tr>
			</table>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="carDetailModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="carDetailLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="carDetailLabel">상세내역 확인</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body car-detail-view">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <!-- <button type="button" class="btn btn-primary">Save changes</button>  -->
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">
$(function(){
	$(".btn-detailView").click(function(){
		let orderNum = $(this).data('ordernum'); // let orderNum = $(this).attr('data-orderNum'):이름부분에 소문자로 봐뀜 // 1. ajax 부르기 2. 컨트롤러 레스폰스바디로 프라이머리 키 넘겨주기(해당되는거 가져오기 위해서) 3. dto or 기존 reservation list에서 index로 가져오기
		let url = '${pageContext.request.contextPath}/admin/carReservation/detail?orderNum='+orderNum;
		
		$('#carDetailModal .car-detail-view').load(url);
		
		$('#carDetailModal').modal('show');
		
	});

});


</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>

