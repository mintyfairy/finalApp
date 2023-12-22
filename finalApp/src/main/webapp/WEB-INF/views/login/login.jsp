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

.background {
  width: 100%
  background-image: url('images/loginbackground.jpg');
}

.login {
  width: 600px;
  height: 300px;
  background-color: lightblue;
  display: flex;
  border-radius: 10px;
  margin: 200px auto;
  
}

.joinmember {
  width: 50%;
  height: 100%;
  no-repeat center;
  background-image: url("images/loginMountain.jpg");
  background-size: cover;
  text-align: center;
  
}

.loginForm {
  width: 50%;
  height: 100%;
}

input[type=text] {
  border: none;
  padding: 15px;
  margin-bottom: 5px;
}

button[type=submit] {
  padding: 10px 60px;
  border-radius: 10px;
  margin-top: 15px;
}

button[name=join] {
  padding: 10px 60px;
  border-radius: 10px;
  margin-top: 130px;  
}

.loginForm {
  text-align: center;
  padding-top: 70px;
}

</style>

<div class="background">
 <div class="login">
   <div class="joinmember">
     <button type="button" class="btn btn-primary" name="join">Join</button>

   </div>

   <form class="loginForm" method="Post" action="${pageContext.request.contextPath}/member/login">
     <input type="text" name="userId" placeholder="Id" class="form-control"> 
     <input type="password" name="userPwd" placeholder="password" class="form-control"> 
     <br>
     <button type="submit" class="btn btn-primary">Login</button>
   </form>
 </div>
</div>