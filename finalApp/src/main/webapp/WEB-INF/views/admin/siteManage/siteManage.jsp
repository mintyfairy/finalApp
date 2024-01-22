<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	color: #333;
	text-decoration: none;
	box-sizing: border-box;
}

ol, ul {
	list-style: none;
}

a {
	color: #333;
	text-decoration: none;
}

.body-container {
	padding-left: 250px;
	margin-top: 60px;
}

.body-title {
	width: 1080px;
}

.body-main {
	max-width: 930px;
}
</style>

<div id="loadingLayout" style="display:none; position: absolute; left: 0; top:0; width: 100%; height: 100%; z-index: 9000; background: #eee;">
	<div class="loader"></div>
</div>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">



<div class="body-container">
    <div class="body-title">
		<h2><i class="fa-solid fa-user-group"></i> 캠핑장관리 </h2>
		<table class="table">
			<tr>
				<td align="right">
					<button type="button" class="btn-border-primary" onclick="
								location.href ='${pageContext.request.contextPath}/admin/siteManage/site/write'">켐핑장 등록</button>
				</td>
			</tr>
		</table>
		<table class="table table-border table-list">
			<thead>
				<tr>
					<th class="num">번호</th>
					<th class="boardTitle">캠핑장 이름</th>
					<th class="boardUrl"> 주소</th>
					<th class="boardManage text-center">관리</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="dto" items="${ list}" varStatus="status">
					<tr>
						<td>${dataCount-(page-1)*size-status.index}</td>
						<td style="text-align: left;"><a href="${pageContext.request.contextPath}/admin/siteManage/site/${dto.siteNum}">${dto.siteName}</a></td>
						<td>${dto.addr1}</td>

						<td>
							<button type="button" class="btn-border-primary btnInsertForm" data-sitenum="${dto.siteNum}">광고업체 등록</button>
							<button type="button" class="btn-border-primary" onclick="updateSite('${dto.siteNum}')">수정</button>
							<button type="button" class="btn-border-primary" onclick="deleteSite('${dto.siteNum}')">삭제</button>
						</td>
					</tr>
				</c:forEach>
			<tbody>
			
		</table>
		
		<div class="page-navigation">
			${paging!=null?paging:"데이터가없습니다."}
		</div>
		
    </div>
    <!-- Modal Dialog -->
	<div class="modal fade" id="myDialogModal" tabindex="-1" aria-labelledby="myDialogModalLabel" 
			aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myDialogModalLabel">광고 업체 등록하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body pt-1"></div>
			</div>
		</div>
	</div>	
 </div>

<div id="member-dialog" style="display: none;"></div>
<script>
function deleteSite(num){
	if(confirm('게시판 및 게시판의 게시글을 삭제하시겠습니까?')){
		let q="siteNum="+num;
		location.href="${pageContext.request.contextPath}/admin/siteManage/deleteSite?"+q;
	}
}
function updateSite(num){
	let q="siteNum="+num;
	location.href="${pageContext.request.contextPath}/admin/siteManage/site/update?"+q;
	
}

function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const sentinelNode = document.querySelector('.sentinel');
	
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
		    	} else if(jqXHR.status === 401) {
		    		return false;
		    	} else if(jqXHR.status === 402) {
		    		alert('권한이 없습니다.');
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
$(function(){
	$('.btnInsertForm').on('click', function(){
		// 글 등록 폼
		$('#myDialogModal .modal-body').empty();
		let siteNum=$(this).data('sitenum')
		console.log(siteNum)
		let url = '${pageContext.request.contextPath}/admin/siteManage/adWrite?siteNum='+siteNum;
		$.ajaxSetup({ beforeSend: function(e) { e.setRequestHeader('AJAX', true); } });
		$.get(url, function(data){
			$('#myDialogModal .modal-body').html(data);
			
			$('#myDialogModal').modal('show');
			
		}).fail(function(){
			alert('error');
		});
	});
});

$(function(){
	$('.body-container').on('click', '.btnSendOk', function() {
		//  글 등록 완료 및 수정 완료
		const f = document.AdSiteForm;
		
		let str;
		let today = new Date();
		str = f.startP.value;
		if(!str) {
			alert('시작일을 입력하세요. ');
			f.startP.focus();
			return false;
		}

		str = f.endP.value;
	    if(!str) {
	        alert('종료일을 입력하세요. ');
	        f.endP.focus();
	        return;
	    }
	    let date1 = new Date(f.startP.value);
	    let date2 = new Date(f.endP.value);
	    if (date1<=today){
	    	alert('오늘 날짜 이후를 입력하세요.');
			f.startP.focus();
			return false;
	    }
	    if (date2<=date1){
	    	alert('종료일은 시작일 이후여야합니다');
			f.endP.focus();
			return false;
	    }
		console.log(f.startP.value)
		console.log(f.endP.value)
		let url = "${pageContext.request.contextPath}/admin/siteManage/adWrite";
	    let formData =  $('form[name=AdSiteForm]').serialize();
		console.log(formData)
		
		const fn = function(data){
			let state = data.state;
	        if(state === "false") {
	            alert("등록실패");
	            return false;
	        }
	    	$('#myDialogModal').modal('hide');
		};
		
		ajaxFun(url, 'post', formData, 'json', fn);		
	});
});
$(function(){
	$('.body-container').on('click', '.btnModalClose', function() {
		//  대화상자 닫기
		$('#myDialogModal').modal('hide');
	});
});
</script>