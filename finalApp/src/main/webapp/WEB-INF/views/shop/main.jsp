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

ol,
ul {
    list-style: none;
}

main {
    background-color: #fff;
}

.main_slider_wrap {
	width: 1100px;
    height: 700px;
    margin: 0 auto;
    border-radius: 12px;
    /*
    background: url("${pageContext.request.contextPath}/resources/images/shop/shop_background01.jpg") no-repeat top center;
    */
}

.main_slider {
    height: 100%;
}

.category_container {
    margin-bottom: 40px;
    padding: 100px 0;
}

.category_container .category_wrap {
    width: 1080px;
    height: 240px;
    margin: 0 auto;
}

.category_container .category_wrap .category_list {
    display: flex;
    height: 100px;
}

.category_container .category_wrap .category_list .category_item {
    width: calc(100% / 4);
    cursor: pointer;
}

.category_container .category_wrap .category_list .category_item a {
    display: block;
    width: 100%;
    height: 100%;
    text-align: center;
    border-bottom: 1px solid #efefef;
    border-right: 1px solid #efefef;
}

.category_container .category_wrap .category_list .category_item a img {
    display: inline-block;
    margin-top: 5px;
}

.category_container .category_wrap .category_list .category_item a span {
    display: block;
    text-align: center;
    font-size: 14px;
}

.best_container {
    position: relative;
    height: 520px;
    margin-bottom: 120px;
}

.best_container h1 {
    width: 1080px;
    margin: 0 auto;
    margin-bottom: 50px;
}

.best_container .best_slider {
    position: absolute;
    bottom: 0;
    left: calc(50% - 540px);
    z-index: 100;
    width: 1080px;
    height: 300px;
    margin: 0 auto;
    cursor: poi
}

.focus_container {
    padding-top: 90px;
}

.focus_container .focus_wrap {
    width: 1080px;
    height: 580px;
    margin: 0 auto;
}

.focus_container .focus_wrap .focus_title {
    margin-bottom: 60px;
}

.focus_container .focus_wrap .focus_title span {
    display: inline-block;
    font-size: 36px;
    font-weight: 600;
    margin-left: 7px;
}

.focus_container .focus_wrap .focus_title .on {
    color: orange;
}

.focus_container .focus_wrap .focus_slider {
    height: 400px;
    cursor: pointer;
}

.hot_container {
    padding-top: 80px;
    padding-bottom: 150px;
}

.hot_container .hot_wrap {
    width: 1080px;
    height: 1040px;
    margin: 0 auto;
}

.hot_container .hot_wrap h1 {
    margin-bottom: 60px;
}

.hot_container .hot_wrap .hot_list_wrap {
    height: calc(100% - 104px);
}

.hot_container .hot_wrap .hot_list_wrap .hot_list {
    display: grid;
    height: 100%;
    grid-template-columns: repeat(4, 1fr);
    grid-template-rows: repeat(2, 1fr);
    gap: 14px 10px;
}

.hot_list .hot_item .hot_photo {
    display: block;
    height: 262px;
    overflow: hidden;
    border: 1px solid #dedede;
    border-radius: 12px;
}

.hot_list .hot_item .hot_text {
    height: 200px;
    padding-top: 8px;
}

.hot_list .hot_item .hot_text .hot_brand {
    font-size: 13px;
    font-weight: 600;
    margin-bottom: 10px;
}

.hot_list .hot_item .hot_text .hot_title {
    margin-bottom: 28px;
}

.hot_list .hot_item .hot_text .hot_title .hot_sale {
    font-weight: 600;
    color: red;
}

.hot_list .hot_item .hot_text .price {
    font-size: 12px;
    color: #aeaeae;
    text-align: right;
    text-decoration: line-through;
}

.hot_list .hot_item .hot_text .price_wrap {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 4px;
    padding-bottom: 10px;
    border-bottom: 1px solid #ccc;
}

.hot_list .hot_item .hot_text .price_wrap h4:first-child {
    color: red;
}

.hot_list .hot_item .hot_text .review {
    font-size: 13px;
    font-weight: 600;
    color: #8a8a8a;
}
</style>

<script type="text/javascript">
$(function(){
	$(".product-item").click(function(){
		let productNum = $(this).attr("data-productNum");
		let url = "${pageContext.request.contextPath}/product/"+productNum;
		location.href = url;
	});
	
	$(".product-item").mouseenter(function(e){
		$(this).find("img").css("transform", "scale(1.05)");
		$(this).find("img").css("overflow", "hidden");
		$(this).find("img").css("transition", "all 0.5s");
	});
	$(".product-item").mouseleave(function(e){
		$(this).find("img").css("transform", "scale(1)");
		$(this).find("img").css("transition", "all 0.5s");
	});
});

$(function(){
	$(".product-container").each(function(){
		if($(this).find(".product-inner").length < 1) {
			$(this).hide();
		} else if($(this).find(".product-inner").length === 1) {
			$(this).find(".page-move-right").hide();
		}
	});
	
	$(".product-container .product-inner").hide();
	$(".product-container").find(".product-inner:first").show();
	$(".page-move-left").hide();
	
	$(".page-move-left").click(function(){
		let $ps = $(this).closest(".product-container");
		
		let $show = null;
		$ps.find(".product-inner").each(function(){
			if($(this).is(':visible')) {
				$show = $(this);
				return false;
			}
		});
		
		if($show && $ps.find(".product-inner:first").index() !== $show.index()) {
			$show.hide('slide');
			$show.prev().show('slide');
			$ps.find(".page-move-right").show();
			if($ps.find(".product-inner:first").index() === $show.prev().index()) {
				$ps.find(".page-move-left").hide();
			}
		}
	});
	
	$(".page-move-right").click(function(){
		let $ps = $(this).closest(".product-container");
		
		let $show = null;
		$ps.find(".product-inner").each(function(){
			if($(this).is(':visible')) {
				$show = $(this);
				return false;
			}
		});

		if($show && $ps.find(".product-inner:last").index() !== $show.index()) {
			$show.hide('slide');
			$show.next().show('slide');
			$ps.find(".page-move-left").show();
			if($ps.find(".product-inner:last").index() === $show.next().index()) {
				$ps.find(".page-move-right").hide();
			}
		}
	});
});

$(function(){
	$(".product-container").each(function(){
		if($(this).find(".product-inner").length < 1) {
			$(this).closest(".product-container").parent().hide();
			$(this).parent().next(".see-more").hide();
		}
	});
});
</script>

<div class="main_slider_wrap">
    <div class="main_slider" style="height: 100%">
        <jsp:include page="/WEB-INF/views/slider/shop/main_slider.jsp"/>
    </div>
</div>

<div class="category_container">
    <div class="category_wrap">
        <ul class="category_list">
            <li class="category_item">
            	<a href="${pageContext.request.contextPath}/shop/product/main?categoryNum=126">
	            	<img src="${pageContext.request.contextPath}/resources/images/shop/sort01.png" />
	            	<span>텐트 타프</span>
            	</a>
            </li>
            <li class="category_item">
            	<a href="${pageContext.request.contextPath}/shop/product/main?categoryNum=127">
	            	<img src="${pageContext.request.contextPath}/resources/images/shop/sort02.png" />
	            	<span>침낭 매트</span>
            	</a>
            </li>
            <li class="category_item">
            	<a href="${pageContext.request.contextPath}/shop/product/main?categoryNum=128">
	            	<img src="${pageContext.request.contextPath}/resources/images/shop/sort03.png" />
	            	<span>퍼니처</span>
            	</a>
            </li>
            <li class="category_item">
            	<a href="${pageContext.request.contextPath}/shop/product/main?categoryNum=129">
	            	<img src="${pageContext.request.contextPath}/resources/images/shop/sort04.png" />
	            	<span>라이팅</span>
            	</a>
            </li>
        </ul>
        <ul class="category_list">
            <li class="category_item">
            	<a href="${pageContext.request.contextPath}/shop/product/main?categoryNum=130">
	            	<img src="${pageContext.request.contextPath}/resources/images/shop/sort05.png" />
	            	<span>BBQ</span>
            	</a>
            </li>
            <li class="category_item">
            	<a href="${pageContext.request.contextPath}/shop/product/main?categoryNum=131">
	            	<img src="${pageContext.request.contextPath}/resources/images/shop/sort06.png" />
	            	<span>키친</span>
            	</a>
            </li>
            <li class="category_item">
            	<a href="${pageContext.request.contextPath}/shop/product/main?categoryNum=132">
	            	<img src="${pageContext.request.contextPath}/resources/images/shop/sort07.png" />
	            	<span>스토리지</span>
            	</a>
            </li>
            <li class="category_item">
            	<a href="${pageContext.request.contextPath}/shop/product/main?categoryNum=133">
	            	<img src="${pageContext.request.contextPath}/resources/images/shop/sort08.png" />
	            	<span>악세서리</span>
            	</a>
            </li>
        </ul>
    </div>
</div>

<div class="best_container">
    <h1>인기 상품</h1>
    <div class="best_slider">
    	<jsp:include page="/WEB-INF/views/slider/shop/best_slider.jsp"/>
    </div>
</div>

<div class="focus_container">
    <div class="focus_wrap">
        <div class="focus_title">
            <span>FOCUS</span>
            <span class="on">ON</span>
        </div>
        <div class="focus_slider">
            <jsp:include page="/WEB-INF/views/slider/shop/focus_slider.jsp"/>
        </div>
    </div>
</div>

<div class="hot_container">
    <div class="hot_wrap">
        <h1>HOT PRICE</h1>
        <div class="hot_list_wrap">
            <ul class="hot_list">
            	<c:forEach var="vo" items="${listHot}">
	                <li class="hot_item">
	                    <a class="hot_photo" href="#">
	                        <img src="${pageContext.request.contextPath}/uploads/shop/${vo.thumbnail}" alt="hot_item" width="260">
	                    </a>
	                    <div class="hot_text">
	                        <p class="hot_brand">${vo.brandName}</p>
	                        <p class="hot_title">${vo.productName} <span class="hot_sale">${vo.discountRate}% 할인</span></p>
	                        <p class="price">${vo.price}</p>
	                        <div class="price_wrap">
	                            <h4>${vo.discountRate}%</h4>
	                            <h4><fmt:formatNumber type="currency" value="${vo.price*(1-vo.discountRate/100)}"></fmt:formatNumber></h4>
	                        </div>
	                    </div>
	                </li>
            	</c:forEach>
                
            </ul>
        </div>
    </div>
</div>