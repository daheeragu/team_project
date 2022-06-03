<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행정보 글 수정</title>

<script type="text/javascript" src="../resources/js/jquery-3.6.0.js"></script>
<script src = "../ckeditor/ckeditor.js"></script>

<script type="text/javascript">
  $(document).ready(function(){
	//삭제 버튼에 클릭이벤트 처리
	 $('#deletebtn').on('click', fileDelete);  
  });
  
 function fileDelete(){
	 //클릭한 버튼의 info_num의 속성값을 읽음
	 var num = $(this).attr('data-num');
	 
	 //서버로 삭제할 글번호를 전달 
		$.ajax({
			url: 'deleteFile',
			type: 'POST',
			data: {"info_num" : num},
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
</head>
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


<body>
<h1>[여행정보 글 수정]</h1>
                                                   <!-- 파일 보낼 때 꼭 필요 -->
<form id="editForm" action = "edit" method ="post" enctype="multipart/form-data"
      onsubmit="return formCheck();">
<table style="width:90%">
    <colgroup>
      <col style="background-color:#BDBDBD;">
      <col style="background-color:#EAEAEA;">
    </colgroup>
    <tr>
	    <th>글번호</th>
	    <td><input style="width:200px" type="number" name="info_num" id="num" value="${info.info_num}" readonly></td> 
	  </tr>
    
	  <tr>
	    <th>제목</th>
	    <td><input style="width:500px" type="text" name="info_title" id="title" value="${info.info_title}"></td> 
	  </tr>
	  
	   <tr>
	    <th>작성자</th>
	    <td><input type="text" name="admin_id" value="${info.admin_id}" readonly></td> 
	  </tr>
	  
	  <tr>
	    <th>부제목</th>
	    <td><input style="width:500px" type="text" name="info_subtitle" id="subtitle" value="${info.info_subtitle}"></td> 
	  </tr>
	  
	   <tr>
	 	 <th>이름</th>
	 	 <td><input style="width:200px" type="text" name="info_name" id="name" value="${info.info_name}"></td>
		</tr>
		<tr>
	     <th>구역(구)</th>
	   	 <td><input style="width:200px" type="text" name="info_gu" id="gu" value="${info.info_gu}"></td>
	  </tr>
	  
	   <tr>
	    <th>상세주소</th>
	    <td><input style="width:300px" type="text" name="info_address" id="address" value="${info.info_address}"></td> 
	  </tr>
	  <tr>
	  	<th>운영현황</th>
	  	<td>
	  		<input type="radio" name="info_state" value="available" checked> 이용가능
	  		<input type="radio" name="info_state" value="unavailable"> 이용불가
	  	</td>
	  </tr>
	  
	  <tr>
	 	 <th>글쓰기</th>
		  <td>
		 <textarea id="editor" name="info_content">${info.info_content}</textarea>
	            <script>
	                CKEDITOR.replace('editor'
	                		, {filebrowserUploadUrl:'imageUpload.do'
	                		, extraPlugins:'image2'
	                		, height:'600px'
	                		});
	            </script>
		  </td>
	  </tr>
	  
	  <!-- 기존에 업로드한 이미지 파일 불러오기 -->
	  <tr>
	  	<th>썸네일 이미지 첨부</th>
	  	<td>
	  		<img style="width: 100px; height: 100px;"
				src="download?info_num=${info.info_num}">
	  		<a href="download?info_num=${info.info_num}">
	  			${info.savedfile} </a>
			<input type="button" id="deletebtn"
				data-num="${info.info_num}" value="X">
	  		
	  		<input type="file" name="upload" size="30" value="이미지 업로드">
	  	</td>	
	  </tr>
	
	  <tr id="save">
	    <td colspan ="2">
	      <input type="submit" value="저장"> <button type="button" onClick="location.href='${info.info_theme}'">취소</button>
	    </td>
	  </tr>
</table>

</form>
</body>
</html>