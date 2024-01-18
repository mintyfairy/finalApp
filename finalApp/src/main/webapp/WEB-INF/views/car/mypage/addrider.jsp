<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

.container {
	width: 1000px;
	margin: 0 auto;
}

.riderSubmit {
	margin: 70px auto;
	width: 600px;
	border: 1px solid silver;
	padding: 30px;
}

.ridertable {
	margin: 0 auto;
	font-size: 20px;
	padding: 30px;
	text-align: left;
}

.ridertable tr {
	height: 50px;
}

.ridertable td {
	padding-left: 30px;
}

.tablebutton {
	margin: 0 auto;
}

input[type=date] {
	height: 30px;
	font-size: 18px;
}
	
</style>



<div class="container">
	<div class="riderSubmit">
		<form name="writeForm" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/car/mypage/addrider">
		<input type="hidden" name="memberIdx" value="${dto.memberIdx}">
		<table class="ridertable">
			<tr>
				<th>운전자</th>
				<td>
					${sessionScope.member.userName}
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					${orderUser.birth}
				</td>
			</tr>
			
			<tr>
				<th>면허증 발급일</th>
				<td>
					<input type="date" name="licenseDate" value="${dto.licenseDate}">
				</td>
			</tr>
			<tr>
				<th>면허증 사진</th>
				<td>
					<input type="file" id="image-input" name="licenseImageFile" accept="image/*" value="${dto.licenseImage}">
					<br>
					<img id="image-preview" alt="이미지 미리보기">
				</td>
			</tr>
		</table>
		
		<table class="tablebutton">
		<tr align="center">
			<td>
				<button type="submit" class="btn" onclick="check();">${mode=='update'?'수정완료':'등록하기'}</button>
				<button type="reset" class="btn">다시입력</button>
				<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/car/mypage/rider';">${mode=='update'?'수정취소':'등록취소'}</button>
				<c:if test="${mode=='update'}">
					<input type="hidden" name="licenseDate" value="${dto.licenseDate}">
					<input type="hidden" name="licenseImageFile" value="${dto.licenseImage}">
				</c:if>
			</td>
		</tr>
	</table>
		
		</form>
	</div>
</div>
<script>
        document.getElementById('image-input').addEventListener('change', function (event) {
            const input = event.target;
            const file = input.files[0];

            if (file) {
                // FileReader 객체를 사용하여 이미지 파일을 미리보기
                const reader = new FileReader();
                reader.onload = function (e) {
                    const preview = document.getElementById('image-preview');
                    preview.src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        });
    </script>


<script type="text/javascript">

function check() {
    const f = document.writeForm;
    
 	// 면허증 발급일 유효성 검사
    const licenseDate = f.licenseDate.value;
    if (! licenseDate) {
        alert("면허증 발급일을 입력하세요.");
        f.licenseDate.focus();
        return false;
    }
	
	// 면허증 사진 유효성 검사 (파일 업로드 필드)
    const licenseImage = f.licenseImage;
    if (! licenseImage.value) {
        alert("면허증 사진을 등록하세요.");
        licenseImage.focus();
        return false;
    }
	
    f.action = "${pageContext.request.contextPath}/car/mypage/rider";

    
    f.submit();
}


</script>