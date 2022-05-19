<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 정보 수정</title>
</head>
<script type="text/javascript">
 function formCheck(){
	
	 let pw = document.getElementById('pw');
	 let checkPw = document.getElementById('checkPw');
	 
	 if(pw.value != checkPw.value){
		 alert('비밀번호가 일치하지 않습니다.');
		 return false; 
	 }
	 
 }
</script>
<body>
<h1>[개인 정보 수정]</h1>
	<form action="update" method="post" onsubmit="return formCheck()">
		<table class="table">
			<colgroup>
				<col span="1" style="background-color: gray">
				<col span="2" style="background-color: #E6E6E6">
			</colgroup>
			<tr>
				<th>ID</th>
				<td>${member.id}</td>
			</tr>

			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="pw" name="password" placeholder="비밀번호 입력" required><br> 
				<input type="password" id="checkPw"placeholder="비밀번호 다시 입력" required></td>
			</tr>

			<tr>
				<th>이름</th>
				<td><input type="text" value="${member.name}" id="name" name="name"></td>
			</tr>

			<tr>
				<th>전화번호</th>
				<td><input type="text" value="${member.phone}" id="phone" name="phone"></td>
			</tr>

			<tr>
				<th>주소</th>
				<td><input type="text" value="${member.address}" id="address" name="address" size="40"></td>
			</tr>

			<tr>
				<th>이메일</th>
				<td><input type="text" value="${member.email}" id="email" name="email" ></td>
			</tr>
		</table>

		<br> 

		  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		     <input type="submit" value="수정"> &nbsp; 
		     <input type="reset" value="다시 쓰기">
	    
	</form>

</body>
</html>