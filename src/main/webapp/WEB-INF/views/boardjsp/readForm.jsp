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
  function deleteBoard(num){
	  if(confirm('정말 삭제하시겠습니까?')){
		  location.href = 'delete?boardnum=' + num;
	  }
  }  
 
  function deleteReply(replynum, boardnum){
	  if(confirm('정말 삭제하시겠습니까?')){
		  location.href = 'deleteReply?replynum=' + replynum + '&boardnum=' + boardnum;
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
<h2>[게시판 글읽기]</h2>

<table>
 <colgroup>
    <col style="background-color:#BDBDBD;">
    <col style="background-color:#EAEAEA;">
 </colgroup>
  <tr>
   <th style="width:100px;">작성자</th>
   <td style="width:500px;">${board.id}</td>
  </tr>
  
  <tr>
   <th>작성일</th>
   <td>${board.inputdate}</td>
  </tr>
  
  <tr>
   <th>조회수</th>
   <td>${board.hits}</td>
  </tr>
  
  <tr>
   <th>제목</th>
   <td>${board.title}</td>
  </tr>
  
  <tr>
   <th>내용</th>
   <td style="font-size:15px;"><pre>${board.contents}</pre></td>
  </tr>
  
  <tr>
   <th>파일첨부</th>
   <td>
       <a href="download?boardnum=${board.boardnum}">${board.originalfile}</a>
   </td>
  </tr> 
</table>

<!-- 본인 글 수정/삭제 : 출력하고 있는 id와 세션에 저장된 id가 같아야 함-->
<c:if test="${sessionScope.loginId == board.id}">
<a href="edit?boardnum=${board.boardnum}">수정</a>
<a href="javascript:deleteBoard(${board.boardnum})">삭제</a>
       <!-- 자바스크립트로 보냄  -->
</c:if>

<!-- 목록보기 -->
<a href="list">목록보기</a><br>

<!-- 리플 작성 폼 -->
<c:if test="${sessionScope.loginId != null}">
<form action ="replyWrite" method="post" onsubmit="return replyFormCheck();">
리플 내용 
    <input type="hidden" name="boardnum" value="${board.boardnum}">
    <input type="text" name="text" style="width:500px;">
    <input type="submit" value="확인"> 
</form>
</c:if>
<!-- 리플 작성 폼 끝 -->
<br>

<!-- 리플 목록 출력 시작 -->
<c:forEach var="reply" items="${replyList}">
<table>
<colgroup>
    <col style="background-color:#BDBDBD;">
    <col span="3" style="background-color:#EAEAEA;">
 </colgroup>
 <tr>
  <th style="width:70px">${reply.id}</th>
  <td style="width:300px">${reply.text}</td>
 
 <!-- 글 작성자와 로그인 아이디가 같은 경우 수정/삭제 버튼 보이게 하기 --> 

     <c:if test="${loginId == reply.id}">
        <td style="width:70px">
	       [<a href="javascript:deleteReply(${reply.replynum}, ${reply.boardnum })">삭제</a>]
	     </td>
	     <td style="width:70px">
	       [수정]
	     </td>
	   </c:if>
     <c:if test="${loginId != reply.id}">
       <td style="width:70px"></td>
       <td style="width:70px"></td>
     </c:if>
             
 </tr>
</table>
</c:forEach>
</div> 
</body>
</html>