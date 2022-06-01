<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행정보 글 등록</title>
<script src = "../resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">

  $(document).ready(function(){
	//추가 버튼 이벤트 처리
	 $('#addbtn').on('click', function(){
		  $('#group').append('<input type="file" class="file_group" name="upload" size="30"><br>'); 
	  });
	  
  });
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
<h1>[여행정보 글 등록]</h1>
                                                   <!-- 파일 보낼 때 꼭 필요 -->
<form id="writeForm" action = "write" method ="post" enctype="multipart/form-data"
      onsubmit="return formCheck();">
<table style="width:90%">
    <colgroup>
      <col style="background-color:#BDBDBD;">
      <col style="background-color:#EAEAEA;">
    </colgroup>
    
	  <tr>
	    <th>제목</th>
	    <td><input style="width:500px" type="text" name="info_title" id="title" value="${info.info_title}"></td> 
	  </tr>
	  
	  <tr>
	    <th>부제</th>
	    <td><input style="width:500px" type="text" name="info_subtitle" id="subtitle" value="${info.info_subtitle}"></td> 
	  </tr>
	  
	   <tr>
	 	 <th>이름</th>
	 	 <td><input style="width:200px" type="text" name="info_name" id="name"></td>
		</tr>
		<tr>
			<th>여행 테마</th>
			<td>
				<input type="radio" name="info_theme" value="spot" checked> 명소
	  			<input type="radio" name="info_theme" value="food"> 먹거리
	  			<input type="radio" name="info_theme" value="leisure"> 레저
	  			<input type="radio" name="info_theme" value="experience"> 체험
	  		</td>
		</tr>
		<tr>
	     <th>구역(구)</th>
	   	 <td><input style="width:200px" type="text" name="info_gu" id="gu""></td>
	  </tr>
	  
	   <tr>
	    <th>상세주소</th>
	    <td><input style="width:300px" type="text" name="info_address" id="address"></td> 
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
		 <textarea id="editor" name="info_content"></textarea>
	            <script>
	                CKEDITOR.replace('editor'
	                		, {filebrowserUploadUrl:'imageUpload.do'
	                		, extraPlugins:'image2'
	                		, height:'600px'
	                				});
	            </script>
		  </td>
	  </tr>
	  
	  <tr>
	  	<th>썸네일 이미지 첨부</th>
	  	<td>
	  		<input type="file" name="upload" size="30" value="이미지 업로드">
	  		<div id="group"></div>
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