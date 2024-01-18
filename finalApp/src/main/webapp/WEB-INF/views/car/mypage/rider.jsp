<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">

.container {
	width: 1080px;
	margin: 0 auto;
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
	width: 400px;
	height: 250px;
	border: 3px solid skyblue;
	margin: 20px auto;
}

.img {
	width: 100px;
	height: 70px;
}


.main{
		width: 950px; /* 너비를 70%로 설정합니다. */
		height: 120px;
        margin: 0 auto; /* 왼쪽과 오른쪽에 10px의 공백을 추가합니다. */
   		margin-top: 50px;
        border: 1px solid #e2e2e2;
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

</head> 
<body>

	<div class="main">
		<div>
			<p class="name" style="line-height:80px; float:right;">${sessionScope.member.userName}<span>님</span></p>
		</div>
	
		<div style="text-align: center;">
			<a href="${pageContext.request.contextPath}/car/mypage/rider" style="color:#cccccc;">운전자 정보
			</a>
		</div>
		<div>
			<a href="#" style="color:#cccccc;">예약 내역
			</a>
		</div>
		<div>
			<a href="#" style="color:#cccccc;">문의 내역
			</a>
		</div>
		<div>
			<a href="#" style="color:#cccccc;">리뷰 내역
			</a>
		</div>
	</div>

<body>
<input type="hidden" name="birth" value="${orderUser.birth}">


<button id="registerButton" type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/car/mypage/addrider';">${dto.licenseDate != null?'수정하기':'등록하기'}</button>





<div class="container">
	<div class="rider_info">
		<div class="licence">
			<c:if test="${dto.licenseDate == null }">
				<div class="container">
					<p>등록된 정보가 없습니다. ${orderUser.birth}</p>
				</div>
			</c:if>
			<c:if test="${dto.licenseDate != null }">
				<div class="container">
					<div class="rider">
						<p>이름 : ${sessionScope.member.userName}</p>
						<p>생년월일 : ${orderUser.birth}</p>
						<p>면허 발급 일자 : ${dto.licenseDate}</p>
						<p>면허증 이미지 : ${dto.licenseImage}</p>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</div>





</body>
</html>
