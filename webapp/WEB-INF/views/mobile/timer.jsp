<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>운동하기</title>
	<!-- css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/mobile.css">
	
</head>

<body>
	<div id="wrap">
		<div id="header"><a href="${pageContext.request.contextPath }/"><img id="logo" src="${pageContext.request.contextPath }/assets/image/main/logo.jpg"></a></div>
		<div id="content">
			<div id="display">00:00:00.0</div>
			
			<div id="btn-start-stop"><button type="button" class="glyphicon glyphicon-off"></button></div>
			
			<div id="buttons">
				<button type="button">초기화</button>
				<button type="button">코스 기록</button>
			</div>
		</div>
		
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	</div>
</body>

</html>