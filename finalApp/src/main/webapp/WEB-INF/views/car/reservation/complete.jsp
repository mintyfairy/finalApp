<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.container {
	width: 1000px;
    margin: 0 auto;
}

.body-container {
	width: 500px;
	height: 300px;
	padding-top: 50px;
	margin: 0 auto;
	border: 1px solid silver;
}

.complete {
    margin: 10px auto;
    text-align: center;
}


</style>

<div class="container">
        <div class="body-container">	
            <div class="complete">
                <h4 class="text-center fw-bold">${title}</h4>
                           
                <div class="d-grid p-3">
                    <p class="text-center">${message}</p>
                </div>
                           
                <div class="d-grid">
                    <button type="button" class="btn btn-lg btn-primary" onclick="location.href='${pageContext.request.contextPath}/car/main';">메인화면 <i class="bi bi-check2"></i> </button>
                </div>
            </div>
        </div>
    </div>