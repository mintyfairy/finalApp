<%@ page contentType="text/html; charset=UTF-8" %>
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


.table img {
	max-width: 650px;
}

.body-main { width: 850px; margin: 20px auto; }

button.btn-category {
	cursor: pointer;
	border: none;
	background: #fff;
	padding: 7px;
	
}

button.btnActive {
	font-weight: 600;
	border-bottom:1px solid #333;
}

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
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

$(function(){
	let menu = "${category}";
	$("#tab-"+menu).addClass("btnActive");

	$(".btn-category").on("click", function(e) {
		const menu = $(this).attr("data-menu");
		let url = "${pageContext.request.contextPath}/csCenter/event/"+menu+"/list";
		location.href = url;
    });
});

$(function(){
	$(".btnApplyEvent").click(function(){
		if(! confirm("이벤트에 응모하시겠습니까 ? ")) {
			return false;
		}
		
		const $btn = $(this); 
		let num= "${dto.num}";
		let url = "${pageContext.request.contextPath}/csCenter/event/progress/apply";
		
		$.post(url, {num:num}, function(data){
			let state = data.state;
			
			if(state === "true") {
				$btn.prop("disabled", true);
				$btn.text("이벤트 응모 완료");
			} else if(state === "timeout"){
				alert("이벤트 응모기간이 지났습니다.");
			} else {
				alert("이벤트 응모는 한번만 가능합니다.");
			}
			
		}, "json");
	});
});
</script>

<div class="container">
	<div class="body-container">	
		<ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="1" aria-selected="false">공지사항</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="2" aria-selected="false">자주 묻는 질문</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-3" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="3" aria-selected="false">1:1 질문</button>
				</li>
                <li class="nav-item" role="presentation">
					<button class="nav-link active" id="tab-4" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="4" aria-selected="true">이벤트</button>
				</li>
			</ul>
		
		<div class="body-main">
			<div class="tab-content pt-2" id="nav-tabContent">	
						&nbsp;
						&nbsp;
						&nbsp;
						
				<table class="table mb-0">
					<thead>
						<tr>
							<td colspan="2" align="center">
								<b>${dto.title}</b>
							</td>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<td width="50%">
								이벤트 기간 : ${dto.startDate} ~ ${dto.endDate}
							</td>
							<td align="right">
								조회 : ${dto.hitCount}
							</td>
						</tr>
						
						<c:if test="${dto.winnerNumber != 0}">
							<tr>
								<td width="50%">
									당첨일자 :
									<c:choose>
										<c:when test="${listEventWinner.size() == 0 && (category == 'winner' || category == 'ended') }">
											당첨이 곧 진행 예정입니다.
										</c:when>
										<c:otherwise>
											${dto.winningDate}
										</c:otherwise>
									</c:choose>									
								</td>
								<td align="right">
									<c:choose>
										<c:when test="${listEventWinner.size() != 0 && (category == 'winner' || category == 'ended')}">
											당첨 인원 : ${listEventWinner.size()}명
										</c:when>
										<c:when test="${category == 'progress'}">
											당첨 인원 : ${dto.winnerNumber}
										</c:when>
									</c:choose>
								</td>
							</tr>
						</c:if>
						
						<c:if test="${listEventWinner.size() != 0 && category == 'winner' && not empty userWinner}">
							<tr>
								<td colspan="2" class="py-3" align="center" >
									<p class="form-control-plaintext">
										<span>축하합니다.</span>
										<span style="color: blue; font-weight: 600;">${sessionScope.member.userName}</span>님은
										<c:if test="${userWinner.rank != 0}">
											<span>이벤트에 <label style="color: tomato; font-weight: 500;">${userWinner.rank}</label>등으로 당첨되었습니다 </span>
										</c:if>
										<c:if test="${userWinner.rank == 0}">
											<span>이벤트에 당첨되었습니다.</span>
										</c:if>
									</p>
								</td>
							</tr>
						</c:if>
					
						<tr>
							<td colspan="2" valign="top" height="200" style="${dto.winnerNumber != 0 ? 'border-bottom: none;' : ''}">
								${dto.content}
							</td>
						</tr>
						
						<c:if test="${dto.winnerNumber != 0 && category == 'progress'}">
							<tr>
								<td colspan="2" class="text-center p-3">
									<button type="button" class="btn btn-outline-secondary btnApplyEvent" ${userEventTakers? "disabled='disabled'" : "" }> ${userEventTakers ? "이벤트 응모 완료" : "이벤트 응모" } </button>
								</td>
							</tr>
						</c:if>
												
						<c:if test="${dto.winnerNumber != 0 && (category == 'winner' || category == 'ended')}">
							<tr>
								<td colspan="2" class="text-center p-3">
									<button type="button" class="btn btn-outline-secondary btnEventWinnerList"> 이벤트 당첨자 확인 </button>
								</td>
							</tr>
						</c:if>						

						<tr>
							<td colspan="2">
								이전글 :
								<c:if test="${not empty prevDto}">
									<a href="${pageContext.request.contextPath}/csCenter/event/${category}/article?${query}&num=${prevDto.num}">${prevDto.title}</a>
								</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								다음글 :
								<c:if test="${not empty nextDto}">
									<a href="${pageContext.request.contextPath}/csCenter/event/${category}/article?${query}&num=${nextDto.num}">${nextDto.title}</a>
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
				
				<table class="table table-borderless">
					<tr>
						<td width="50%">&nbsp;</td>
						<td class="text-end">
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/csCenter/event/${category}/list?${query}';">리스트</button>
						</td>
					</tr>
				</table>
			
			</div>
		</div>
	</div>
</div>

<c:if test="${listEventWinner.size() != 0}">
	<script type="text/javascript">
		$(function(){
			$(".btnEventWinnerList").click(function(){
				$("#eventWinnerModal").modal("show");	
			});
		});
	</script>
	
	<div class="modal fade" id="eventWinnerModal" tabindex="-1" aria-labelledby="eventWinnerModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="eventWinnerModalLabel">이벤트 당첨자 리스트</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body pt-1 text-center">
	                 <div class="row row-cols-4 g-1">
	                 	<c:forEach var="vo" items="${listEventWinner}" varStatus="status">
	                 		<div class="col">
	                 			<div class="border">
		                 			<c:if test="${vo.rank != 0}">
										<span>
											${vo.rank}등 :
										</span>
									</c:if>
									<span style="font-weight: 500;">
										${vo.userName}(${vo.userId})
									</span>
								</div>
	                 		</div>
	                 	</c:forEach>
	                 </div>
				</div>
			</div>
		</div>
	</div>
</c:if>