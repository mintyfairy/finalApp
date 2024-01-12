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


</style>

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

