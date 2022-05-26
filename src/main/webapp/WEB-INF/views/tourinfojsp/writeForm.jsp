<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행정보 글쓰기</title>
<script src="../resources/js/ckeditor/ckeditor.js"></script>
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
<h1>[여행정보 글쓰기]</h1>
                                                   <!-- 파일 보낼 때 꼭 필요 -->
<form id="writeForm" action = "write" method ="post" enctype="multipart/form-data"
      onsubmit="return formCheck();">
<table style="width:70%">
    <colgroup>
      <col style="background-color:#BDBDBD;">
      <col style="background-color:#EAEAEA;">
    </colgroup>
  <tr>
    <th>제목</th>
    <td><input style="width:500px" type="text" name="info_title" id="title"></td> 
  </tr>
  
  <tr>
    <th>부제목</th>
    <td><input style="width:500px" type="text" name="info_subtitle" id="subtitle"></td> 
  </tr>
  
   <tr>
 	 <th>이름</th>
 	 <td><input style="width:200px" type="text" name="info_name" id="name"></td>
	</tr>
	<tr>
     <th>구역(구)</th>
   	 <td><input style="width:200px" type="text" name="info_gu" id="gu"></td>
  </tr>
  
   <tr>
    <th>상세주소</th>
    <td><input style="width:300px" type="text" name="info_address" id="address"></td> 
  </tr>
  <tr>
  	<th>운영현황</th>
  	<td>
  		<input type="radio" name="state" value="avaliable" checked> 이용가능
  		<input type="radio" name="state" value="unavaliable"> 이용불가
  	</td>
  </tr>
  
  <tr>
 	 <th>글쓰기</th>
	  <td>
	 <textarea id="description"></textarea>
            <script>
                CKEDITOR.replace( 'description');
            </script>
	  </td>
  </tr>

  
 	
  
  <tr id="save">
    <td colspan ="2">
      <input type="submit" value="저장">
    </td>
  </tr>
</table>

</form>
</body>
</html>