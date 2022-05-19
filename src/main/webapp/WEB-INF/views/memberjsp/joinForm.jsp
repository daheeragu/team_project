<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<style type="text/css">
  h1 {
     text-align : center; 
     }
  
  .table{
     margin : auto;
  }
  
  .button{
    background-color: white;
    text-align: center; 
    padding-top: 10px;
  }
  
</style>
<script type="text/javascript">
  
  function formCheck(){
     /*ID*/
	  let id = document.getElementById('id'); 
     if(id.value.length < 3 || id.value.length > 10) {
    	 alert('ID는 3~10자로 입력하세요.');
         return false; 
     }
	 /*비밀번호*/
	  let pw = document.getElementById('pw');
	  if(pw.value.length < 3 || pw.value.length > 10){
		  alert('PW는 3~10자로 입력하세요.');
		  return false; 
	  }
	  /*비밀번호 확인*/
	  let checkPw = document.getElementById('checkPw');
	  if(pw.value != checkPw.value){
		  alert('비밀번호가 서로 일치하지 않습니다.');
		  return false; 
	  }
	  
	  /*이름 */
	  /*if(name.value == '') 이것도 가능 */
	  let name = document.getElementById('name');
	  if(name.value.length < 1){
		  alert('이름은 필수 입력 사항입니다.');
		  return false; 
	  } 
  }
  
  function idcheckOpen(){
	  window.open('idcheck','win','top=300, left=500, width=400, height=300, location=no, status=no'); //새 창이 열림 
	            //창이 열릴 주소(경로) // 창의 이름(하나만 존재할 수 있음) // 창의 옵션
	            //MemberController의 get방식과 연결 
  }
</script>	
</head>
<body>

	<h1>[회원가입]</h1>
	<form action="join" method="post" onsubmit="return formCheck()">
		<table class="table">
			<colgroup>
				<col span="1" style="background-color: gray">
				<col span="2" style="background-color: #E6E6E6">
			</colgroup>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" id="id" 
				            placeholder="ID중복확인 이용"  readonly="readonly" required> 
				<input type="button" value="ID 중복확인" onclick="idcheckOpen()"></td>
			</tr>

			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="pw" name="password" placeholder="비밀번호 입력" required><br> 
				<input type="password" id="checkPw"placeholder="비밀번호 다시 입력" required></td>
			</tr>

			<tr>
				<th>이름</th>
				<td><input type="text" id="name" name="name" placeholder="이름 입력"></td>
			</tr>

			<tr>
				<th>전화번호</th>
				<td><input type="text" id="phone" name="phone" placeholder="전화번호 입력"></td>
			</tr>

			<tr>
				<th>주소</th>
				<td><input type="text" id="address" name="address" size="40" placeholder="주소 입력"></td>
			</tr>

			<tr>
				<th>이메일</th>
				<td><input type="text" id="email" name="email" placeholder="이메일 입력"></td>
			</tr>
			
			<tr>
			  <td colspan="2" class="button">
			  <input type="submit" value="가입"> &nbsp; 
		      <input type="reset" value="다시 쓰기">
			  </td>
			</tr>
		</table>
    
	</form>

</body>
</html>