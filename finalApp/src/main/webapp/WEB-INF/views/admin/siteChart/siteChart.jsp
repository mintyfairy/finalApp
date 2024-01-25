<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-main {
	max-width: 930px;
}
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.3/echarts.min.js"></script>

<script type="text/javascript">
$(function(){
	let url = "${pageContext.request.contextPath}/admin/siteChart/charts";
	
	$.getJSON(url, function(data){
		console.log(data);
		siteRankYear(data);	
		monthsRankYear(data);
		daysRankYear(data);	
	});
	
	function siteRankYear(data) {

		var chartDom = document.querySelector(".charts-day");
		
		var myChart = echarts.init(chartDom);
		var option;
		
		let chartData=[];
		for(let item of data.siteRankYear){
			let obj={name:item.SITELOCAL,value:item.SUM}
			chartData.push(obj);
		}
		
		option = {
				title:{
					text:"지역명"
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
		      name: '지역명',
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
		          fontSize: 40,
		          fontWeight: 'bold'
		        }
		      },
		      labelLine: {
		        show: false
		      },
		      data:
		    	  chartData
		    }
		  ]
		};

		option && myChart.setOption(option);
	}
	
	function monthsRankYear(data) {

		var chartDom = document.querySelector(".charts-dayOfWeek");
		var myChart = echarts.init(chartDom);
		var option;
		let titles=[];
		let values=[];
		
		for(let item of data.daysRankYear){
			if (item.ORDER_DAYS==null) continue;
			titles.push(item.ORDER_DAYS)
			values.push(item.SUM/100000)
		}

		option = {
				title: {
				    text: '요일별 판매액(만)'
				  },
		  xAxis: {
		    type: 'category',
		    data: titles
		  },
		  yAxis: {
		    type: 'value'
		  },
		  series: [
		    {
		      data: values,
		      type: 'bar'
		    }
		  ]
		};

		option && myChart.setOption(option);

	}
	
	function daysRankYear(data) {
var chartDom = document.querySelector(".charts-month");
		
		var myChart = echarts.init(chartDom);
		var option;
		
		let chartData=[];
		for(let item of data.monthsRankYear){
			if (item.ORDER_MONTHS==null) continue;
			let s=parseInt(item.ORDER_MONTHS)+"월";
			let obj={name:s,value:item.SUM}
			chartData.push(obj);
		}
		
		option = {
				title:{
					text:"월별 판매액"
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
		      name: '판매일자',
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
		          fontSize: 40,
		          fontWeight: 'bold'
		        }
		      },
		      labelLine: {
		        show: false
		      },
		      data:
		    	  chartData
		    }
		  ]
		};

		option && myChart.setOption(option);
	}
	
});
</script>

<div class="container body-container">
    <div class="inner-page">
    
    	<div class="row g-1 mt-4 p-1">
			<div class="col p-2">
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 전년도 판매 현황</div>
				<div class="border rounded p-5 text-center">
					<div class="fs-5 mb-2">총 예약 건수 : 
						<span class="product-totalAmount fw-semibold text-primary">${previousYear.CNT}</span>건
					</div>
					<div class="fs-5">총 매출액 : 
						<span class="product-totalAmount fw-semibold text-danger"><fmt:formatNumber value="${previousYear.TOT}"/></span>원
					</div>
				</div>
			</div>
			
			<div class="col p-2">
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 전월 판매 현황</div>
				<div class="border rounded p-5 text-center">
					<div class="fs-5 mb-2">총 예약 건수 : 
						<span class="product-totalAmount fw-semibold text-primary">${previousMonth.CNT}</span>건
					</div>
					<div class="fs-5">총 매출액 : 
						<span class="product-totalAmount fw-semibold text-danger"><fmt:formatNumber value="${previousMonth.TOT}"/></span>원
					</div>
				</div>
			</div>
    	
			<div class="col p-2">
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 광고효과 비교</div>
				<div class="border rounded p-5 text-center">
					<div class="fs-5 mb-2">광고 이전 기간 매출액 : 
						<span class="product-totalAmount fw-semibold text-primary"><fmt:formatNumber value="${adEfect.NONADSUM}"/></span>원
					</div>
					<div class="fs-5">광고 기간 매출액 : 
						<span class="product-totalAmount fw-semibold text-danger"><fmt:formatNumber value="${adEfect.ADSUM}"/></span>원
					</div>
				</div>
			</div>
    	</div>
    
		<div class="row g-1 mt-4 p-1">
			<div class="col p-2">
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 지난 1년간 지역별 순위</div>
				<div class="charts-day border rounded" style="height: 500px;" ></div>
			</div>
			<div class="col p-2">
				<div class="fs-6 fw-semibold mb-2 "><i class="bi bi-chevron-right"></i> <label class="charts-dayOfWeek-title">지난 1년간 월별 매출</label></div>
				<div class="charts-dayOfWeek border rounded" style="height: 500px;"></div>
			</div>
			<div class="col p-2">
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 지난 1년간 요일별 매출</div>
				<div class="charts-month border rounded" style="height: 500px;"></div>
			</div>
		</div>		


    </div>
</div>