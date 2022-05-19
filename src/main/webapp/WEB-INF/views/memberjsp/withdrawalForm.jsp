<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet" type="text/css" href="../resources/css/default.css"/>
<script>
  function formCheck(){
	  confirm('정말 탈퇴하시겠습니까?');
  }
</script>
</head>

<body>
<div class="centerdiv">
   <h1>[회원 탈퇴]</h1>
  <form action="withdrawal" method="post" onsubmit="return formCheck()" >
  <input type="hidden" name="id" id="id">
       비밀번호 : <input type="password" name="password">
            <input type="submit" value="확인">
  </form>     
</div>
</body>
</html>