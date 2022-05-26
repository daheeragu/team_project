<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글읽기</title>
<link rel="stylesheet" type="text/css" href="../resources/css/default.css"/>

<script>
  function deleteInfo(info_num){
	  if(confirm('정말 삭제하시겠습니까?')){
		  location.href = 'delete?info_num=' + info_num;
	  }
  }  
</script>

<style>
  table {
     margin: auto; 
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
<h2>[여행정보 글읽기]</h2>

<table>
 <colgroup>
    <col style="background-color:#BDBDBD;">
    <col style="background-color:#EAEAEA;">
 </colgroup>
  <tr>
   <th style="width:100px;">작성자</th>
   <td style="width:500px;">${info.admin_id}</td>
  </tr>
  
  <tr>
   <th>작성일</th>
   <td>${info.info_inputdate}</td>
  </tr>
  
  <tr>
   <th>조회수</th>
   <td>${info.info_hits}</td>
  </tr>
  
  <tr>
   <th>제목</th>
   <td>${info.info_title}</td>
  </tr>
  
  <tr>
   <th>내용</th>
   <td style="font-size:15px;"><pre>${info.info_contents}</pre></td>
  </tr>
  
</table>

<!-- 본인 글 수정/삭제 : 출력하고 있는 id와 세션에 저장된 id가 같아야 함-->
<c:if test="${sessionScope.loginId == info.admin_id}">
<a href="edit?boardnum=${info.info_num}">수정</a>
<a href="javascript:deleteBoard(${info.info_num})">삭제</a>
       <!-- 자바스크립트로 보냄  -->
</c:if>

<!-- 목록보기 -->
<a href="list">목록보기</a><br>
 
</div> 
</body>
</html>