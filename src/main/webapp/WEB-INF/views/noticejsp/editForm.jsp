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
	  
  });
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