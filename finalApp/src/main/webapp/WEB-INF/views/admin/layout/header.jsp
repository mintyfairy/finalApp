<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script type="text/javascript">
// 메뉴 활성화
$(function(){
    var url = window.location.pathname;
    var urlRegExp = new RegExp(url.replace(/\/$/, '') + "$");
    
    try {
    	$('nav ul>li>a').each(function() {
    		if ( urlRegExp.test(this.href.replace(/\/$/, '')) ) {
    			$(this).addClass('active_menu');
    			return false;
    		}
    	});
    	if($('nav ul>li>a').hasClass("active_menu")) return false;

     	var parent = url.replace(/\/$/, '').substr(0, url.replace(/\/$/, '').lastIndexOf("/"));
     	if(! parent) parent = "/";
        var urlParentRegExp = new RegExp(parent);
    	$('nav ul>li>a').each(function() {
    		if($(this).attr("href")=="#") return true;
    		
    		var phref = this.href.replace(/\/$/, '').substr(0, this.href.replace(/\/$/, '').lastIndexOf("/"));
    		
    		if ( urlParentRegExp.test(phref) ) {
    			$(this).addClass('active_menu');
    			return false;
    		}
    	});
    	if($('nav ul>li>a').hasClass("active_menu")) return false;
    	
    	$('nav ul>.menu--item__has_sub_menu').each(function() {
    		if (urlRegExp.test(this.href.replace(/\/$/, '')) ) {
    			$(this).addClass('active_menu');
    			return false;
    		}
    	});
    	
    }catch(e) {
    }
});

$(function(){
	$('nav ul>.menu--item__has_sub_menu ul>li>a').each(function() {
		if($(this).hasClass('active_menu')) {
			$(this).closest(".menu--item__has_sub_menu").addClass('menu--subitens__opened');
			return false;
		}
	});
});
</script>

<header class="header clearfix">
	<button type="button" id="toggleMenu" class="toggle_menu">
		<i class="fa-solid fa-bars"></i>
	</button>
	
	<div class="header-container">
		<div class="header-left">
			<h1>CAMBRIDGE ADMIN PAGE</h1>
		</div>
		<div class="header-right">
			<span class="roll-user">
				<label class="user">
					<span class="name">관리자 님<i class="fa-solid fa-user" style="color: #e1e2e5;"></i>&nbsp;</span>
					<a href="${pageContext.request.contextPath}/"><i class="fa-solid fa-arrow-right-from-bracket" style="color: #e1e2e5;"></i></a>
				</label>
			</span>
		</div>
	</div>

</header>

<nav class="vertical_nav">
	<ul id="js-menu" class="menu">
	
		<li class="menu--item">
			<a href="${pageContext.request.contextPath}/admin" class="menu--link" title="Home">
				<i class="menu--icon  fa-fw fa-solid fa-house"></i>
				<span class="menu--label">Home</span>
			</a>
		</li>

		<li class="menu--item">
	        <a href="<c:url value='/admin/memberManage/list'/>" class="menu--link" title="회원 관리">
				<i class="menu--icon  fa-fw fa-solid fa-user-group"></i>
				<span class="menu--label">회원 관리</span>
			</a>
		</li>
	
		<li class="menu--item menu--item__has_sub_menu">
			<label class="menu--link" title="숙소예약관리">
				<i class="menu--icon fa-fw fa-solid fa-tent"></i>
				<span class="menu--label">캠핑장예약관리</span>
			</label>

			<ul class="sub_menu">
				<li class="sub_menu--item">
					<a href="${pageContext.request.contextPath}/admin/siteManage/main" class="sub_menu--link">캠핑장 관리</a>
				</li>
				<li class="sub_menu--item">
					<a href="${pageContext.request.contextPath}/admin/siteManage/chart" class="sub_menu--link">통계</a>
				</li>
			</ul>
		</li>

		<li class="menu--item menu--item__has_sub_menu">
			<label class="menu--link" title="캠핑카관리">
				<i class="menu--icon  fa-fw fa-solid fa-caravan"></i>
				<span class="menu--label">캠핑카관리</span>
			</label>

			<ul class="sub_menu">
				<li class="sub_menu--item">
					<a href="${pageContext.request.contextPath}/admin/carManage/car" class="sub_menu--link">캠핑카 관리</a>
				</li>
				<li class="sub_menu--item">
					<a href="${pageContext.request.contextPath}/admin/carReservation/chart" class="sub_menu--link">예약 관리</a>
				</li>
				<li class="sub_menu--item">
					<a href="${pageContext.request.contextPath}/admin/carReview/review" class="sub_menu--link">리뷰 및 문의 관리</a>
				</li>
				<li class="sub_menu--item">
					<a href="${pageContext.request.contextPath}/admin/carSales/sales" class="sub_menu--link">매출 관리</a>
				</li>
			</ul>
		</li>
		
		<li class="menu--item menu--item__has_sub_menu">
			<label class="menu--link" title="쇼핑몰관리">
				<i class="menu--icon  fa-fw fa-solid fa-cart-shopping"></i>
				<span class="menu--label">쇼핑몰관리</span>
			</label>

			<ul class="sub_menu">
				<li class="sub_menu--item">
					<a href="${pageContext.request.contextPath}/admin/shopOrder/status" class="sub_menu--link">주문 관리</a>
				</li>
				<li class="sub_menu--item">
					<a href="${pageContext.request.contextPath}/admin/shopProduct/main" class="sub_menu--link">상품 및 재고 관리</a>
				</li>
				<li class="sub_menu--item">
					<a href="${pageContext.request.contextPath}/admin/shopReview/main" class="sub_menu--link">리뷰 및 문의 관리</a>
				</li>
			</ul>
		</li>
		
		<li class="menu--item menu--item__has_sub_menu">
			<label class="menu--link" title="고객센터관리">
				<i class="menu--icon  fa-fw fa-solid fa-cart-shopping"></i>
				<span class="menu--label">고객센터관리</span>
			</label>

			<ul class="sub_menu">
				<li class="sub_menu--item">
					<a href="${pageContext.request.contextPath}/admin/cs/notice/list" class="sub_menu--link">공지사항</a>
				</li>
				<li class="sub_menu--item">
					<a href="${pageContext.request.contextPath}/admin/cs/faq/main" class="sub_menu--link">faq</a>
				</li>
				<li class="sub_menu--item">
					<a href="${pageContext.request.contextPath}/admin/cs/qna/list" class="sub_menu--link">1:1문의</a>
				</li>
				<li class="sub_menu--item">
					<a href="<c:url value='/admin/cs/event/all/list'/>" class="sub_menu--link">이벤트</a>
				</li>
			</ul>
		</li>
		
		
		
		<li class="menu--item">
	        <a href="<c:url value='/admin/salesManage/main'/>" class="menu--link" title="매출 관리">
				<i class="menu--icon  fa-fw fa-solid fa-sack-dollar"></i>
				<span class="menu--label">매출 관리</span>
			</a>
		</li>


		<li class="menu--item">
			<a href="${pageContext.request.contextPath}/member/logout" class="menu--link" title="Logout">
				<i class="menu--icon fa-fw fa-solid fa-lock-open"></i>
				<span class="menu--label">Logout</span>
			</a>
		</li>
	</ul>

	<button id="collapse_menu" class="collapse_menu">
		<i class="collapse_menu--icon fa fa-fw"></i>
		<span class="menu--label">Menu</span>
	</button>

</nav>
