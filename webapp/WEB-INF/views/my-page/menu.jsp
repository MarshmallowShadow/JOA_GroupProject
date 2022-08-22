<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 메뉴1-나의코스보기/나의기록보기 -->
<div class="menu1">
	<ol>
		<li id="mypage">
			<a href="${pageContext.request.contextPath}/my-page">마이페이지 <img class="myHome" src="${pageContext.request.contextPath}/assets/image/my-page/house.png"></a>
		</li>
		<li class="menuBar-close">
			 <!-- <a href="javascript:void(0)" class="closebtn" onclick="closeNav()"> --><img class="menuBar-close-btn" src="${pageContext.request.contextPath}/assets/image/my-page/menu.png">
		</li>
		<li id="menuList"><a href="${pageContext.request.contextPath}/my-page/my-course">나의 코스 보기</a></li>
		<li id="menuList"><a href="${pageContext.request.contextPath}/my-page/my-report">나의 기록 보기</a></li>
	</ol>
</div>

<!-- 메뉴2-즐겨찾기 -->
<div class="menu2">
	<ol>
		<li id="bookmark"><a href="${pageContext.request.contextPath}/my-page/bookmark/main">즐겨찾기 <img class="bmStar" src="${pageContext.request.contextPath}/assets/image/my-page/star.png"></a></li>
		<li class="bookmark-btn">
			<img class="plus-btn" src="${pageContext.request.contextPath}/assets/image/my-page/plus.png">&nbsp; 
			<img class="minus-btn" src="${pageContext.request.contextPath}/assets/image/my-page/minus.png">
		</li>
	</ol>	
	<ol class="categoryArea">	
		<%-- <li id="menuList">
			<a href="${pageContext.request.contextPath}/my-page/bookmark/01">서울 근교 코스 </a>
			<img class="editName" src="${pageContext.request.contextPath}/assets/image/my-page/edit.png">				
		</li> --%>
	</ol>
</div>

<!-- 메뉴3-회원정보수정 -->
<div class="menu3">
	<ol>
		<li id="members"><p><a href="">회원정보수정 <img id="setting" src="${pageContext.request.contextPath}/assets/image/my-page/setting.png"></a></p></li>
	</ol>
</div>


<!-- 모달-즐겨찾기 추가 ***************************************************************************************** -->
<div class="modal category-add-btn">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="add-bookmark-category-close"><span aria-hidden="true">&times;</span></button>
        <h5 class="modal-title">즐겨찾기 추가</h5>
        <br>
        <p class="modal-title">새로운 목록을 만들어 주세요.</p>
      </div>
      <div class="modal-body">
        <p>새 목록 이름</p>
        <input type="text" name="catename" value="" placeholder="즐겨찾기 이름을 입력하세요">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" id="add-bookmark-category-cancel" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="add-bookmark-category">목록 만들기</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<!-- 모달-즐겨찾기 추가 끝!! ************************************************************************************* -->

<!-- 모달-즐겨찾기 삭제 ***************************************************************************************** -->
<div class="modal category-del-btn">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" id="del-bookmark-category-close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h5 class="modal-title">즐겨찾기 삭제</h5>
        <br>
        <p class="modal-title">삭제할 목록을 선택해 주세요.</p>
      </div>
      <div class="modal-body">
        <select id="del-select-list" class="sel-delCategory" >
        	<%-- <option>${categoryVo.cateName}</option> --%>
        </select>
        <p <%--  class="modal-body-detail" --%>>목록을 삭제할 경우,<br>목록 안의 내용들도 삭제됩니다!!</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" id="del-bookmark-category-cancel" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="del-bookmark-category">목록 삭제</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<!-- 모달-즐겨찾기 삭제 끝!! ************************************************************************************* -->

<!-- 모달-즐겨찾기 이름변경 ***************************************************************************************** -->
<div class="modal category-modify-btn">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" id="edit-bookmark-category-close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <h5 class="modal-title">즐겨찾기 목록 이름 변경</h5>
    </div>
    <div class="modal-body">
    	<p>목록의 이름을 변경해주세요.</p>
    	<div id="cateName-modal">
    		<%-- <input type="text" value="" placeholder="${categoryVo.cateName}"><input type="text" value="${categoryVo.cateNo}"> --%>
    	</div>
    </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-default" id="edit-bookmark-category-cancel" data-dismiss="modal">취소</button>
      <button type="button" class="btn btn-primary" id="edit-bookmark-category">변경</button>
    </div>
  </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<!-- 모달-즐겨찾기 이름변경 끝!! ***************************************************************************************** -->


<!-- 기록 삭제 모달!! ************************************************************************************* -->
<div class="modal myrecord-del-modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="edit-bookmark-category-close"><span aria-hidden="true">&times;</span></button>
        <h5 class="modal-title">기록 삭제</h5>
      </div>
      <div class="modal-body">
        <p class="modal-body-detail">기록을 삭제하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" id="edit-bookmark-category-cancel" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="byebye-record">기록삭제</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 좋아요 해제 모달 끝!! ************************************************************************************* -->



<!-- 좋아요 해제 모달!! ************************************************************************************* -->
<div class="modal course-like-cancel">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h5 class="modal-title">좋아요 해제</h5>
      </div>
      <div class="modal-body">
        <p class="modal-body-detail">좋아요를 해제하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">좋아요 해제</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 좋아요 해제 모달 끝!! ************************************************************************************* -->

<!-- 즐겨찾기 해제 모달!! ************************************************************************************* -->
<div class="modal course-bookmark-cancel">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h5 class="modal-title">즐겨찾기 해제</h5>
      </div>
      <div class="modal-body">
        <p class="modal-body-detail">즐겨찾기를 해제하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">즐겨찾기 해제</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 즐겨찾기 해제 모달 끝!! ************************************************************************************* -->

