<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.wrapper {
	padding-top: 60px;
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
    		<h2>103 명</h2>
    		<p>총 회원수</p>
    	</div>
    	
    	<div class="main_box1">
    		<span><i class="fa-solid fa-dollar-sign"></i></span>
    		<h2>₩ 7,270,000</h2>
    		<p><label>캠핑장</label> 총 매출(1월)</p>
    	</div>
    	
    	<div class="main_box1">
    		<span><i class="fa-solid fa-dollar-sign"></i></span>
    		<h2>₩ 4,910,000</h2>
    		<p><label>캠핑카</label> 총 매출(1월)</p>
    	</div>
    	
    	<div class="main_box1">
    		<span><i class="fa-solid fa-dollar-sign"></i></span>
    		<h2>₩ 13,920,000</h2>
    		<p><label>쇼핑몰</label> 총 매출(1월)</p>
    	</div>
    </div>
    <div class="body-main">
   		<div class="visitor_chart">
   			<h4>캠핑장 : 지난 1년간 지역별 순위</h4>
   			<br>
			<img src="${pageContext.request.contextPath}/resources/images/adminchart.png" >
   		</div>
    	
   		<div class="visitor_chart">
   			<h4>캠핑카 : 최근 6개월 월별 판매 현황</h4>
   			<br>
   			<img src="${pageContext.request.contextPath}/resources/images/adminchart2.png" style="width:401px; height:379px;" >
   		</div>
    	
	</div>
</div>