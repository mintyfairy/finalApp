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
               <button class="nav-link ${orderStatus=='status'?'active':''}" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="2" aria-selected="${orderStatus=='status'?'true':'false'}">주문상세</button>
           </li>
           <li class="nav-item" role="presentation">
               <button class="nav-link ${orderStatus=='delivery'?'active':''}" id="tab-3" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="3" aria-selected="${orderStatus=='delivery'?'true':'false'}">배송관리</button>
           </li>
           <li class="nav-item" role="presentation">
               <button class="nav-link ${orderStatus=='delivery'?'active':''}" id="tab-4" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="4" aria-selected="${orderStatus=='delivery'?'true':'false'}">교환관리</button>
           </li>
           <li class="nav-item" role="presentation">
               <button class="nav-link ${orderStatus=='delivery'?'active':''}" id="tab-5" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="5" aria-selected="${orderStatus=='delivery'?'true':'false'}">반품및주문취소</button>
           </li>
       </ul>
       
       <div class="tab-content pt-4" id="myTabContent">

           <div class="row board-list-header">
               <div class="col-auto me-auto">
                   <c:if test="${orderStatus =='status'}">
                       <div class="form-check form-check-inline">
                           <input type="radio" id="order-state1" class="form-check-input" name="orderstatus" value="1" ${state==1 ? "checked='checked'" : ""}> <label class="form-check-label" for="order-state1">신규 주문</label>
                       </div>
                       <div class="form-check form-check-inline">
                           <input type="radio" id="order-state2" class="form-check-input" name="orderstatus" value="2" ${state==2 ? "checked='checked'" : ""}> <label class="form-check-label" for="order-state2">전체 주문</label>
                       </div>
                   </c:if>
                   <div class="form-check form-check-inline">&nbsp;</div>
               </div>
               <div class="col-auto">
               1개(1/1 페이지)
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
                   <c:forEach var="dto" items="" varStatus="status">
                       <tr valign="middle">
                           <td>11</td>
                           <td>주문</td>
                           <td>구매자</td>
                           <td>2023.12.24</td>
                           <td>23,000원</td>
                           <td>1개</td>
                           <td>0건</td>
                           <td>상태변경</td>
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

           <div class="row board-list-footer">
               <div class="col">
                   <button type="button" class="btn btn-light" onclick="" title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>
               </div>
               <div class="col-6 text-center">
                   <form class="row" name="searchForm" action="" method="post">
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

<div id="member-dialog" style="display: none;"></div>
