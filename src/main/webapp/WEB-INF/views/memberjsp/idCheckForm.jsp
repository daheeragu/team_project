<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복확인</title>
</head>


<script>
  function formCheck(){
	  let id = document.getElementById('searchId');
	  if(id.value == ''){
		  alert('검색할 ID를 입력하세요.');
		  return false; 
	  }
	   
	  return true;   
  }
  
  function selectid(){
	//회원가입창의 아이디 값에 searchId값을 넣어줌
	  opener.document.getElementById('id').value = '${searchId}';
	//현재 창을 닫음 
	  this.close();
  }
  
</script>
 <body>
<div class="centered">

<h1>[ID 중복확인]</h1>
<form action = "idcheck" method="post" onsubmit="return formCheck()">
검색할 ID <input type="text" name="searchId" id="searchId"/> 
         　    <input type="submit" value="검색"/>
</form>

<!-- 검색 후 -->
<c:if test="${searchId != null}">
  <!-- 검색결과가 없음  -->
   <c:if test ="${member == null}">
      <p>${searchId}는 사용할 수 있는 아이디입니다.</p>
      <p><input type="button" value="ID사용하기" onclick="selectid()"></p>
   </c:if>
  <!-- 검색결과가 있음  -->
  <c:if test="${member != null}">
       <p> ${searchId}는 이미 사용중인 아이디입니다.</p>
  </c:if>
</c:if>
</div>

</body>
</html>