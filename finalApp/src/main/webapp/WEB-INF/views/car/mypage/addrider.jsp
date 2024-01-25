<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
    .container {
        width: 1000px;
        margin: 0 auto;
    }
	.rider-info{
		margin-bottom: 100px;
	}
	
    .riderSubmit {
        margin: 70px auto;
        width: 600px;
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
    
    .btn {
	border: none;
	color: #FFF;
	background-color: #5DC8CD;
}

.btn:hover {
	color: #FFF;
	background-color: #01939A;
}
    
</style>

<script type="text/javascript">
    function check() {
        const f = document.writeForm;
        let mode = "${mode}";
        let licenseDate = new Date(f.licenseDate.value); // 면허증 발급일을 Date 객체로 변환
        let currentDate = new Date(); // 현재 날짜를 얻음

        // 밀리초 단위로 시간 차이 계산
        let timeDifference = currentDate - licenseDate;

        // 1년을 밀리초로 계산 (365일)
        let oneYearInMillis = 365 * 24 * 60 * 60 * 1000;

        
        if ((mode === 'addrider') && (!f.licenseDate.value)) {
            alert("면허증 발급일을 입력하세요.");
            f.licenseDate.focus();
            return;
        }
        
        if (mode === 'addrider' && timeDifference < oneYearInMillis) {
            alert("면허증 발급일은 현재 날짜로부터 1년 이상이어야 합니다.");
            f.licenseDate.focus();
            return;
        }

        if ((mode === 'addrider') && (!f.selectFile.value)) {
            alert("이미지 파일을 추가하세요.");
            f.selectFile.focus();
            return;
        }

        f.action = "${pageContext.request.contextPath}/car/mypage/${mode}";
        f.submit();
    }
    
</script>

<div class="container">
	<div class="rider-info">
    <div class="riderSubmit shadow p-3 mb-5 bg-body-tertiary rounded">
        <form name="writeForm" method="post" enctype="multipart/form-data">
            <table class="ridertable write-form">
                <tr>
				<th>운전자</th>
				<td>
					${orderUser.userName}
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
					<div class="img-viewer"></div>
					<input type="file" name="selectFile" accept="image/*" class="form-control" value="${dto.licenseImage}">
				</td>
			</tr>
			
            </table>
            <table class="tablebutton">
                <tr align="center">
                    <td>
                        <button type="button" class="btn" onclick="check();">${mode=='update'?'수정완료':'등록하기'}</button>
                        <button type="reset" class="btn">다시입력</button>
                        <button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/car/mypage/rider';">${mode=='update'?'수정취소':'등록취소'}</button>
                        <c:if test="${mode=='update'}">
                            <input type="hidden" name="licenseDate" value="${dto.licenseDate}">
                            <input type="hidden" name="selectFile" value="${dto.licenseImage}">
                        </c:if>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    </div>
</div>

<script type="text/javascript">
    $(function() {
        let img = "${dto.licenseImage}";

        if (img) {
            img = "${pageContext.request.contextPath}/uploads/car/mypage/" + img;
            $(".write-form .img-viewer").empty();
            $(".write-form .img-viewer").css("background-image", "url(" + img + ")");
        }

        $(".write-form .img-viewer").click(function() {
            $("form[name=writeForm] input[name=selectFile]").trigger("click");
        });

        $("form[name=writeForm] input[name=selectFile]").change(function() {
            let file = this.files[0];

            if (!file) {
                $(".write-form .img-viewer").empty();

                if (img) {
                    img = "${pageContext.request.contextPath}/uploads/car/mypage/" + img;
                } else {
                    img = "${pageContext.request.contextPath}/resources/images/campingcar/casper.jpg";
                }

                $(".write-form .img-viewer").css("background-image", "url(" + img + ")");
                return false;
            }

            if (!file.type.match("image.*")) {
                this.focus();
                return false;
            }

            let reader = new FileReader();
            reader.onload = function(e) {
                $(".write-form .img-viewer").empty();
                $(".write-form .img-viewer").css("background-image", "url(" + e.target.result + ")");
            };

            reader.readAsDataURL(file);
        });
    });
</script>
