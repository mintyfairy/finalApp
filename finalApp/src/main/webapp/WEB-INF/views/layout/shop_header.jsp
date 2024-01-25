<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<style>
@charset "utf-8";

* {
    margin: 0;
    padding: 0;
    text-decoration: none;
    color: #333;
    box-sizing: border-box;
}

ol,
ul {
    list-style: none;
}

.header_top {
	background-color: #fff;
    padding: 0 40px;
    border-bottom: 1px solid #efefef;
}

.header_top_wrap {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 1080px;
    height: 110px;
    margin: 0 auto;
}

.header_center {
	padding-top: 16px;
}

.header_center .header_center_wrap .header_center_list {
    display: flex;
    padding-left: 0;
}

.header_center .header_center_wrap .header_center_list .header_center_item {
    text-align: center;
}

.header_center .header_center_wrap .header_center_list .header_center_item:first-child {
    position: relative;
}

.header_center .header_center_wrap .header_center_list .header_center_item a {
    display: block;
    font-size: 18px;
    padding: 20px;
}

.header_center .header_center_wrap .header_center_list .header_center_item a:hover {
    text-decoration: underline;
    color: orangered;
}

.logo {
    margin-right: 48px;
    padding-top: 6px;
}

.logo a {
	display: block;
}

.header_right_wrap {
    padding-top: 20px;
}

.header_right_wrap .header_right {
    width: 160px;
    height: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.header_right_wrap .header_right .header_item a {
    display: inline-block;
}

.navi_container .border_wrap {
	background-color: #fff;
    border-top: 1px solid #cecece;
    border-bottom: 1px solid #cecece;
}

.navi_container .navi_wrap {
    width: 1080px;
    height: 60px;
    margin: 0 auto;
}

.navi_container .navi_wrap .navi_list {
    display: flex;
    height: 100%;
}

.navi_list .navi_item {
    width: calc((100% - 60px)/7);
    height: 100%;
}

.navi_list .navi_item a {
    display: block;
    height: 100%;
    text-align: center;
    line-height: 60px;
}

.hamburger {
    width: 60px;
    height: 60px;
    border-left: 1px solid #cecece;
    border-right: 1px solid #cecece;
}

.hamburger a {
    display: block;
    height: 100%;
}

.cate_container_wrap {
	position: relative;
}

.cate_container {
	position: absolute;
	top: 0;
	left: calc(50% - 508px);
	z-index: 999;
    width: 1080px;
    height: 0;
    margin: 0 auto;
    padding: 45px 50px;
    background-color: #fff;
    border: 1px solid #dedede;
    border-top: none;
}

.cate_container1 {
	position: absolute;
	top: 0;
	left: calc(50% - 508px);
	z-index: 999;
    width: 1080px;
    height: 0;
    margin: 0 auto;
    padding: 45px 50px;
    background-color: #fff;
    border: 1px solid #dedede;
    border-top: none;
}

.cate_wrap {
	width: 1080px;
	margin: 0 auto;
}

.cate_wrap h2 {
    margin-bottom: 30px;
}

.cate_list {
    display: flex;
    flex-wrap: wrap;
}

.cate_list .cate_item {
    width: 200px;
    margin-right: 45px;
    margin-bottom: 30px;
    border: none;
}

.cate_list li:nth-child(4),
.cate_list li:nth-child(8) {
    margin: 0;
}

.cate_list .cate_item h3 {
    margin-bottom: 16px;
    padding: 18px 0;
    border-bottom: 1px solid #bdbdbd;
}

.cate_list .cate_item p {
    margin-bottom: 9px;
    font-size: 14px;
    color: #7e7e7e;
    cursor: pointer;
}

.category-list ul { padding: 0; }
.category-list li { list-style: none; }

.brand_search_list {
	display: flex;
	flex-wrap: wrap;
}

.brand_search_list .cate_item {
	width: 46px;
	height: 34px;
	text-align: center;
	background-color: #dedede;
	margin-right: 20px;
	cursor: pointer;
	border-radius: 17px;
}

.brand_search_list .cate_item span {
	display: inline-block;
	height: 100%;
	line-height: 34px;
}

.brand_search_list .cate_item p {
    margin-bottom: 9px;
    font-size: 14px;
    color: #7e7e7e;
    cursor: pointer;
}

.menu-item {
	border-radius: 3px;
    background-color: #ffffff;
    border: 1px solid #dddddd;
    margin-bottom: -1px;  	
}
.menu-link {
	display: block;
	color: #666;
	font-weight: 500px;
	cursor: pointer;
	padding: 10px 15px;
}
.menu-link:hover {
	color: #000;
	background: #e9e9e9;
}
.menu-item .opened {
    color: #ffffff;
    font-weight: 500;
    background-color: #aaaaaa;    
    border-color: #337ab7;
	border-bottom: 1px solid #dddddd;
	border-color: #d5d5d5;
	border-radius: 3px;
}

.sub-menu {
	display: none;
}

.sub-menu .active {
	color: #000;
}

.sub-menu-item {
	cursor: pointer;
	padding: 10px 20px;
	background: #f8f9fa;
}
.sub-menu-link {
	font-weight: 500;
	color: #666;
}
.sub-menu-item:hover, .sub-menu-link:hover {
	color: #000;
	text-decoration: none;
}

.brand-list {
	display: flex;
}

.brand-item {
    margin-left: 29px;
    padding: 5px 11px;
    font-size: 18px;
	cursor: pointer;
    border: 1px solid #ccc;
	border-radius: 20px;
}

.brand-item:hover {
	background-color: #ccc;
	color: #fff;
}
</style>

<script type="text/javascript">
$(function(){
	$("ul.condition>li>a").click(function(){
		$("ul.condition>li>a").removeClass("text-danger");
		$(this).addClass("text-danger");
		
		$(this).closest("form").find("input[name=searchType]").val($(this).attr("data-condition"));
		$(this).closest("div").find("button").text($(this).text());
	});
});

// 브랜드 이름 클릭 이벤트
$(function() {
	$('.brand_list .cate_item').click(function() {
		$(this).siblings('.cate_item').css("background-color", "#dedede");
		$(this).siblings('.cate_item').$('span').css("color", "#333");
	});
});
</script>

<div class="header_top">
    <div class="header_top_wrap">
        <div class="header_center">
            <div class="header_center_wrap">
                <ul class="header_center_list">
                	<li class="header_center_item">
						<a href="${pageContext.request.contextPath}/">메인</a>
					</li>
                    <li class="header_center_item">
                        <a href="${pageContext.request.contextPath}/site/list" style="padding-left:0;">캠핑예약</a>
                    </li>
                    <li class="header_center_item">
                        <a href="${pageContext.request.contextPath}/car/main">캠핑카</a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="logo">
            <a href="${pageContext.request.contextPath}/shop/main">
                <img src="${pageContext.request.contextPath}/resources/images/main/logo.png" alt="logo" width="228">
            </a>
        </div>

        <div class="header_right_wrap">
            <ul class="header_right">
            	<c:choose>
            		<c:when test="${empty sessionScope.member}">
                		<li class="header_item"><a href="${pageContext.request.contextPath}/member/login"><i class="fa-solid fa-arrow-right-to-bracket fa-lg"></i></a></li>
                	</c:when>
                	 <c:otherwise>
				        	<li class="header_item"><a href="${pageContext.request.contextPath}/member/logout" title="로그아웃"><i class="fa-solid fa-arrow-right-from-bracket fa-lg" style="font-size:17px;"></i></a></li>
					 </c:otherwise>
                </c:choose>
                
                <li class="header_item fa-lg"><a href="${pageContext.request.contextPath}/shop/myPage/cart"><i class="fa-solid fa-cart-shopping"></i></a></li>
                <li class="header_item fa-lg"><a href="${pageContext.request.contextPath}/csCenter/notice/list"><i class="fa-solid fa-headset"></i></a></li>
                <c:if test='${sessionScope.member.authority=="CAMP"||sessionScope.member.authority=="ADMIN"}'>
				   <li class="header_item fa-lg"><a href="${pageContext.request.contextPath}/admin/shopProduct/main"><i class="fa-solid fa-user-gear"></i></a></li>
				</c:if>
            </ul>
        </div>
    </div>
</div>

<nav class="navi_container">
	<div class="border_wrap">
	    <div class="navi_wrap">
	        <ul class="navi_list">
	            <li class="hamburger">
	                <a href="#" id="hamburgerIcon">
	                    <img src="https://via.placeholder.com/60x60" alt="hamburger">
	                </a>
	            </li>
	            
	            <li class="navi_item">
	                <a class="nav-link brand" data-bs-toggle="offcanvas" href="#offcanvasCategory" aria-controls="offcanvasCategory">브랜드</a>
	            </li>
	            
	            <li class="navi_item dropdown">
	                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	                	인기상품
	                </a>
	                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                       <li><a class="dropdown-item" href="${pageContext.request.contextPath}/shop/product/list?categoryNum=126">텐트&nbsp;&middot;&nbsp;타프</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/shop/product/list?categoryNum=127">침낭/매트</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/shop/product/list?categoryNum=145">테이블</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/shop/product/list?categoryNum=150">스토브</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/shop/product/list?categoryNum=161">쿠커</a></li>
                    </ul>
	            </li>
	            <li class="navi_item">
	                <a href="#">특가상품</a>
	            </li>
	            <li class="navi_item">
	                <a href="#">MD 추천</a>
	            </li>
	            <li class="navi_item">
	                <a href="#">캠핑 스타터</a>
	            </li>
	            <li class="navi_item">
	                <a href="#">AS 라운지</a>
	            </li>
	            
	           <li class="navi_item dropdown">
	                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	                	고객센터
	                </a>
	                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                       <li><a class="dropdown-item" href="#">공지&이벤트</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/shop/myPage/review">문의Q&A</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/shop/product/detail">상품 문의</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/shop/myPage/main">반품&교환</a></li>
                    </ul>
	            </li>
	            
	             <li class="navi_item dropdown">
	                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	                	마이페이지
	                </a>
	                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/shop/myPage/main">주문내역/배송</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/shop/myPage/review">리뷰/Q&amp;A</a></li>
					</ul>
	            </li>
	            
	        </ul>
	    </div>
    </div>
    
    <div class="cate_container_wrap">
		<div class="cate_container">
	        <div class="cate_wrap">
	            <h2>전체 카테고리 보기</h2>
	            <ul class="cate_list">
	                <li class="cate_item cate_item1">
	                    <h3><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=126">텐트&nbsp;&middot;&nbsp;타프</a></h3>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=134">거실형텐트</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=135">돔형텐트</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=136">티피/루프탑텐트</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=137">백패킹텐트</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=138">면텐트</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=139">타프</a></p>
	                </li>
	                <li class="cate_item cate_item2">
	                    <h3>침낭&nbsp;&middot;&nbsp;매트</h3>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=140">침낭</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=141">자충/에어매트</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=142">카페트/블랑켓/러그</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=143">발포매트/폼매트/레저시트</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=144">전기매트</a></p>
	                </li>
	                <li class="cate_item cate_item3">
	                    <h3>퍼니처</h3>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=145">테이블</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=146">릴렉스 체어</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=147">미니 경량 체어</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=148">야전침대</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=149">해먹/스탠드</a></p>
	                </li>
	                <li class="cate_item cate_item4">
	                    <h3>라이팅</h3>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=150">스토브</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=151">가스/오일랜턴</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=152">LED랜턴/충전식랜턴</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=153">헤드랜턴/후레쉬</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=154">릴선</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=155">연장선</a></p>
	                </li>
	                <li class="cate_item cate_item5">
	                    <h3>BBQ</h3>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=156">화로대</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=157">그릴/플레이트</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=158">가스/연료/착화제</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=159">BBQ용품</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=160">토치/연료통</a></p>
	                </li>
	                <li class="cate_item cate_item6">
	                    <h3>키친</h3>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=161">코펠/쿠커</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=162">냄비/팬/솔/더치오브</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=163">식기/주전자</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=164">수저/칼/도마/조리도구</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=165">컵/잔/시에라</a></p>
	                </li>
	                <li class="cate_item cate_item7">
	                    <h3>스토리지</h3>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=166">수납박스/웨건</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=167">대형 수납케이스</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=168">소형 수납케이스</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=169">대형 가방 20L 이상</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=170">소형 가방 20L 미만</a></p>
	                </li>
	                <li class="cate_item cate_item8">
	                    <h3>악세서리</h3>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=171">해머/톱/삽/도끼</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=172">나이프/tool</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=173">비너/열쇠고리</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=174">데코/장식용품</a></p>
	                    <p><a href="${pageContext.request.contextPath}/shop/product/list?categoryNum=175">등산용품</a></p>
	                </li>
	            </ul>
	        </div>
	    </div>
	    
		<div class="cate_container1">
	        <div class="cate_wrap">
	            <h2>브랜드</h2>
	            <ul class="brand_search_list">
	                <li class="cate_item cate_item1" data-start="가" data-end="나">
						<span>가</span>
	                </li>
	                <li class="cate_item cate_item2" data-start="나" data-end="다">
						<span>나</span>
	                </li>
	                <li class="cate_item cate_item3" data-start="다" data-end="라">
						<span>다</span>
	                </li>
	                <li class="cate_item cate_item4" data-start="라" data-end="마">
						<span>라</span>
	                </li>
	                <li class="cate_item cate_item5" data-start="마" data-end="바">
						<span>마</span>
	                </li>
	                <li class="cate_item cate_item6" data-start="바" data-end="사">
						<span>바</span>
	                </li>
	                <li class="cate_item cate_item7" data-start="사" data-end="아">
						<span>사</span>
	                </li>
	                <li class="cate_item cate_item8" data-start="아" data-end="자">
						<span>아</span>
	                </li>
	                <li class="cate_item cate_item9" data-start="자" data-end="차">
						<span>자</span>
	                </li>
	                <li class="cate_item cate_item10" data-start="차" data-end="카">
						<span>차</span>
	                </li>
	                <li class="cate_item cate_item11" data-start="카" data-end="타">
						<span>카</span>
	                </li>
	                <li class="cate_item cate_item12" data-start="타" data-end="파">
						<span>타</span>
	                </li>
	                <li class="cate_item cate_item13" data-start="파" data-end="하">
						<span>파</span>
	                </li>
	                <li class="cate_item cate_item14" data-start="하" data-end="">
						<span>하</span>
	                </li>
	            </ul>
	            
	            <div class="brand-list"></div>
	        </div>
	    </div>
    </div>
</nav>

<script>
    $(function(){
        $(document).ready(function() {
            $(".cate_container").hide();
        });
	
	   $(".hamburger").mouseover(function(){
	       //$(".cate_container").fadeIn( 'slow' );
	       $(".cate_container").show();
	       $(".cate_container").css("height", "730px");
	   });
	   $(".brand").mouseover(function() {
		   $(".cate_container").css("height", "0");
		   $(".cate_container").hide();
	   });
	   //$("nav").mouseover(function(){
	   //    $(".cate_container").css("height", "730px");
	   //});
	   $(".cate_container").mouseover(function(){
	       $(this).css("height", "730px");
	   });
	   $(".navi_container").mouseleave(function(){
	       $(".cate_container").css("height", "0");
	       //$(".cate_container").fadeOut('fast');
	       $(".cate_container").hide();
	   });
	   $(".cate_container").mouseleave(function(){
	       $(".cate_container").css("height", "0");
	       //$(".cate_container").fadeOut('fast');
	       $(".cate_container").hide();
	   });
	   
	   
	   // 브랜드 슬라이드
       $(document).ready(function() {
           $(".cate_container1").hide();
       });
	
	   $(".brand").mouseover(function(){
	       //$(".cate_container").fadeIn( 'slow' );
	       $(".cate_container1").show();
	       $(".cate_container1").css("height", "730px");
	   });
	   $(".hamburger").mouseover(function() {
		   $(".cate_container1").css("height", "0");
		   $(".cate_container1").hide();
	   });
	   //$("nav").mouseover(function(){
	   //    $(".cate_container").css("height", "730px");
	   //});
	   $(".cate_container1").mouseover(function(){
	       $(this).css("height", "730px");
	   });
	   $(".navi_container").mouseleave(function(){
	       $(".cate_container1").css("height", "0");
	       //$(".cate_container").fadeOut('fast');
	       $(".cate_container1").hide();
	   });
	   $(".cate_container1").mouseleave(function(){
	       $(".cate_container1").css("height", "0");
	       //$(".cate_container").fadeOut('fast');
	       $(".cate_container1").hide();
	   });
    });
    
    $(document).ready(function(){
        $("#hamburgerIcon").click(function(){
            $(".mobile-nav").slideToggle();
        });
    });
    
</script>

<script type="text/javascript">
$(document).ready(function() {
    $(".dropdown-toggle").dropdown();
});
</script>


<script>
$(function(){
	$(".brand_search_list .cate_item").click(function(){
		let start = $(this).attr("data-start");
		let end = $(this).attr("data-end");
		let url = "${pageContext.request.contextPath}/shop/product/listBrand";
		
		$.get(url, {start:start, end:end}, function(data){
			let s;
			$('.brand-list').empty();
			for(let item of data.listBrand) {
				console.log(item);
				let brandNum = item.brandNum;
				let brandName = item.brandName;
				
				s = '<div class="brand-item" data-brandNum = "'+brandNum+'">'+brandName+'</div>';
				$('.brand-list').append(s);
				
			}
		}, "json");
	});
	
	$(".brand-list").on("click", ".brand-item", function(){
		let brandNum = $(this).attr("data-brandNum");
		//alert(brandNum);
		console.log(brandNum);
		let url = '${pageContext.request.contextPath}/shop/product/list?brandNum=' + brandNum;
		location.href = url;
	});
	
});

</script>

