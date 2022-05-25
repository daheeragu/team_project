<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/default.css"/>
<style>
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
<h1>[글 수정]</h1>
	<form action="edit" method="post" onsubmit="return formCheck()">
	<input type="hidden" name="boardnum" value="${board.boardnum}">
		<table>
			<tr>
			    <th>제목</th>
				<td><input type="text" value=${board.title} 
				           id ="title" name="title"></td>
			</tr>

            <tr>
               <th>내용</th>
               <td><textarea rows="15" cols="70" 
                             id="contents" name="contents">${board.contents}</textarea></td>
            </tr>
            
            <tr>
            <th>파일첨부</th>
            <td><input type="button" value="파일 선택">
                                 선택된 파일 없음</td>
            </tr>
		</table>
     <br>
	 <input type="submit" value="수정">
     </form>
  </div>
</body>
</html>