<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 메뉴</title>

<!-- CSS -->
<link rel="stylesheet" href="../../../assets/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="../../../assets/css/my-page.css">

<!-- jquery -->
<script type="text/javascript" src="../../../assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../../../assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="../../../assets/js/my-page/my-page.js"></script>



</head>
<body>
	<div id="wrap">
		
		<!--메인 해더 자리 -->
		<div id="header">
			<img id="logo" src="../../../assets/image/main/logo.jpg">
			
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
							<a href="./main.html">마이페이지 <img class="myHome" src="../../../assets/image/my-page/house.png"></a>
						</li>
						<li id="bookmark-btn">
							<a href=""><img class="menuBar-close" src="../../../assets/image/my-page/menu.png"></a>
						</li>
						<li id="menuList"><a href="./my-course.html">나의 코스 보기</a></li>
						<li id="menuList"><a href="./my-report.html">나의 기록 보기</a></li>
					</ol>
				</div>
				
				<div class="menu2">
					<ol>
						<li id="bookmark"><a href="./bookmark.html">즐겨찾기 <img class="bmStar" src="../../../assets/image/my-page/star.png"></a></li>
						<li id="bookmark-btn">
							<img class="plus-btn" src="../../../assets/image/my-page/plus.png">&nbsp; 
							<img class="minus-btn" src="../../../assets/image/my-page/minus.png">
						</li>
						<li id="menuList">
							<a href="./bookmark-ex.html">서울 근교 코스 </a>
							<img class="editName" src="../../../assets/image/my-page/edit.png">				
						</li>
						<li id="menuList">
							<a href="">웃겨 자빠질 코스</a>
							<img class="editName" src="../../../assets/image/my-page/edit.png">
						</li>
						<li id="menuList">
							<a href="">기어가는 코스</a>
							<img class="editName" src="../../../assets/image/my-page/edit.png">
						</li>
					</ol>
				</div>
				
				<div class="menu3">
					<ol>
						<li id="members"><p><a href="">회원정보수정 <img id="setting" src="../../../assets/image/my-page/setting.png"></a></p></li>
					</ol>
				</div>
			</div>
		</div>	
	
	<!-- 메인 푸터  자리-->
		
	
	</div>
	<!-- //center-content -->


<!-- 모달-즐겨찾기 추가 ***************************************************************************************** -->


<div class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">즐겨찾기 추가</h4>
        <h3 class="modal-title">새로운 목록을 만들어 주세요.</h3>
      </div>
      <div class="modal-body">
        <p>새 즐겨찾기 이름</p>
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


<div class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">즐겨찾기 삭제</h4>
        <h3 class="modal-title">삭제할 목록을 선택해 주세요.</h3>
      </div>
      <div class="modal-body">
        <select>
        	<option>즐겨찾기1</option>
        	<option>즐겨찾기2</option>
        	<option>즐겨찾기3</option>
        	<option>으아아아앙</option>
        </select>
        <p>목록을 삭제할 경우,<br>목록 안의 내용들도 삭제됩니다!!</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">목록 만들기</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<!-- 모달-즐겨찾기 삭제 끝!! ************************************************************************************* -->



</body>
</html>