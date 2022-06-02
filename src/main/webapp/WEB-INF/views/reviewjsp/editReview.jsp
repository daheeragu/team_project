<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/default.css"/>
<script src = "../resources/ckeditor/ckeditor.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

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
	<input type="hidden" name="review_num" value="${review.review_num}">
	<input type="hidden" name="info_num" value="${review.info_num}">
		<table>
			<tr>
			    <th>제목</th>
				<td><input type="text" value="${review.review_title}" 
				           id ="title" name="review_title"></td>
			</tr>

            <tr>
    <th>내용</th>
      <td>
		 <textarea id="editor" name="review_content">${review.review_content}</textarea>
	            <script>
	                CKEDITOR.replace('editor'
	                		, {filebrowserUploadUrl:'imageUpload.do'
	                		, extraPlugins:'image2'
	                		, height:'600px'
	                				});
	            </script>
		  </td>
  </tr>
  
  <tr id="save">
	    <td colspan ="2">
	      <input type="submit" value="등록">
	    </td>
	  </tr>
		</table>
   
     </form>
  </div>
</body>
</html>