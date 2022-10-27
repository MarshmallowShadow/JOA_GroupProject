<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통계</title>
<!-- css -->
<link href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/statistics.css">

<!-- 자바스크립트 -->
<script type="text/javascript">
	window.contextPath = '${pageContext.request.contextPath}';
</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.js"></script>
</head>
<body>
<div id="wrap">
	
	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- 헤더 -->
	
	
	
	<!-- content -->
	<div id="content">
		
		<!-- 타이틀 -->
		<div>
			<h1 id="title">통계</h1>
		</div>
		
		<div id="sel">
			<select id="month-select">
				<option value="all" selected="selected">전체</option>
				<option value="01">1월</option>
				<option value="02">2월</option>
				<option value="03">3월</option>
				<option value="04">4월</option>
				<option value="05">5월</option>
				<option value="06">6월</option>
				<option value="07">7월</option>
				<option value="08">8월</option>
				<option value="09">9월</option>
				<option value="10">10월</option>
				<option value="11">11월</option>
				<option value="12">12월</option>
			</select>
			
			<button type="button" id="selectBtn">조회</button>
		</div>
		
		
		<c:choose>
			<c:when test="${param.selected eq null }">
				<table>
					<tr>
						<th>작성자</th>
						<th>01월</th>
						<th>02월</th>
						<th>03월</th>
						<th>04월</th>
						<th>05월</th>
						<th>06월</th>
						<th>07월</th>
						<th>08월</th>
						<th>09월</th>
						<th>10월</th>
						<th>11월</th>
						<th>12월</th>
						<th>총합계</th>
					</tr>
				
					
					<c:forEach items="${statList }" var="stat">
						<tr>
							<td>${stat.name }</td>
							
							<c:forEach items="${stat.dataList }" var="data">
								<td>${data.CNT }</td>
							</c:forEach>
							
							<td>${stat.total }</td>
						</tr>
					</c:forEach>
				</table>
			</c:when>
			
			<c:otherwise>
				<table>
					<tr>
						<th>작성자</th>
						<th>${param.selected }월</th>
					</tr>
					
					<c:forEach items="${statList }" var="stat">
						<tr>
							<td>${stat.name }</td>
							
							<c:forEach items="${stat.dataList }" var="data">
								<td>${data.CNT }</td>
							</c:forEach>
							
						</tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
		
		

	</div>
	<!-- content -->
	
	
	
	<!-- 푸터 -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- 푸터 -->
	
</div>
<!-- wrap -->
</body>

<script type="text/javascript">

$(document).ready(function() {
	var param = "${param.selected}";
	console.log(param);
	$('select > option[value='+param+']').prop('selected', true);
});

$('#selectBtn').on('click', function() {
	var selected = $('#month-select').val();
	if(selected != 'all') {
		location.href = "./?selected="+selected;
	} else {
		location.href = "${pageContext.request.contextPath}/stat/";
	}
	
});

</script>
</html>