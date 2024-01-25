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

.login_container {
	position: relative;
	padding-bottom: 110px;
	background: url("${pageContext.request.contextPath}/resources/images/login_background.jpg") no-repeat;
	background-size: cover;
}

.login_container:before {
    position: absolute;
    content: "";
    top:0px;
    left:0px;
    width: 100%;
    height: 100%;
    background-color: rgba(255,255,255,0.3);
}

.login_wrap {
	max-width: 1080px;
	margin: 0 auto;
	padding-top: 100px;
}

.login_wrap h5 {
	padding-bottom: 10px;
    font-size: 24px;
    line-height: 18px;
    font-weight: bold;
    color: #d9d9d9;
}

.login_list {
	position: relative;
	z-index: 50;
	display: flex;
    height: 458px;
    border: 1px solid #e9e9e9;
    border-top: none;
}

.login_list .login_area {
	flex-basis: 50%;
	padding-top: 50px;
}

.area_wrap {
	text-align: center;
}

.login_area form input {
	width: 375px;
	height: 50px;
    color: #adadad;
    line-height: 50px;
    cursor: text;
    margin-bottom: 14px;
    padding-left: 11px;
}

.login_area form input:nth-child(2) {
	margin-bottom: 32px;
}

.login_list .login_area h3 {
	padding-top: 35px;
    font-size: 18px;
    font-weight: bold;
    color: #d9d9d9;
    line-height: 18px;
    margin-bottom: 32px;
}

.login_btn .loginSend{
	width: 375px;
	height: 50px;
	color: #fff;
	background-color: #000;
}

.login_btn .loginSend:hover {
	color: #000;
	background-color: #fff;
}

.login_list .member_area {
	flex-basis: 50%;
	margin-top: 44px;
}

.login_list .member_area h3 {
	padding-top: 35px;
    font-size: 18px;
    font-weight: bold;
    color: #d9d9d9;
    line-height: 18px;
    margin-bottom: 20px;
}

.login_list .member_area .joinBtn {
    width: 384px;
    height: 58px;
    font-size: 15px;
    line-height: 58px;
    background-color: #fff;
    margin-bottom: 32px;
}

.login_list .member_area .joinBtn:hover {
	color: #fff;
	background-color: #000;
}

.login_list .member_area p {
    font-size: 11px;
    color: #d9d9d9;
}


/*
.login-container {
  width: 350px;
  height: 400px;
  margin: 150px auto;
  
  background-color: var(--white);
  border-radius: var(--button-radius);
  box-shadow: 0 0.9rem 1.7rem rgba(0, 0, 0, 0.25),
    0 0.7rem 0.7rem rgba(0, 0, 0, 0.22);
  overflow: hidden;
  position: relative;
}

.login-container p {
  font-size: 20px;
  font-weight: 600;
  margin-top: 30px;
  text-align: center;
}

.loginForm {
  text-align: center;
  margin-top: 50px;
  width: 100%;

}

input[type=text] {
  width: 90%;
  margin: 5px auto;
}

input[type=password] {
  width: 90%;
  margin: 5px auto;
}

.checkbox {
  margin-left: 18px;
  margin-bottom: 20px;
  float: left;
}

button[type=submit]{
  width: 90%;
}

.find {
  margin-left: 18px;
  width: 90%;
  margin-top: 30px;
  display: flex;
  justify-content: space-between;
}
*/

</style>

<script type="text/javascript">
$(function(){
	$(document).ready(function() {
	    $(document).keyup(function(event) {
	        if (event.which === 13) {
	            $(".loginSend").click();
	        }
	    });
	});
});

$(function(){
	$('.loginSend').click(function() {
		const f = document.loginForm;
		
		if(! f.userId.value) {
			alert("아이디를 입력하세요.");
			f.userId.focus();
			return false;
		}

		if(! f.userPwd.value) {
			alert("패스워드를 입력하세요.");
			f.userPwd.focus();
			return false;
		}
		
		f.action = "${pageContext.request.contextPath}/member/login";
		f.submit();
	});
});
</script>

<div class="login_container">
	<div class="login_wrap">
		<h5>LOG-IN</h5>
		<div class="login_body">
			<ul class="login_list">
				<li class="login_area">
					<div class="area_wrap">
						<h3>회원 로그인</h3>
						<form method="post" name="loginForm">
							<input type="text" name="userId" placeholder="아이디">
							<input type="password" name="userPwd" placeholder="비밀번호">
							<div class="login_btn">
								<button type="submit" class="loginSend">LOG-IN</button>
							</div>
						</form>
					</div>
				</li>
				<li class="member_area">
					<div class="area_wrap">
						<h3>회원가입</h3>
						<p>회원이 되어 다양한 혜택을 누리세요</p>
						<button type="button" class="joinBtn" onclick="location.href='${pageContext.request.contextPath}/member/join'">JOIN-US</button>
						<p>아이디 비밀번호를 잊으셨나요?</p>
						<button type="button" class="joinBtn">ID/PASSWORD</button>
					</div>
				</li>
			</ul>
		</div>
	</div>
</div>


