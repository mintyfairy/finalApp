<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
<div style="width: 500px ;height: 500px; text-align: center;padding-top: 200px;font-size: 30px;margin-left: 40%">
	 <p>금지된 접근 입니다.</p>
	 <button type="button" class='btn btn-primary' onclick="location.href='${pageContext.request.contextPath}/'">메인화면으로</button>
</div>
</body>
</html>	   