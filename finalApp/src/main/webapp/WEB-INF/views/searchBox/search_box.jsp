<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
@charset "utf-8";

* {
    margin: 0;
    padding: 0;
    text-decoration: none;
    color: #333;
    box-sizing: border-box;
}

ol,
ul {
    list-style: none;
}

.yll {
    background-color: var(--bs-warning-bg-subtle)"

}

.hidden {
    display: none;
}

.search_box {
    position: absolute;
    top: 400px;
    left: 50%;
    width: 620px;
    height: 220px;
    background-color: orange;
}

#camSearchForm {
    position: relative;
}

#detail_search {
    position: absolute;
    height: 30px;
    top: -30px;
    right: 0;
    padding: 3px 10px;
    background-color: #161d27;
    border: 1px solid #2f384c;
    color: #fff;
    font-size: 13px;
    cursor: pointer;
}

#camSearchForm .search_box_wrap {
    margin: 34px 40px 0 40px;
}

.search_box_wrap .form {
    display: flex;
    height: 45px;
}
</style>

<div class="search_box">
	<form name="camSearchForm" id="camSearchForm" action="">

		<div class="search_box_wrap">
			<div class="search_box_form">
				<div class="row gx-0" style="margin-bottom: 18px;">
					<div class="col-1 p-2">
						<i class="fa-solid fa-magnifying-glass"></i>
					</div>
					<div class="col-11">
						<input type="text" class="form-control" id="siteKwd" name="siteKwd" value=""
							placeholder="캠핑장 명으로 검색하기">
					</div>
				</div>
				<div class="specific row m-2"
					style="display: flex; justify-content: space-between; width: 545px; margin-left: 0; margin-right: 0; padding-left: 0; padding-right: 0;">
					<div class="col-4 localBox" data-toggle="modal" data-target="#localModal">
						<div class="form-control">
							<input class="siteLocal" name="siteLocal" type="hidden" value="">
							<p class="m-0 siteHtml"> <i class="fa-solid fa-location-dot"></i> 지역 </p>
						</div>
					</div>
					<div class="col-4 environmentBox">
						<div class="form-control">
							<input class="siteEnvironment" name="siteEnvironment" type="hidden" value="">
							<p class="m-0  enHtml"> <i class="fa-solid fa-mountain-sun"></i> 환경</p>
						</div>
					</div>
					<div class="col-4 siteCatBox">
						<div class="form-control">
							<input class="siteCategory" name="siteCategory" type="hidden" value="">
							<p class="m-0  catHtml"> <i class="fa-solid fa-campground"></i> 분류</p>
						</div>
					</div>
				</div>
				<div class="search_wrap" style="width: 534px; margin-top: 12px;">
					<button type="button" id="gogomaniac" onclick="what()" style="background-color: #606060; width: 100%;"
						class=" btn col-12 m-2 text-white">검색</button>
				</div>
			</div>
		</div>
	</form>
</div>










<div class="modal hidden" id="localModal" tabindex="-1" role="dialog" aria-labelledby="localModalLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">지역 선택</h4>
			</div>
			<div class="modal-body">
				<table class="table  table-borderless">

					<tbody>
						<tr>
							<td>
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseLoc"
									data-location="1">서울</button>
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseLoc"
									data-location="2">인천</button>
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseLoc"
									data-location="3">경기</button>
							</td>
						</tr>
						<tr>
							<td scope="row">
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseLoc"
									data-location="4">강원</button>
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseLoc"
									data-location="5">대전</button>
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseLoc"
									data-location="6">세종</button>
							</td>
						</tr>
						<tr>
							<td scope="row">
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseLoc"
									data-location="7">충북</button>
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseLoc"
									data-location="8">충남</button>
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseLoc"
									data-location="9">대구</button>
							</td>
						</tr>
						<tr>
							<td scope="row">
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseLoc"
									data-location="10">울산</button>
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseLoc"
									data-location="11">경북</button>
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseLoc"
									data-location="12">경남</button>
							</td>
						</tr>
						<tr>
							<td scope="row">
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseLoc"
									data-location="13">전북</button>
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseLoc"
									data-location="14">전남</button>
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseLoc jeju"
									data-location="15">제주</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-primary closeModal">닫기</button>
			</div>
		</div>
	</div>
</div>


<div class="modal hidden" id="environmentModal" tabindex="-1" role="dialog" aria-labelledby="environmentModalLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">환경 선택</h4>
			</div>
			<div class="modal-body">
				<table class="table  table-borderless">

					<tbody>
						<tr>
							<td class="text-center">
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseEnv"
									data-environment="1">산</button>
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseEnv"
									data-environment="2">강</button>
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseEnv sea"
									data-environment="3">바다</button>
							</td>
						</tr>
						<tr>
							<td class="text-center">
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseEnv"
									data-environment="4">도심</button>
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseEnv"
									data-environment="5">계곡</button>
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseEnv"
									data-environment="6">호수</button>
							</td>
						</tr>
						<tr>
							<td class="text-center">
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseEnv"
									data-environment="7">평야</button>
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseEnv"
									data-environment="8">기타</button>

							</td>
						</tr>

					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-primary closeModal">닫기</button>
			</div>
		</div>
	</div>
</div>

<div class="modal hidden" id="siteCatModal" tabindex="-1" role="dialog" aria-labelledby="catModalLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">환경 선택</h4>
			</div>
			<div class="modal-body">
				<table class="table  table-borderless">

					<tbody>
						<tr>
							<td class="text-center">
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseCat"
									data-category="1">오토캠핑</button>
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseCat"
									data-category="2">글램핑</button>
							</td>
						</tr>
						<tr>
							<td class="text-center">
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseCat"
									data-category="3">카라반</button>
								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseCat"
									data-category="4">방갈로</button>
							</td>
						</tr>
						<tr>
							<td class="text-center">

								<button class="btn ms-1 btn-light btn-lg  border-dark btn-chooseCat"
									data-category="5">차박</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-primary closeModal">닫기</button>
			</div>
		</div>
	</div>
</div>

<script>
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



$(function(){
	$('.localBox').click(function(){
		
      $("#localModal").show();
    });
	$('.siteCatBox').click(function(){
		
      $("#siteCatModal").show();
    });
	$('.environmentBox').click(function(){
		
      $("#environmentModal").show();
    });
	
});

$(function(){
	$('.btn-chooseLoc').click(function(){
		let $i=document.querySelector(".siteHtml")
		$i.innerHTML=' <i class="fa-solid fa-location-dot"></i> '+$(this).text();
		document.querySelector(".siteLocal").value=$(this).data("location")
		$(this).closest(".modal").hide();
    });
	$('.btn-chooseEnv').click(function(){
		let $i=document.querySelector(".enHtml")
		$i.innerHTML=' <i class="fa-solid fa-mountain-sun"></i> '+$(this).text();
		document.querySelector(".siteEnvironment").value=$(this).data("environment")
		$(this).closest(".modal").hide();
    });
	$('.btn-chooseCat').click(function(){
		let $i=document.querySelector(".catHtml")
		$i.innerHTML=' <i class="fa-solid fa-campground"></i> '+$(this).text();
		document.querySelector(".siteCategory").value=$(this).data("category")
		$(this).closest(".modal").hide();
    });
	
});



$(function(){
	$('.closeModal').click(function(){
		$(this).closest(".modal").hide();
    });
	
});

function what(){
	const f= document.camSearchForm;
	f.action="${pageContext.request.contextPath}/site/list";
	f.submit();
	
}
</script>