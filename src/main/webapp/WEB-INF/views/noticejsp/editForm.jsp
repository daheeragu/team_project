<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀팁 | 공지 | BUSANONNA </title>

<script type="text/javascript" src="../resources/js/jquery-3.6.0.js"></script>
<script src = "../resources/ckeditor/ckeditor.js"></script>

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
		 //클릭한 버튼의 Noticepic_num의 속성값을 읽음
		 var num = $(this).attr('data-num');
		 
		 //서버로 삭제할 글번호를 전달 
			$.ajax({
				url: 'deleteFile',
				type: 'POST',
				data: {"noticepic_num" : num},
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
 <style>
 
 .centerdiv{
   text-align: center;
 }
 table{
   margin: auto;
   background-color: #E6E6E6;
  }
  
  th, td{
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
<h1>[공지사항 수정]</h1>
	<form action="edit" method="post" onsubmit="return formCheck()">
	<input type="hidden" name="notice_num" value="${notice.notice_num}">
		<table>
			<tr>
			    <th>제목</th>
				<td><input type="text" value=${notice.notice_title} 
				           id ="notice_title" name="notice_title"></td>
			</tr>

            <tr>
               <th>내용</th>
               <td><textarea id="notice_content" name="notice_content">
               ${notice.notice_content}</textarea>
               
                <script>
	                        CKEDITOR.replace('notice_content'
	                		, {filebrowserUploadUrl:'imageUpload.do'
	                	//	, extraPlugins:'imagebase'
	                		, extraPlugins:'image2'
	                		, height:'600px'
	                				});
	            </script>
	            </td>
            </tr>
            <tr>
				<th>기존의 이미지</th>
					<td>
					  <c:forEach var="pic" items="${picList}">
								<img style="width: 100px; height: 100px;"
									src="download?noticepic_num=${pic.noticepic_num}">
								<a href="download?noticepic_num=${pic.noticepic_num}">
									${pic.savedfile} </a>
								<input type="button" id="deletebtn"
									data-num="${pic.noticepic_num}" value="X">
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
		<br>
		<input type="submit" value="수정">
      </form>
  </div>
  
</body>
</html>