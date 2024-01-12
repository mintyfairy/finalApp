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

ol, ul {
	list-style: none;
}

.container {
	margin-bottom: 140px;
	padding-top: 140px;
}

.container .wrap {
	width: 1080px;
	margin: 0 auto;
}

.container .wrap h1 {
	text-align: center;
	font-size: 36px;
	margin-bottom: 60px;
}

.container .wrap .option_wrap {
	margin-bottom: 100px;
}

.option_wrap .option_list {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
}

.option_wrap .option_list .option_item {
	flex-basis: 18%;
	height: 50px;
	text-align: center;
	line-height: 50px;
	margin: 5px;
	cursor: pointer;
	border: 1px solid #efefef;
}

.goods_wrap {
	width: 1080px;
	margin: 0 auto;
}

.goods_wrap .goods_list {
	display: flex;
	flex-wrap: wrap;
}

.goods_wrap .goods_list .goods_item {
	width: 250px;
	margin-left: 4px;
	margin-right: 4px;
	height: 500px;
}

.goods_list .goods_item .goods_photo {
	display: block;
	height: 250px;
	overflow: hidden;
	border: 1px solid #dedede;
	border-radius: 12px;
}

.goods_list .goods_item .goods_text {
	height: 200px;
	padding-top: 8px;
}

.goods_list .goods_item .goods_text .goods_brand {
	font-size: 13px;
	font-weight: 600;
	margin-bottom: 10px;
}

.goods_list .goods_item .goods_text .goods_title {
	margin-bottom: 28px;
}

.goods_list .goods_item .goods_text .goods_title .goods_sale {
	font-weight: 600;
	color: red;
}

.goods_list .goods_item .goods_text .price {
	font-size: 12px;
	color: #aeaeae;
	text-align: right;
	text-decoration: line-through;
}

.goods_list .goods_item .goods_text .price_wrap {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 4px;
	padding-bottom: 10px;
	border-bottom: 1px solid #ccc;
}

.goods_list .goods_item .goods_text .price_wrap h4:first-child {
	color: red;
}

.goods_list .goods_item .goods_text .review {
	font-size: 13px;
	font-weight: 600;
	color: #8a8a8a;
}
</style>

<div class="container">
	<div class="wrap">
		<h1>대분류명</h1>
		<div class="option_wrap">
			<ul class="option_list">
				<c:forEach var="dto" items="${list}" varStatus="status">
					<li class="option_item">${ dto.productName }</li>
				</c:forEach>
			</ul>
		</div>

		<div class="goods_wrap">
			<ul class="goods_list">
				<c:forEach var="dto" items="${list}" varStatus="status">
					<li class="goods_item"><a href="${pageContext.request.contextPath}/shop/product/${dto.productNum}" class="goods_photo"> <img
							src="https://via.placeholder.com/250x250" alt="goods_item">
					</a>
						<div class="goods_text">
							<p class="goods_brand">${dto.brandName}</p>
							<p class="goods_title">${dto.productName}
								<span class="goods_sale">${dto.discountRate}</span>
							</p>
							<p class="price">${dto.price}</p>
							<div class="price_wrap">
								<h4>${dto.discountRate}%</h4>
								<h4>${dto.salePrice}</h4>
							</div>
							<p class="review">리뷰 개수</p>
						</div></li>
				</c:forEach>
			</ul>
		</div>

		<div class="paging_wrap">
			<!-- 페이징 -->
		</div>
	</div>
</div>