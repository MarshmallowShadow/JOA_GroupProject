/*나의코스보기*/
function render(cMap) {
	var str = '';
	str += '<li>';
	str += '	<div class="listBox" style="cursor: pointer;" >'; /*onclick="window.location='';"*/
	str += '	  	<img class="courseImg" src="'+contextPath+'/assets/image/my-page/sample.jpg">';
	str += '	  	<div id="textBox">';
	str += '			<div class="courseTitle">';
	str += '				<p id="courseName">[공개]'+cMap.TITLE+' &nbsp;<img class="besticon" src="'+contextPath+'/assets/image/best/cgold.jpg"></p>';
	str += '				<div class="img-icons">';
	str += '					<img class="like-cancel-btn" src="'+contextPath+'/assets/image/main/heart.png">';
	str += '					<img class="bookmark-cancel-btn" src="'+contextPath+'/assets/image/main/star.png">';
	str += '				</div>';
	str += '			</div>';
	str += '			<p id="courseInfo">'+cMap.NAME+'</p>';
	str += '			<p id="courseInfo">조회수'+cMap.HIT+' * '+cMap.REGDATE+'</p>';
	str += '			<p id="courseInfo">후기글'+cMap.COUNTRECORD+' &nbsp;<img class="newpost" src="'+contextPath+'/assets/image/main/new.png"></p>';
	str += '	  	</div>';
	str += '	</div>';
	str += '</li>';
	
	$(".my-course-list-box").append(str);
}