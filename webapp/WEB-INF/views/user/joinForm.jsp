<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user.css">
	
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<!------------------- header --------------------->
		
		<div id="content">
			<div id="join-form">
				<h2>회원가입</h2>
				<hr>
				<div id="form-container">
					<form action="${pageContext.request.contextPath}/user/join" method="post">
						<div class="form-input">
							<label for="name">이름</label><input id="name" name="name" type="text">
						</div>
						<div class="form-input">
							<label for="id">아이디</label><input id="id" name="id" type="text">
							<button type=button id="btn-check">중복확인</button>
						</div>
						<div class="form-input">
							<label for="password">비밀번호</label><input id="password" name="password" type="password"><br>
						</div>
						<div class="form-input">
							<label for="password2">비밀번호 확인</label><input id="password2" name="password2" type="password"><br>
						</div>
						<div class="form-input">
							<label for="phone">전화번호</label><input id="phone" name="phone" type="text">
						</div>
						<div class="form-input">
							<label for="email">이메일</label><input id="email" name="email" type="text">
						</div>
						<div class="submit-container">
							<button type="submit" id="btn-submit">회원가입</button>
						</div>
					</form>
				</div> <!-- form-container -->
			</div><!-- join-form -->
		</div> <!-- content -->
		
	<!------------------------ footer ------------------------>
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	
	</div> <!-- wrap -->

</body>
</html>