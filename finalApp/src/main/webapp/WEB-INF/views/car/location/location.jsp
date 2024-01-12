<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
@charset "utf-8";

.location-box {
	margin-top: 50px;
	
}

.location-container{
  width: 1080px; 
  margin: 0 auto;
  display: flex;
  justify-content: space-between;
}

.location-container p {
  font-size: 30px;
  font-weight: bold;
  width: 100%;
  
}

.name1 {
	margin-bottom: 50px;
}

.address1 {
	border: 2px solid lightgrey;
	width: 1080px; 
	display: flex;
	justify-content: space-between;
	text-align: center;
	border-radius: 10px;
}

.address1 li {
	margin: 30px 50px;
}

.map {
  width: 1080px; 
  height: 465px;
  margin: 0 auto;
  border: 2px solid lightgrey;
  margin-top: 100px;
  border-radius: 10px;
  margin-bottom: 150px;
}

.iframe {
  width: 100%;
}

</style>

<div class="location-box">
  <div class="location-container">
 	<div class="location-content">
		<p class="name1" style="float:left;"><i class="fa-solid fa-location-dot"></i> 오시는길 </p>
		<p style="text-align:center; margin-bottom:50px; font-size: 25px;"> (주) 캠브릿지는  여러분을 환영합니다.</p>
		<ul class="address1">
	       <li><i class="fa-solid fa-building"></i>&nbsp;&nbsp;서울특별시 월드컵북로 21 풍성빌딩 2층</li>
	       <li><i class="fa-solid fa-phone"></i>&nbsp;&nbsp;02 - 333 - 3333</li>
	       <li><i class="fa-solid fa-fax"></i>&nbsp;&nbsp;02 - 333 - 5555</li>
	     </ul>
	</div>
	
   
	
 </div>
 
    <div class="map">
    	<!--
	* 카카오맵 - 약도서비스
	* 한 페이지 내에 약도를 2개 이상 넣을 경우에는
	* 약도의 수 만큼 소스를 새로 생성, 삽입해야 합니다.
-->
<!-- 1. 약도 노드 -->
<div id="daumRoughmapContainer1705051680129" class="root_daum_roughmap root_daum_roughmap_landing"></div>

<!-- 2. 설치 스크립트 -->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1705051680129",
		"key" : "2hnp3",
		"mapWidth" : "1078",
		"mapHeight" : "463"
	}).render();
</script>
 	</div>
</div>





