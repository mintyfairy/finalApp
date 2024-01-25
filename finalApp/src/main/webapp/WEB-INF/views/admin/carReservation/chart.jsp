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

.body-container {
	margin-top: 60px;
	padding-left: 250px;
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
	margin: 10px;
	text-align: center;
	background-color: #FFA500;
	color: white;
	font-weight: bold;
}

.sales-container .box1 {
	box-sizing: border-box;
	padding: 20px;
	width: 30%;
	height: 80%;
	margin: 10px;
	text-align: center;
	background-color: #0078FF;
	color: white;
	font-weight: bold;
}

.container { margin: 30px auto; width: 1080px; }
.box-container .box {
	
	box-sizing: border-box;
	padding: 20px;
	width: 100%;
	height: 500px;
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
		chartsMonth(data);	
	});

	function chartsMonth(data) {
		let chartData = [];
		
		for(let item of data.months) {
			let s = parseInt(item.END_DATE.substring(4))+'월';
			let obj = {value:item.TOTALMONEY, name:s};
			chartData.push(obj);
		}
		
		const chartDom = document.querySelector(".charts-month");
		let myChart = echarts.init(chartDom);
		let option;
		
		option = {
				title:{
					text:"최근 6개월 월별 판매 현황"
				},
		  tooltip: {
		    trigger: 'item'
		  },
		  legend: {
		    top: '5%',
		    left: 'center'
		  },
		  series: [
		    {
		      name: '월별 판매현황',
		      type: 'pie',
		      radius: ['40%', '70%'],
		      avoidLabelOverlap: false,
		      itemStyle: {
		        borderRadius: 10,
		        borderColor: '#fff',
		        borderWidth: 2
		      },
		      label: {
		        show: false,
		        position: 'center'
		      },
		      emphasis: {
		        label: {
		          show: true,
		          fontSize: '40',
		          fontWeight: 'bold'
		        }
		      },
		      labelLine: {
		        show: false
		      },
		      data: chartData
		    }
		  ]
		};
		
		option && myChart.setOption(option);
	}

});


</script>

<div class="body-container">
    <div class="body-title">
		<h3><i class="fa-solid fa-clipboard" style="font-size:23px;"></i>&nbsp;예약 및 매출관리 </h3>
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
			  	<span><fmt:formatNumber value="${today.COUNT}"/>건</span>
			  </div>
			  <div class="box1">
			  	<h5>이번달 매출액</h5>
			  	<span><fmt:formatNumber value="${thisMonthsales.TOTAL}"/>&nbsp;원</span>
			  </div>
			  <div class="box1">
			  	<h5>올해의 매출액</h5>
			  	<span><fmt:formatNumber value="${thisyearsales.TOTAL}"/>&nbsp;원</span>
			  </div>
			</div>
			
			<div class="container">
				
				<div class="box-container" style="margin-top: 15px;">
				    <div class="charts-month border rounded" style="height: 500px; padding: 20px;"></div>
				</div>
			</div>
		</div>
	</div> <!-- body-main -->

</div> <!-- body-container -->
    
