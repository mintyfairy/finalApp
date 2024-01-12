<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
@charset "utf-8";


.container{
  width: 1080px; 
  height: 120px;
  margin: 0 auto;
  display: flex;
  justify-content: space-between;
}

.container .name1 {
  font-size: 30px;
  font-weight: bold;
}

.main div {
  margin: 0 20px;
  text-align:center;
}

.map {
  width: 1080px;
  height: 500px;
}

.come h3 {
  margin-left: 180px;
  margin-bottom: 80px;
}

.come ul {
  display: flex;
  
}

.come ul > li {
  list-style: none;
  padding-left: 20px;
  margin-right: 20px;
  margin-bottom: 30px;
}

</style>

 <div class="container">
	<div>
		<p class="name1" style="line-height:80px; float:left;"><i class="fa-solid fa-location-dot" style="margin-right: 10px;"></i> 오시는길 </p>
	</div>
 </div>	

 <!-- * 카카오맵 - 지도퍼가기 -->
 <!-- 1. 지도 노드 -->
 <div class="map">
   <div class="come">
     <h3>(주)캠:브릿지(캠핑카) <b>언제나 여러분을 환영합니다.</b></h3>
     <ul>
       <li><i class="fa-solid fa-building"></i>&nbsp;&nbsp;서울특별시 월드컵북로 21 풍성빌딩 2층</li>
       <li><i class="fa-solid fa-phone"></i>&nbsp;&nbsp;02 - 333 - 3333</li>
       <li><i class="fa-solid fa-fax"></i>&nbsp;&nbsp;02 - 333 - 5555</li>
     </ul>
   </div>


 <div id="daumRoughmapContainer1703137349663" class="root_daum_roughmap root_daum_roughmap_landing "></div>
 </div>
 
 <script charset="UTF-8">
   new daum.roughmap.Lander({
     "timestamp" : "1703137349663",
     "key" : "2haio",
     "mapWidth" : "800",
     "mapHeight" : "500"
   }).render();
 </script>



