<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀팁 | 공지 | BUSANONNA </title>
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
<h1>공지사항 등록</h1>
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
    <td><input type="text" name="notice_title" id="notice_title"></td> 
  </tr>
  
  <tr>
    <th>내용</th>
    <td><textarea rows="15" cols="70" name="notice_content" 
                  id="notice_content" style="resize:none;"></textarea> 
  </tr>
  
  <tr>
   <th>파일첨부</th> 
	<td>
		<input type="file" name="upload" size="30">
		<input type="file" name="upload" size="30">
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