<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user.css">

</head>
<body>
	<div id="wrap">
	
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<!------------------- header --------------------->
		
		<div id="content">
			<div id="login-form">
				<h2>로그인</h2>
				<hr>
				<p>서비스 이용을 위해 로그인 해주세요.</p>
				<div id="form-container">
					<form action="${pageContext.request.contextPath}/user/login" method="post">
						<label for="id">아이디</label><br> <input id="id" name="id"
							type="text"><br> <label for="password">비밀번호</label><br>
						<input id="password" name="password" type="password"><br>
						<p>
							<a href="join-form.html">회훤가입</a> <a href="">비밀번호 재설정</a>
						</p>
						<button type="submit" id="btn-submit">로그인</button>
					</form>
				</div>
				<!-- form-container -->
			</div>
			<!-- login-form -->
		</div>
		<!-- content -->

	<!------------------------ footer ------------------------>
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	
	</div>
	<!-- wrap -->

</body>
</html>