<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
	
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

.footer_container {
    height: 240px;
    background-color: #f4f4f4;
    padding: 60px 90px 0 90px;
}

.footer_container .footer_wrap {
    height: calc(100% - 60px);
    display: flex;
    justify-content: space-between;
}

.footer_container .footer_wrap .footer_left {
    width: 50%;
}

.footer_container .footer_wrap .footer_left p {
    font-size: 14px;
    padding-bottom: 8px;
}

.footer_container .footer_wrap .footer_right {
    display: flex;
    justify-content: space-between;
    width: 50%;
}

.footer_container .footer_wrap .footer_right .footer_right_left {
    width: 50%;
}

.footer_container .footer_wrap .footer_right .footer_right_left p {
    font-size: 20px;
    font-weight: 600;
    margin-bottom: 12px;
}

.footer_container .footer_wrap .footer_right .footer_right_right {
    width: 50%;
}

.footer_container .footer_wrap .footer_right .footer_right_right i {
    margin-left: 4px;
    margin-right: 4px;
}
</style>
</head>
    <div class="footer_container">
        <div class="footer_wrap">
            <div class="footer_left">
                <p>상호 : (주)캠브릿지몰&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;대표자명 : 앤디킴</p>
                <p>사업자등록번호 : 000-00-00000&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;통신판매업신고번호 : 제0000-서울마포-0000호</p>
                <p>연락처 : 00-000-0000&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;팩스 : 000-0000-0000&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;이메일 : camb@camb.com</p>
                <p>주소 : 서울특별시 마포구 월드컵북로 21 풍성빌딩 2층</p>
            </div>
            <div class="footer_right">
                <div class="footer_right_left">
                    <p>이용약관</p>
                    <p>개인정보처리방침</p>
                </div>

                <div class="footer_right_right">
                    <i class="fa-brands fa-facebook fa-xl"></i>
                    <i class="fa-brands fa-instagram fa-xl"></i>
                    <i class="fa-brands fa-x-twitter fa-xl"></i>
                    <i class="fa-brands fa-line fa-xl"></i>
                </div>
            </div>
        </div>
    </div>
</body>
</html>