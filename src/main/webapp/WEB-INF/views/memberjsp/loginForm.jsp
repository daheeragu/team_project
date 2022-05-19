<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<style>
  
  * {
		margin: auto;
	}
	
  h1{
    text-align: center;
    }
   
  th, td {
     border: 1px solid;
     border-color: white; 
     background-color: #EAEAEA;
   }
   
   #login td {
     text-align: center;
     background-color: white ! important;
   }
 
</style>
<body>
<h1>[로그인]</h1>
<br>
<form id="loginForm" action ="login" method="post">
 <table>
    <tr>
     <th>ID</th>
     <td><input type="text" name="id" id="id"></td>
     </tr>
     
     <tr>
      <th>PW</th>
      <td><input type="password" name="password"
                 id="password"></td>
     </tr>
     
     <tr id="login">
       <td colspan = "2">
          <input type="submit" value="로그인">
        </td>
     </tr>

 </table>
</form>

</body>
</html>