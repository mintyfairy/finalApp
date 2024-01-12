<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
* { padding: 0; margin: 0; }
*, ::after, ::before { box-sizing: border-box; }

body {
	font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
	font-size: 14px;
	color: #222;
}

a { color: #222; text-decoration: none; cursor: pointer; }
a:active, a:hover { color: #f28011; text-decoration: underline; }
.body-main {
	max-width: 930px;
}

.sales-container {margin: 10px auto; width: 1080px; height: 150px; display: flex;
	padding-left:10px;
	justify-content: space-between;
}
.sales-container .box {
	box-sizing: border-box;
	padding: 20px;
	width: 30%;
	height: 80%;
	border: 1px solid #ccc;
	margin: 10px;
	text-align: center;
}
.container { margin: 30px auto; width: 1080px; }
.box-container .box {
	box-sizing: border-box;
	padding: 20px;
	width: 100%;
	height: 500px;
	border: 1px solid #ccc;
	margin: 10px;
	text-align: center;
}

.body-main {
	width: 1080px;
}


.tabs > li {
	font-size: 16px;
}

h5 {
	margin-bottom: 25px;
}

span {
	font-size:17px;
}


</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">


<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.3/echarts.min.js"></script>
<script type="text/javascript">
$(function(){
   $("#tab-0").addClass("active");

   $("ul.tabs li").click(function() {
      let tab = $(this).attr("data-tab");
      
      $("ul.tabs li").each(function(){
         $(this).removeClass("active");
      });
      
      $("#tab-"+tab).addClass("active");
      
      let url = "${pageContext.request.contextPath}/admin/carReservation/list";   
      location.href = url;
   });
});
</script>

<script>
$(function(){
	let url = "${pageContext.request.contextPath}/admin/carReservation/bar";
	
	$.getJSON(url, function(data){
		// console.log(data);
		
		var chartDom = document.getElementById('barContainer');
		var myChart = echarts.init(chartDom);
		var option;

		option = {
		  title: {
		    text: data.year + "년 월별 매출"
		  },
		  tooltip: {
		    trigger: 'axis'
		  },
		  legend: {
		    data: data.legend
		  },
		  xAxis: {
		    type: 'category',
		    boundaryGap: false,
		    data: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		  },
		  yAxis: {
		    type: 'value'
		  },
		  series: data.series
		};

		option && myChart.setOption(option);
	});
	
	
});

</script>

<div class="body-container">
    <div class="body-title">
		<h2><i class="fa-solid fa-clipboard" style="font-size:23px;"></i>&nbsp;예약 및 매출관리 </h2>
    </div>
    
    <div class="body-main">
		<div>
			<ul class="tabs">
				<li id="tab-0" data-tab="0"><i class="fa-solid fa-chart-simple"></i>&nbsp;매출확인</li>
				<li id="tab-1" data-tab="1"><i class="fa-regular fa-note-sticky"></i>&nbsp;예약리스트</li>
			</ul>
			
			<div class="sales-container">
			  <div class="box">
			  	<h5>금일 예약건수</h5>
			  	<span>${today.COUNT}건</span>
			  </div>
			  <div class="box">
			  	<h5>이달의 매출</h5>
			  	<span>120 건</span>
			  </div>
			  <div class="box">
			  	<h5>최근 1년 매출 총액</h5>
			  	<span>6,307,000 원</span>
			  </div>
			</div>
			
			<div class="container">
				
				<div class="box-container" style="margin-top: 15px;">
				    <div id="barContainer" class="box"></div>
				</div>
			</div>
		</div>
	</div> <!-- body-main -->

</div> <!-- body-container -->
    
