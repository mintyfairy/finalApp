<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.wrapper {
	padding: 0;
}

.body-container {
	width: 1080px;
	margin: 60px 0 0 250px;
}
</style>

<div class="body-container">
  <h3 style="margin-bottom: 10px;"> DASH BOARD </h3>
    <div class="body-main">
    	<div class="main_box">
    		<span><i class="fa-solid fa-user"></i></span>
    		<h2>10 명</h2>
    		<p>총 회원수</p>
    	</div>
    	
    	<div class="main_box1">
    		<span><i class="fa-solid fa-dollar-sign"></i></span>
    		<h2>₩ 200,000</h2>
    		<p><label>캠핑장</label> 총 매출(12월)</p>
    	</div>
    	
    	<div class="main_box1">
    		<span><i class="fa-solid fa-dollar-sign"></i></span>
    		<h2>₩ 200,000</h2>
    		<p><label>캠핑카</label> 총 매출(12월)</p>
    	</div>
    	
    	<div class="main_box1">
    		<span><i class="fa-solid fa-dollar-sign"></i></span>
    		<h2>₩ 200,000</h2>
    		<p><label>쇼핑몰</label> 총 매출(12월)</p>
    	</div>
    </div>
    <div class="body-main">
    	<form>
    		<table class="visitor_chart">
    			<tr>
    				<th>최근 방문자 수</th>
    			</tr>
    			<tr>
    				<td>chart 공간</td>
    			</tr>
    		</table>
    	</form>
    	
    	<form>
    		<table class="visitor_chart">
    			<tr>
    				<th>최근 가입자 수</th>
    			</tr>
    			<tr>
    				<td>chart 공간</td>
    			</tr>
    		</table>
    	</form>
    	
	</div>
</div>