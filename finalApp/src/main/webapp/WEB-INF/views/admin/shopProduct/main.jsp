<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 1080px;
	margin: 0 auto;
}

.nav-tabs .nav-link {
	min-width: 110px;
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

.tab-pane {
	min-height: 300px;
}

.table-list {
	width: 100%;
}

.table-list thead {
	color: #787878;
}

.table-list tr>th {
	padding-top: 10px;
	padding-bottom: 10px;
}

.table-list tr>th,
.table-list tr>td {
	text-align: center;
}

.table-list .left {
	text-align: left;
	padding-left: 5px;
}

.product-subject {
	display: flex;
	align-items: center;
	border: none;
}

.product-subject img {
	vertical-align: top;
	width: 50px;
	height: 50px;
	border-radius: 5px;
	border: 1px solid #d5d5d5;
}

.product-subject label {
	display: inline-block;
	width: 300px;
	padding-left: 5px;
	vertical-align: top;
	white-space: pre-wrap;
}

.page-navigation {
	margin: 0 auto;
	display: flex;
	justify-content: center;
	align-content: center;
}

</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}

function changeList() {
	let parentNum = $("#changeCategory").val();
	let productShow = $("#changeShowProduct").val();
	let brandNum = $("#changeBrand").val();
	
	const f = document.searchForm;
	f.parentNum.value = parentNum;
	f.categoryNum.value = 0;
	f.productShow.value = productShow;
	f.brandNum.value = brandNum;
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

// 탭
$(function(){
	$("button[role='tab']").on('click', function(){
		const tab = $(this).attr("aria-controls");
		
		if(tab === "1") { // 일반상품
			location.href="${pageContext.request.contextPath}/admin/shopProduct/main";
		} else if( tab === "2") { // 특가상품
			$("#changeCategory").val(0);
			$("#changeBrand").val(0);
			location.href="${pageContext.request.contextPath}/admin/shopProduct/main?special=1&tab=2&categoryNum=0&brandNum=0";
		} else if( tab === "3") { // md추천
			$("#changeCategory").val(0);
			$("#changeBrand").val(0);
			location.href="${pageContext.request.contextPath}/admin/shopProduct/main?md=1&tab=3&categoryNum=0&brandNum=0";
		} else if( tab === "4") { // 캠핑스타터
			$("#changeCategory").val(0);
			$("#changeBrand").val(0);
			location.href="${pageContext.request.contextPath}/admin/shopProduct/main?starter=1&tab=4&categoryNum=0&brandNum=0";
		}
	});
});

// 새로고침
$(function(){
	$(document).ready(function() {
	    // 버튼 클릭 시 페이지 새로고침
	    $("#refreshButton").on("click", function() {
	        location.reload();
	    });
	});
});
</script>


<div class="body-container">
    <div class="body-title">
		<h2><i class="fa-solid fa-user-group"></i> 쇼핑몰상품관리 </h2>
    </div>
    
    <div class="body-main">
		<ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link ${tab==1?'active':''}" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="1" aria-selected="${tab==1?'true':'false'}">모든상품</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link ${special==1?'active':''}" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="2" aria-selected="${special==1?'true':'false'}">특가상품</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link ${md==1?'active':''}" id="tab-3" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="3" aria-selected="${md==1?'true':'false'}">MD추천</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link ${starter==1?'active':''}" id="tab-4" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="4" aria-selected="${starter==1?'true':'false'}">캠핑스타터</button>
			</li>
		</ul>
		
		<div class="tab-content pt-4" id="myTabContent">
			<div class="tab-pane fade show active" id="tab-pane" role="tabpanel" aria-labelledby="tab-1" tabindex="0">
				<div class="row mb-2">
					<c:if test="${ tab == 1 }">
					<div id="option_wrap" class="col">
						<div class="row text-end">
							<div class="col-auto pe-1">
								<select id="changeCategory" class="form-select" onchange="changeList();">
									<c:if test="${listCategory.size() == 0}">
										<option value="0">:: 텐트 ::</option>
									</c:if>
									<option value="0">대분류</option>
									<c:forEach var="vo" items="${listCategory}">
										<option value="${vo.categoryNum}" ${parentNum==vo.categoryNum?"selected":""}>${ vo.categoryName }</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-auto pe-1">
								<select id="changeSubCategory" class="form-select" onchange="changeSubList();">
									<c:if test="${listSubCategory.size() == 0}">
										<option value="0">:: 베이직 텐트 ::</option>
									</c:if>
									<option value="0">상세분류</option>
									<c:forEach var="vo" items="${listSubCategory}">
										<option value="${vo.categoryNum}" ${categoryNum==vo.categoryNum?"selected":""}>${ vo.categoryName }</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-auto pe-1">
								<select id="changeBrand" class="form-select" onchange="changeList();">
									<c:if test="${listBrand.size() == 0}">
										<option value="0">:: 브랜드 ::</option>
									</c:if>
									<option value="0">브랜드</option>
									<c:forEach var="vo" items="${listBrand}">
										<option value="${vo.brandNum}" ${brandNum==vo.brandNum?"selected":""}>${vo.brandName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-auto ps-1">
								<select id="changeShowProduct" class="form-select" onchange="changeList();">
									<option value="-1">:: 진열 여부 ::</option>
									<option value="1" ${productShow==1?"selected":""}>상품 진열</option>
									<option value="0" ${productShow==0?"selected":""}>상품 숨김</option>
								</select>						
							</div>
						</div>
					</div>
					</c:if>
					<div class="col-auto pt-2 text-end">
						${ dataCount }개(${ page }/${ total_page } 페이지)
					</div>
				</div>
				
				<table class="table table-border table-list" style="width: 1080px;">
					<colgroup>
						<col width="100">
						<col width="*">
						<col width="80">
						<col width="100">
						<col width="60">
						<col width="60">
						<col width="130">
						<col width="130">
						<col width="230">
					</colgroup>
					<thead>
						<tr class="border-top border-dark table-light">
							<th>상품코드</th>
							<th>상품명</th>
							<th>가격</th>
							<th>할인율</th>
							<th>재고</th>
							<th>진열</th>
							<th>등록일</th>
							<th>수정일</th>
							<th>변경</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr valign="middle">
								<td>${dto.productNum}</td>
								<td class="product-subject left">
									<img src="${pageContext.request.contextPath}/uploads/shop/product/${dto.thumbnail}">
									<a href="#"><label>${ dto.productName }</label></a>
								</td>
								<td>${ dto.price }</td>
								<td>${ dto.discountRate }%</td>
								<td>${ dto.totalStock }</td>
								<td>${ dto.productShow == 1 ? "O" : "X" }</td>
								<td>${ dto.reg_date }</td>
								<td>${ dto.updateDate }</td>
								<td>
									<button type="button" class="btn border">재고</button>
									<button type="button" class="btn border" onclick="location.href='';">수정</button>
									<button type="button" class="btn border" onclick="location.href='';">숨김</button>
								</td>
							</tr>					
						</c:forEach>
					</tbody>
				</table>

				<div class="page-navigation">
					<nav aria-label="pnav">
                           <ul class="pagination">
                               <li class="page-item">
                               <a class="page-link" href="#" aria-label="Previous">
                                   <span aria-hidden="true">&laquo;</span>
                               </a>
                               </li>
                               <li class="page-item"><a class="page-link" href="#">1</a></li>
                               <li class="page-item">
                               <a class="page-link" href="#" aria-label="Next">
                               <span aria-hidden="true">&raquo;</span>
                               </a>
                               </li>
                           </ul>
                       </nav>
				</div>
				
				<table class="table table-borderless">
					<tr>
						<td width="150">
							<button id="refreshButton" type="button" class="btn btn-light"> <i class="bi bi-arrow-clockwise"></i> </button>				
						</td>
						<td align="center">
							<form class="row justify-content-center" name="searchForm" action="${pageContext.request.contextPath}/admin/shopProduct/main" method="post">
								<div class="col-auto p-1">
									<select name="schType" class="form-select">
										<option value="all" >상품명+설명</option>
										<option value="productNum" >상품코드</option>
										<option value="productName" >상품명</option>
										<option value="content">설명</option>
									</select>
								</div>
								<div class="col-auto p-1">
									<input type="text" name="kwd" value="${kwd}" class="form-control">
									<input type="hidden" name="size" value="${size}">
									<input type="hidden" name="special" value="${special}">
									<input type="hidden" name="parentNum" value="${parentNum}">
									<input type="hidden" name="categoryNum" value="${categoryNum}">
									<input type="hidden" name="productShow" value="${productShow}">
									<input type="hidden" name="brandNum" value="${brandNum}">
								</div>
								<div class="col-auto p-1">
									<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
								</div>
							</form>
		
						</td>					
						<td width="150" align="right">
							<c:url var="url" value="">
								<c:if test="${special != 0}">
									<c:param name="special" value=""/>
								</c:if>
							</c:url>
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/shopProduct/write';">등록하기</button>
						</td>
					</tr>
				</table>
				
			</div>
		</div> 

	</div>
    
</div>



<div class="modal hidden" id="detailModal" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Modal title</h5>
				<button type="button" class="btn-close closeModal" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<p>Modal body text goes here.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary closeModal" data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>

<div id="member-dialog" style="display: none;"></div>


<script>
// 모달창 띄우기
$(function() {
	$('.product-subject').click(function() {
		$("#detailModal").show();
	});
});

// 모달창 닫기
$(function() {
	$('.closeModal').click(function() {
		$(this).closest(".modal").hide();
	});
});
</script>








