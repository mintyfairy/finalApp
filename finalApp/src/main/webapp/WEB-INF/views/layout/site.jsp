<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><tiles:insertAttribute name="title"/></title>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/icon/bootstrap-icons.css" type="text/css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/core.css" type="text/css">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util-jquery.js"></script>
	
    <meta content="" name="keywords">
    <meta content="" name="description">


    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" >
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">  

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/lib/campsite/animate/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/lib/campsite/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/lib/campsite/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />


    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/campsite.css" rel="stylesheet">
</head>

<style>
	@font-face {
	     font-family: 'S-CoreDream-3Light';
	     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
	     font-weight: normal;
	     font-style: normal;
	}
	
	body {
		font-family: S-CoreDream-3Light;
	}
</style>

<body>

<header>
    <tiles:insertAttribute name="header"/>
</header>
	
<main>
    <tiles:insertAttribute name="body"/>
     <!-- JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/lib/campsite/wow/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/lib/campsite/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/lib/campsite/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/lib/campsite/counterup/counterup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/lib/campsite/owlcarousel/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/lib/campsite/tempusdominus/js/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/lib/campsite/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/lib/campsite/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
    
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/menu.js"></script>
	

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/resources/js/campsite.js"></script>
</main>

<footer>
    <tiles:insertAttribute name="footer"/>
</footer>

</body>
</html>