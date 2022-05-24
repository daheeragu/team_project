<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀팁 | 이벤트 | BUSANONNA</title>

<script type="text/javascript" src="../resources/js/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
  $(document).ready(function(){
	//추가 버튼 이벤트 처리
	 $('#addbtn').on('click', function(){
		  $('#group').append('<input type="file" class="file_group" name="upload" size="30"><br>'); 
	  });
	//삭제 버튼에 클릭이벤트 처리
	 $('#deletebtn').on('click', fileDelete);
	
	  
  });
  
 function fileDelete(){
	 //클릭한 버튼의 Eventpic_num의 속성값을 읽음
	 var num = $(this).attr('data-num');
	 
	 //서버로 삭제할 글번호를 전달 
		$.ajax({
			url: 'deleteFile',
			type: 'POST',
			data: {"eventpic_num" : num},
			success: function(cnt) {
				if (cnt == 0) {
					alert('삭제 실패');
				}
				else {
					alert('삭제되었습니다.');
				}
			}
		});
 }
</script>

<style type="text/css">
.centerdiv {
	text-align: center;
}

table {
	margin: auto;
	background-color: #E6E6E6;
}

th, td {
	border: 1px solid;
	border-color: white;
}

td {
	text-align: left;
}
</style>
</head>

<body>

	<div class="centerdiv">
		<h1>[이벤트 수정]</h1>
		<form action="edit" method="post" enctype="multipart/form-data" 
		      onsubmit="return formCheck()">
			<input type="hidden" name="event_num" value="${event.event_num}">
			<table>
				<tr>
					<th>제목</th>
					<td><input type="text" value=${event.event_title}
						id="event_title" name="event_title"></td>
				</tr>

				<tr>
					<th>작성자</th>
					<td><input type="text" value=${event.admin_id}
				           id="admin_id" name="admin_id" disabled></td>
				</tr>

                 <tr>
                     <th>이벤트 시작일</th>
                     <td><input type="text" value=${event.event_startdate} 
                           name="event_startdate" id="event_startdate">
                     <b>종료일</b><input type="text" value=${event.event_enddate} 
                           name="event_enddate" id="event_enddate"></td> 
                 </tr>

				<tr>
					<th>상태</th>
					<td><input type="text"  value=${event.event_state}
					     name="event_state" id="event_state"></td>
				</tr>

				<tr>
					<th>내용</th>
					<td><textarea rows="15" cols="70" id="event_content"
							name="event_content">${event.event_content}</textarea></td>
				</tr>
                
                  <!-- 기존에 업로드된 파일과 이미지 불러오기 -->
				<tr>
					<th>기존의 이미지</th>
					<td>
					  <c:forEach var="pic" items="${picList}">
					    <img style="width:100px; height:100px;" 
					          src="download?eventpic_num=${pic.eventpic_num}">
					    <a href="download?eventpic_num=${pic.eventpic_num}">
					    ${pic.savedfile} 
					    </a>
					    <input type="button" id="deletebtn" data-num="${pic.eventpic_num}" value="X">     
					  </c:forEach>
					</td>
				</tr>
				
				<tr>
					<th>새파일첨부</th>
					<td>
						<button id="addbtn" type="button">파일 추가</button>
						<div id="group"></div>
					</td>
				</tr>
			</table>
			<br> <input type="submit" value="수정">
		</form>
	</div>

</body>
</html>