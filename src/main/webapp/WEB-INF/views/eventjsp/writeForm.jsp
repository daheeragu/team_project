<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀팁 | 이벤트 | BUSANONNA</title>

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
  * {
       margin: auto; 
   }
   
   h1 {
     text-align : center; 
   }
   
   th, td{
    border: 1px solid; 
    border-color: white;
   }
   
   #save td{
     text-align : center;
     background-color: white ! important; 
   }
   
   </style>
</head>
<body>

<h1>[이벤트 등록]</h1>
                                                   <!-- 파일 보낼 때 꼭 필요 -->
<form id="writeForm" action = "write" method ="post" enctype="multipart/form-data"
      onsubmit="return formCheck();">
<table>
    <colgroup>
      <col style="background-color:#BDBDBD;">
      <col style="background-color:#EAEAEA;">
    </colgroup>
  <tr>
    <th>제목</th>
    <td><input type="text" name="event_title" id="event_title"></td> 
  </tr>
  
  <tr>
    <th>작성자</th>
    <td><input type="text" name="admin_id" id="admin_id"
         value="${admin_id}" disabled></td> 
  </tr>
  
  <tr>
    <th>이벤트 시작일</th>
    <td><input type="text" name="event_startdate" id="event_startdate">
    <b>종료일</b><input type="text" name="event_enddate" id="event_enddate"></td> 
  </tr>
  
  <tr>
   <th>상태</th>
   <td><input type="text" name="event_state" id="event_state"></td>
  </tr>
   
  <tr>
    <th>내용</th>
    <td>
    <textarea name="event_content" id="event_content"></textarea>  
    
     <script>
	                CKEDITOR.replace('event_content'
	                		, {filebrowserUploadUrl:'imageUpload.do'
	                	//	, extraPlugins:'imagebase'
	                		, extraPlugins:'image2'
	                		, height:'600px'
	                				});
	  </script>
    </td>
  </tr>
  
  <tr>
   <th>파일첨부</th> 
	<td>
	    <button id="addbtn" type="button">파일 추가</button>	
		<div id="group">
		</div>
	</td>
  </tr>
  
  <tr id="save">
    <td colspan ="2">
      <input type="submit" value="등록">
    </td>
  </tr>
</table>

</form>
</body>
</html>