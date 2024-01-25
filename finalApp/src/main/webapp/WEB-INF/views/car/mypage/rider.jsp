<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

.container {
	width: 1080px;
	margin: 0 auto;
}

.licence {
	width: 800px;
	min-height: 200px;
	padding: 40px;
	margin: 70px auto;
	text-align: center;
	
}

.btn {
	border: none;
	color: #FFF;
	background-color: #5DC8CD;
}

.btn:hover {
	color: #FFF;
	background-color: #01939A;
}

.mypage_header {
	margin: 0 auto;
}

.mypage {
	display: felx;
	flex-wrap: wrap;
}

.mypage_p {
	width: 200px;

}

.rider {
	height: 250px;
	margin: 10px auto;
	padding: 30px 20px 20px 10px;
	text-align: left;
	font-size: 19px;
	
}

.rider_info {
	margin-bottom: 100px;
}


.img {
	width: 300px;
	height: 250px;
}


.main{
		width: 950px; /* 너비를 70%로 설정합니다. */
		height: 120px;
        margin: 0 auto; /* 왼쪽과 오른쪽에 10px의 공백을 추가합니다. */
   		margin-top: 50px;
        border: 3px solid #e2e2e2;
        border-radius: 20px;
        display: flex;
        justify-content: space-between;
        padding: 0 40px;
	}
	
	
	.main div {
		margin: 0 10px;
		text-align:center;
	}
	
	.name {
		font-size: 25px;
		font-weight:bold;
	}
	
	.name span {
		color: gray;
		font-size: 20px;
		font-weight: normal;
	}
	
	#result {
        display: none;
    }
    
    
    
</style>


	<div class="main">
		<div style="padding-top: 20px;">
			<img class="img" src="${pageContext.request.contextPath}/resources/images/campingcar/handle.png" style="width: 60px; height: 60px;">
			<p class="name" style="line-height:80px; float:right; margin-left: 10px;">${sessionScope.member.userName}<span> 운전자님</span></p>
		</div>
	
		<div style="text-align: center; padding-top: 40px;">
			<a href="${pageContext.request.contextPath}/car/mypage/rider" style="color:black; font-size: 19px; font-weight: bold;">운전자 정보
			</a>
		</div>
		<div style="text-align: center; padding-top: 42px;">
			<a href="${pageContext.request.contextPath}/car/mypage/paymentList" style="color:#cccccc; font-size: 17px;">예약 내역
			</a>
		</div>
		<div style="text-align: center; padding-top: 42px;">
			<a href="${pageContext.request.contextPath}/car/mypage/question" style="color:#cccccc; font-size: 17px;">문의 내역
			</a>
		</div>
	</div>

<body>




<c:if test="${dto.licenseDate == null }">
	<div class="container">
		<div class="rider_info">
			<div class="licence">
					<p>등록된 운전자 정보가 없습니다.</p>
			<button id="registerButton" type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/car/mypage/addrider';">등록하기</button>
			</div>
		</div>
	</div>
</c:if>

<c:if test="${not empty dto and not empty dto.licenseDate}">
	<div class="container">
		<div class="rider_info">
			<div class="licence shadow p-3 mb-5 bg-body-tertiary rounded" style="display: flex; flex-wrap: wrap;">		
			<img class="img" src="${pageContext.request.contextPath}/resources/images/campingcar/driver.png">
					<div class="rider">
						<p>이름 : <span style="font-weight: 600;">${dto.userName}</span></p>
						<p>생년월일 : ${dto.birth}</p>
						<p>면허 발급 일자 : ${dto.licenseDate}</p>
						<c:if test="${not empty dto and not empty dto.licenseImage}">
							<p>면허증 사진 : 제출 <span style="font-weight: 600">완료</span></p>
						</c:if>
					</div>
				<div style="display: block;">
				<button id="registerButton" type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/car/mypage/update';">수정하기</button>
				</div>
			</div>
		</div>
	</div>
</c:if>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
<!-- <a href="https://www.flaticon.com/kr/free-icons/-" title="운전 면허증 아이콘">운전 면허증 아이콘  제작자: Flat Icons - Flaticon</a>
<a href="https://www.flaticon.com/kr/free-icons/-" title="스티어링 휠 아이콘">스티어링 휠 아이콘  제작자: PIXARTIST - Flaticon</a> -->