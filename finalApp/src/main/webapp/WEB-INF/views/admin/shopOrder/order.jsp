<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	box-sizing: border-box;
}

ol,
ul {
	list-style: none;
}

table th, td {
  text-align: center;
}

.body-container {
	max-width: 1080px;
	margin: 0 auto;
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

.orderStatus-update, .orderDetailStatus-update { cursor: pointer;  }
.orderStatus-update:hover, .orderDetailStatus-update:hover { color: #0d6efd; }

.page-navigation {
	margin: 0 auto;
	display: flex;
	justify-content: center;
	align-content: center;
}

/* 글 리스트 */
.board-list-header { padding-top: 7px; padding-bottom: 7px; }

.board-list { width: 100%; }
.board-list > thead { color: #787878; }
.board-list > thead tr:first-child { border-top: 2px solid #454545; }
.board-list tr>th, .board-list tr>td { text-align: center; }
.board-list .left { text-align: left; padding-left: 5px; }

.board-list .bw-30 { width: 30px; }
.board-list .bw-40 { width: 40px; }
.board-list .bw-50 { width: 50px; }
.board-list .bw-60 { width: 60px; }
.board-list .bw-70 { width: 70px; }
.board-list .bw-80 { width: 80px; }
.board-list .bw-90 { width: 90px; }
.board-list .bw-100 { width: 100px; }
.board-list .bw-110 { width: 110px; }
.board-list .bw-120 { width: 120px; }
.board-list .bw-130 { width: 130px; }
.board-list .bw-140 { width: 140px; }
.board-list .bw-150 { width: 150px; }
.board-list .bw-160 { width: 160px; }
.board-list .bw-170 { width: 170px; }

.board-list-footer { padding-top: 7px; padding-bottom: 7px; }

/* 글 쓰기 폼 */
.write-form tr>td { vertical-align: middle; }
.write-form p { line-height: 200%; }
.write-form tr:first-child { border-top: 2px solid #454545; }
.write-form tr>td:first-child { text-align: center; }
.write-form tr>td:nth-child(2) { padding-left: 10px; }
.write-form textarea { height: 170px; resize : none; }

.board-article thead>tr:first-child { border-top: 2px solid #454545; }

/* 댓글 */
.reply { clear: both; padding: 20px 0 10px; }
.reply .bold { font-weight: 600; }

.reply .form-header { padding-bottom: 7px; }
.reply-form  tr>td { padding: 2px 0 2px; }
.reply-form textarea { width: 100%; height: 75px; resize: none; }
.reply-form button { padding: 8px 25px; }

.reply .reply-info { padding-top: 25px; padding-bottom: 7px; }
.reply-info .reply-count { color: #3EA9CD; font-weight: 600; }

.reply-writer .icon { font-size: 1.6rem; color: #999; }
.reply-writer .name { font-size: 13px; font-weight: 600; }
.reply-writer .date { font-size: 10px; }

.reply .reply-dropdown { cursor: pointer; }
.reply .reply-dropdown:hover { color: #0d6efd; font-weight: 500; }
.reply .reply-menu { display: none; position: absolute; width: 80px; min-height: 65px; background:#fff; border: 1px solid #d5d5d5; border-radius: 3px; z-index: 9999; }
.reply .reply-menu-item { text-align: center; cursor: pointer; padding: 7px; }
.reply .reply-menu-item:nth-child(2n+1) { border-bottom: 1px solid #d5d5d5; }
.reply .reply-menu-item:hover { color: #0d6efd; font-weight: 500; }

.reply-answer { display: none; }
.reply-answer textarea { width:98%; height: 75px; resize: none; }
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<script type="text/javascript">
	//검색
	function searchList() {
		const f = document.searchForm;
		f.submit();
	}
	
	// state
	function changeState() {
		let state = $('#listState').val();
		
		const f = document.searchForm;
		f.state.value = state;
		searchList();
	}
	
	// 탭
	$(function(){
		$("button[role='tab']").on('click', function(){
			const tab = $(this).attr("aria-controls");
			
			if(tab === "1") { // 주문관리
				location.href = "${pageContext.request.contextPath}/admin/shopOrder/status";
			} else if( tab === "2") { // 교환관리
				location.href = "${pageContext.request.contextPath}/admin/shopOrder/exchange";
			} else if( tab === "3") { // 반품 및 주문 취소
				location.href = "${pageContext.request.contextPath}/admin/shopOrder/refund";
			}
		});
	});
</script>


<div class="body-container">
   <div class="body-title">
	<h2><i class="fa-solid fa-user-group"></i> 상품주문관리 </h2>
   </div>
   
   <div class="body-main">
      <ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
          <li class="nav-item" role="presentation">
              <button class="nav-link ${orderStatus=='status'?'active':''}" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="1" aria-selected="${orderStatus=='status'?'true':'false'}">주문관리</button>
          </li>
          <li class="nav-item" role="presentation">
              <button class="nav-link ${orderStatus=='exchange'?'active':''}" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="2" aria-selected="${orderStatus=='exchange'?'true':'false'}">교환관리</button>
          </li>
          <li class="nav-item" role="presentation">
              <button class="nav-link ${orderStatus=='refund'?'active':''}" id="tab-3" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="3" aria-selected="${orderStatus=='refund'?'true':'false'}">반품및주문취소</button>
          </li>
      </ul>
      
      <div class="tab-content pt-4" id="myTabContent">

          <div class="row board-list-header">
              <div class="col-auto me-auto">
                  <c:if test="${orderStatus =='status'}">
                  <!-- 
                      <div class="form-check form-check-inline">
                          <input type="radio" id="order-state2" class="form-check-input" name="orderstatus" value="1" ${state==1 ? "checked='checked'" : ""}> <label class="form-check-label" for="order-state2">전체 주문</label>
                      </div>
                      <div class="form-check form-check-inline">
                          <input type="radio" id="order-state1" class="form-check-input" name="orderstatus" value="2" ${state==2 ? "checked='checked'" : ""}> <label class="form-check-label" for="order-state1">신규 주문</label>
                      </div>
                       -->
                       <select id="listState" name="state" class="form-select" onchange="changeState();">
						<option value="1" ${ state == 1 ? 'selected' : '' }>:: 전체 ::</option>
						<option value="2" ${ state == 2 ? 'selected' : '' }>:: 최근주문 ::</option>
						<option value="3" ${ state == 3 ? 'selected' : '' }>:: 배송단계 ::</option>
					</select>
                  </c:if>
                  <div class="form-check form-check-inline">&nbsp;</div>
              </div>
              <div class="col-auto">
              		${dataCount}개(${page}/${total_page} 페이지)
              </div>
          </div>
          
          <table class="table board-list">
              <colgroup>
			<col width="100">
			<col width="100">
			<col width="130">
			<col width="150">
			<col width="130">
			<col width="100">
			<col width="100">
			<col width="120">
			</colgroup>
              <thead class="table-light">
                  <tr>
                      <th>주문번호</th>
                      <th>주문구분</th>
                      <th>주문자</th>
                      <th>주문일자</th>
                      <th>결제금액</th>
                      <th>주문수량</th>
                      <th>취소건수</th>
                      <th>변경</th>
                  </tr>
              </thead>
              
              <tbody>
                  <c:forEach var="dto" items="${ list }" varStatus="status">
                      <tr valign="middle">
                          <td>${ dto.orderNum }</td>
                          <td>${ dto.orderState }</td>
                          <td>${ dto.userName }</td>
                          <td>${ dto.orderDate }</td>
                          <td><fmt:formatNumber value="${dto.payment}"/></td>
                          <td>${ dto.totalQty }개</td>
                          <td>${ dto.detailCancelCount }건</td>
                          <td>
                          		<span class="orderStatus-update" data-orderNum="${dto.orderNum}" onclick="location.href='${pageContext.request.contextPath}/admin/shopOrder/detail/${ dto.orderNum }?orderStatus=${ orderStatus }';">${orderStatus=="status"?"상태변경":"배송변경"}</span>
                          </td>
                      </tr>
                  </c:forEach>
              </tbody>
          </table>
          
          <div class="page-navigation">
			${dataCount == 0 ? "등록된 주문정보가 없습니다." : paging}
          </div>

          <div class="row board-list-footer">
              <div class="col">
                  <button type="reset" class="btn btn-light" onclick="" title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>
              </div>
              <div class="col-6 text-center">
                  <form class="row" name="searchForm" action="${pageContext.request.contextPath}/admin/shopOrder/${orderStatus}" method="post">
                      <div class="col-auto p-1">
                          <select name="schType" class="form-select">
                              
                              <option value="orderNum">주문번호</option>
                              <c:if test="${orderStatus=='delivery'}">
                                  <option value="invoiceNumber" ${schType=="invoiceNumber"?"selected":""}>송장번호</option>
                              </c:if>
                              <option value="userName" ${schType=="userName"?"selected":""}>주문자</option>
                              <option value="orderDate" ${schType=="orderDate"?"selected":""}>주문일자</option>
                          </select>
                      </div>
                      <div class="col-auto p-1">
                          <input type="hidden" name="state" value="${state}">
                          <input type="text" name="kwd" value="" class="form-control">
                      </div>
                      <div class="col-auto p-1">
                          <button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
                      </div>
                  </form>
              </div>
              <div class="col text-end">
                  &nbsp;
              </div>
          </div>
      
      </div>
  </div>
</div>

<!-- 주문정보-상태변경/배송변경 대화상자  -->
<div class="modal hidden" id="orderDialogModal" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Modal title</h5>
				<button type="button" class="btn-close closeModal" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-orderDetail-body">
				<p>현재 재고 : </p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary closeModal" data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Send</button>
			</div>
		</div>
	</div>
</div>

<div id="member-dialog" style="display: none;"></div>

<script type="text/javascript">
function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			success:function(data) {
				fn(data);
			},
			beforeSend: function(jqXHR) {
				jqXHR.setRequestHeader('AJAX', true);
			},
			complete: function () {
			},
			error: function(jqXHR) {
				if(jqXHR.status === 403) {
					login();
					return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	}
		    	
				console.log(jqXHR.responseText);
			}
	};
	
	if(file) {
		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
	}
	
	$.ajax(url, settings);
}

// 상품 상세 모달창 띄우기
/*
$(function() {
	$('.orderStatus-update').click(function () {
		let orderNum = $(this).attr("data-orderNum");
		let orderStatus = "${orderStatus}";
		console.log(orderNum);
		
		let url = "${pageContext.request.contextPath}/admin/shopOrder/detail/" + orderNum + "?orderStatus=" + orderStatus;
		
		$('.modal-orderDetail-body').load(url);
		
		$('#orderDialogModal').show();
	});
});
*/

//모달창 닫기
$(function() {
	$('.closeModal').click(function() {
		$(this).closest(".modal").hide();
	});
});
</script>