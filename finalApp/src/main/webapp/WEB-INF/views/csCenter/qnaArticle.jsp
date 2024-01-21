<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 1080px; /*수정*/
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

.tab-content { width: 1080px; margin: 20px auto; } /*수정*/

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
//탭
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
</script>

<script type="text/javascript">
function deleteInquiry() {
	if(confirm("문의를 삭제 하시겠습니까 ?")) {
		let query = "num=${dto.num}&${query}";
		let url = "${pageContext.request.contextPath}/csCenter/qna/delete?"+query;
		location.href = url;
	}
}
</script>

<div class="container">
	<div class="body-container">	

		<div class="body-main">

			<ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="1" aria-selected="false">공지사항</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="2" aria-selected="false">자주 묻는 질문</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="tab-3" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="3" aria-selected="true">1:1 질문</button>
				</li>
                <li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-4" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="4" aria-selected="false">이벤트</button>
				</li>
			</ul>
			
			<div class="tab-content pt-4" id="myTabContent">
				<div class="tab-pane fade show active" id="tab-pane" role="tabpanel" aria-labelledby="tab-3" tabindex="0">

					<table class="table mt-5 mb-0">
						<tbody>
							<tr>
								<td colspan="2" class="px-0 pb-0">
									<div class="row gx-0">
										<div class="col-sm-1 bg-primary me-1">
											<p class="form-control-plaintext text-white text-center">Q.</p>
										</div>
										<div class="col bg-primary">
											<p class="form-control-plaintext text-white ps-2">${dto.subject}</p>
										</div>
									</div>
								</td>
							</tr>				
						
							<tr>
								<td width="50%">
									카테고리 : ${dto.category}
								</td>
								<td align="right">
									작성자 : ${dto.userName}
								</td>
							</tr>
		
							<tr>
								<td width="50%">
									문의일자 : ${dto.reg_date}
								</td>
								<td align="right">
									처리결과 : ${(empty dto.answer_date)?"답변대기":"답변완료"}
								</td>
							</tr>
							
							<tr>
								<td colspan="2" valign="top" height="200">
									${dto.content}
								</td>
							</tr>
						</tbody>
					</table>
					
					<c:if test="${not empty dto.answer}">
						<table class="table mb-0">
							<tbody>
								<tr>
									<td colspan="2" class="p-0">
										<div class="row gx-0">
											<div class="col-sm-1 bg-success me-1">
												<p class="form-control-plaintext text-white text-center">A.</p>
											</div>
											<div class="col bg-success">
												<p class="form-control-plaintext text-white ps-2">[답변] ${dto.subject}</p>
											</div>
										</div>
									</td>
								</tr>
							
								<tr>
									<td width="50%">
										담당자 : 관리자
									</td>
									<td align="right">
										답변일자 : ${dto.answer_date}
									</td>
								</tr>
								
								<tr>
									<td colspan="2" valign="top" height="150">
										${dto.answer}
									</td>
								</tr>
							</tbody>
						</table>
					</c:if>
					
					<table class="table table-borderless mb-2">
						<tr>
							<td width="50%">
								<button type="button" class="btn btn-light" onclick="deleteQna();">질문삭제</button>
							</td>
							<td class="text-end">
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/csCenter/qna/List?${query}';">리스트</button>
							</td>
						</tr>
					</table>
				</div>
			</div>

		</div>
	</div>
</div>