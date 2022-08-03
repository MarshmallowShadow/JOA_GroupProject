<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 메뉴</title>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/my-page.css">

<!-- jquery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/my-page/menubar.js"></script>

</head>
<body>
	<div id="wrap">
		
		<!--메인 해더 자리 -->
		<div id="header">
			<img id="logo" src="${pageContext.request.contextPath}/assets/image/main/logo.jpg">
			
			<div id="login">
				<ul>
					<li><a href="">회원가입</a></li>
					<li><a href="">로그인</a></li>
				</ul>
			</div> <!-- login -->
			
			<div id="nav">
				<ul>
					<li><a href="../together/together.html">함께하기</a></li>
					<li><a href="../board/board.html">게시판</a></li>
					<li><a href="../best/best.html">베스트</a></li>
					<li><a href="../map/map.html">지도</a></li>
				</ul>
			</div> <!-- nav -->
		</div> <!-- header -->
		
		
		
		<div class="menuBar-display">
			<div class="menuBar">
				<div class="menu1">
					<ol>
						<li id="mypage">
							<a href="${pageContext.request.contextPath}/my-page">마이페이지 <img class="myHome" src="${pageContext.request.contextPath}/assets/image/my-page/house.png"></a>
						</li>
						<li class="menuBar-close">
							<a href=""><img class="menuBar-close-btn" src="${pageContext.request.contextPath}/assets/image/my-page/menu.png"></a>
						</li>
						<li id="menuList"><a href="${pageContext.request.contextPath}/my-page/my-course">나의 코스 보기</a></li>
						<li id="menuList"><a href="${pageContext.request.contextPath}/my-page/my-report">나의 기록 보기</a></li>
					</ol>
				</div>
				
				<div class="menu2">
					<ol>
						<li id="bookmark"><a href="${pageContext.request.contextPath}/my-page/bookmark">즐겨찾기 <img class="bmStar" src="${pageContext.request.contextPath}/assets/image/my-page/star.png"></a></li>
						<li class="bookmark-btn">
							<img class="plus-btn" src="${pageContext.request.contextPath}/assets/image/my-page/plus.png">&nbsp; 
							<img class="minus-btn" src="${pageContext.request.contextPath}/assets/image/my-page/minus.png">
						</li>
						<li id="menuList">
							<a href="${pageContext.request.contextPath}/my-page/bookmark/01">서울 근교 코스 </a>
							<img class="editName" src="${pageContext.request.contextPath}/assets/image/my-page/edit.png">				
						</li>
						<li id="menuList">
							<a href="${pageContext.request.contextPath}/my-page/bookmark/01">웃겨 자빠질 코스</a>
							<img class="editName" src="${pageContext.request.contextPath}/assets/image/my-page/edit.png">
						</li>
						<li id="menuList">
							<a href="${pageContext.request.contextPath}/my-page/bookmark/01">기어가는 코스</a>
							<img class="editName" src="${pageContext.request.contextPath}/assets/image/my-page/edit.png">
						</li>
					</ol>
				</div>
				
				<div class="menu3">
					<ol>
						<li id="members"><p><a href="">회원정보수정 <img id="setting" src="${pageContext.request.contextPath}/assets/image/my-page/setting.png"></a></p></li>
					</ol>
				</div>
			</div>
		</div>	
	
	<!-- 메인 푸터  자리-->
		
	
	</div>
	<!-- //center-content -->


<!-- 모달-즐겨찾기 추가 ***************************************************************************************** -->
<div class="category-add-btn">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">즐겨찾기 추가</h4>
        <br>
        <h2 class="modal-title">새로운 목록을 만들어 주세요.</h2>
      </div>
      <div class="modal-body">
        <p>새 목록 이름</p>
        <br>
        <input type="text" placeholder="즐겨찾기 이름을 입력하세요">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">목록 만들기</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<!-- 모달-즐겨찾기 추가 끝!! ************************************************************************************* -->

<!-- 모달-즐겨찾기 삭제 ***************************************************************************************** -->
<div class="category-del-btn">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">즐겨찾기 삭제</h4>
        <br>
        <h3 class="modal-title">삭제할 목록을 선택해 주세요.</h3>
      </div>
      <div class="modal-body">
        <select>
        	<option>즐겨찾기1</option>
        	<option>즐겨찾기2</option>
        	<option>즐겨찾기3</option>
        	<option>으아아아앙</option>
        </select>
        <br>
        <br>
        <p>목록을 삭제할 경우,<br>목록 안의 내용들도 삭제됩니다!!</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">목록 삭제</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<!-- 모달-즐겨찾기 삭제 끝!! ************************************************************************************* -->

<!-- 모달-즐겨찾기 이름변경 ***************************************************************************************** -->
<div class="category-modify-btn">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <h4 class="modal-title">즐겨찾기 목록 이름 변경</h4>
    </div>
    <div class="modal-body">
    	<p>목록의 이름을 변경해주세요.</p>
    	<br>
    	<input type="text" placeholder="카테고리 기존 이름">
    </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
      <button type="button" class="btn btn-primary">변경</button>
    </div>
  </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<!-- 모달-즐겨찾기 이름변경 끝!! ***************************************************************************************** -->

</body>
</html>