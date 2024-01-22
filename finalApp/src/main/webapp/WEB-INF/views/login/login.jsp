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

.login_wrap {
	max-width: 1080px;
	margin: 0 auto;
	padding-top: 100px;
}

.login_wrap h5 {
	padding-bottom: 10px;
    font-size: 18px;
    line-height: 18px;
    font-weight: bold;
    border-bottom: 1px solid #000;
}

.login_list {
	display: flex;
    height: 458px;
    border: 1px solid #e9e9e9;
    border-top: none;
}

.login_list .login_area {
	flex-basis: 50%;
	padding-top: 50px;
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
    padding-left: 76px;
}

.login_list .member_area h3 {
	padding-top: 35px;
    font-size: 18px;
    font-weight: bold;
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
    color: #adadad;
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

<div class="login_container">
	<div class="login_wrap">
		<h5>로그인</h5>
		<div class="login_body">
			<ul class="login_list">
				<li class="login_area">
					<h3>회원 로그인</h3>
					<form method="post" action="${pageContext.request.contextPath}/member/login">
						<input type="text" name="userId" placeholder="아이디">
						<input type="password" name="userPwd" placeholder="비밀번호">
						<div class="login_btn">
							<button type="submit" class="loginSend">LOG-IN</button>
						</div>
					</form>
				</li>
				<li class="member_area">
					<h3>회원가입</h3>
					<p>회원이 되어 다양한 혜택을 누리세요</p>
					<button type="button" class="joinBtn" onclick="location.href='${pageContext.request.contextPath}/member/join'">JOIN-US</button>
					<p>아이디 비밀번호를 잊으셨나요?</p>
					<button type="button" class="joinBtn">ID/PASSWORD</button>
				</li>
			</ul>
		</div>
	</div>
</div>

<!-- 
  <div class="login-container">
    <p>로그인</p>

    <form class="loginForm" method="Post" action="${pageContext.request.contextPath}/member/login">
      <input type="text" name="userId" placeholder="아이디" class="form-control"> 
      <input type="password" name="userPwd" placeholder="비밀번호" class="form-control"> 
      <br>
      <div class="checkbox"><input type="checkbox" name="checkbox" > 로그인 상태유지 </div>
      <button type="submit" class="btn btn-primary">로그인</button>
      <div class="find"><a href="${pageContext.request.contextPath}/member/join">회원가입</a> <a href="#">아이디,패스워드 찾기</a></div>
    </form>

   </div>
    -->

