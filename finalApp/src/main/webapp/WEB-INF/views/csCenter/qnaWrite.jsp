<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
function sendOk() {
    const f = document.myForm;
	let str;
	
    str = f.subject.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

    str = f.content.value.trim();
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/csCenter/qna/${mode}";
    f.submit();
}
</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-question-diamond"></i> 1:1 문의 </h3>
		</div>
		
		<div class="body-main">
		
			<form name="myForm" method="post">
				<table class="table mt-5 write-form">
					<tr>
						<td class="bg-light col-sm-2" scope="row">구 분</td>
						<td>
							<select name="category" class="form-select">
								<option value="캠핑장" ${dto.category=="캠핑장 관련 문의"?"selected":"" }>강좌</option>
								<option value="캠핑카" ${dto.category=="캠핑카 관련 문의"?"selected":"" }>결제문의</option>
								<option value="쇼핑몰" ${dto.category=="쇼핑몰 관련 문의"?"selected":"" }>회원가입</option>
								<option value="공통사항" ${dto.category=="공통 문의"?"selected":"" }>기타문의</option>
							</select>
						</td>
					</tr>
				
					<tr>
						<td class="bg-light col-sm-2" scope="row">제 목</td>
						<td>
							<input type="text" name="subject" class="form-control" value="${dto.subject}">
						</td>
					</tr>
        
					<tr>
						<td class="bg-light col-sm-2" scope="row">작성자명</td>
 						<td>
							<p class="form-control-plaintext">${sessionScope.member.userName}</p>
						</td>
					</tr>

					<tr>
						<td class="bg-light col-sm-2" scope="row">내 용</td>
						<td>
							<textarea name="content" class="form-control">${dto.content}</textarea>
						</td>
					</tr>
				</table>
				
				<table class="table table-borderless">
 					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/csCenter/qna/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		
		</div>
	</div>
</div>