<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!-- 메뉴1-나의코스보기/나의기록보기 -->
<div class="entireMenu">
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
				<img class="plus-btn" data-toggle="modal" data-target=".category-add-btn" src="${pageContext.request.contextPath}/assets/image/my-page/plus.png">&nbsp; 
				<img class="minus-btn" data-toggle="modal" data-target=".category-del-btn" src="${pageContext.request.contextPath}/assets/image/my-page/minus.png">
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
</div>

<!-- 모달-즐겨찾기 추가 ***************************************************************************************** -->

<div class="modal fade category-add-btn" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <img alt="즐겨찾기" src="${pageContext.request.contextPath }/assets/image/main/star.png">
        <h5 class="modal-title">즐겨찾기 추가</h5>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <p>즐겨찾기 이름을 입력하세요!!</p>
            <input type="text" class="form-control" name="catename" value="" placeholder="새 목록 이름">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="add-bookmark-category">목록 만들기</button>
      </div>
    </div>
  </div>
</div>

<!-- 모달-즐겨찾기 추가 끝!! ************************************************************************************* -->


<!-- 모달-즐겨찾기 삭제 ***************************************************************************************** -->
<div class="modal fade category-del-btn" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
      	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <img alt="즐겨찾기" src="${pageContext.request.contextPath }/assets/image/main/star.png">
        <h5 class="modal-title">즐겨찾기 삭제</h5>
      </div>
      <div class="modal-body">
      	<p>삭제할 목록을 선택해 주세요!</p> 
        <select id="del-select-list" class="sel-delCategory" >
        	<%-- <option>${categoryVo.cateName}</option> --%>
        </select>
        
        
        <div class="dropdown">
		  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
		    Dropdown
		    <span class="caret"></span>
		  </button>
		  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
		    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
		  </ul>
		</div>
		<p class="cate-del-warning">삭제시 목록 안의 내용들도 삭제됩니다!!</p>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="del-bookmark-category">목록 삭제</button>
      </div>
    </div>
  </div>
</div>



<!-- 모달-즐겨찾기 삭제 끝!! ************************************************************************************* -->

<!-- 모달-즐겨찾기 이름변경 ***************************************************************************************** -->
<div class="modal category-modify-btn">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <img alt="즐겨찾기" src="${pageContext.request.contextPath }/assets/image/main/star.png">
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




