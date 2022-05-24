<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀팁 | 공지 | BUSANONNA </title>
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
               <td><textarea rows="15" cols="70" 
                             id="notice_content" name="notice_content">${notice.notice_content}</textarea></td>
            </tr>
            
            <tr>
            <th>파일첨부</th>
            <td><input type="file" name="upload" size="30">
		        <input type="file" name="upload" size="30">
		     </td>
            </tr>         
		</table>
		<br>
		<input type="submit" value="수정">
      </form>
  </div>
  
</body>
</html>