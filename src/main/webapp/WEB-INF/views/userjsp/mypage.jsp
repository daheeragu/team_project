<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.98.0">
<title>회원가입</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#back').on('click', backHome);
	$('#updateForm').on('click', updateForm);
	
});

function update(){
	alert('수정이 완료 되었습니다.');
	$('#update').prop('type', 'submit');
}
function updateForm(){
	$('.readonly').attr('readonly', false);
	$('#updateForm').attr('id', 'update');
	$('#update').html('수정하기');
	$('#update').on('click', update);
//   $('#update').attr('type', 'submit');	
	
}

function backHome(){
	location.href = "../"

}
function formCheck(){
	let id = document.getElementById('floatingId');
	let pwd = document.getElementById('floatingPassword');
	let pwd2 = document.getElementById('floatingPassword2');
	let name = document.getElementById('floatingName');
	let email = document.getElementById('floatingEmail');
	
	if(id.value.length < 3 || id.value.length > 10){
		alert('아이디는 3자리 이상 10자리 이하로 입력해 주세요');
		return false;
	}
	
	if(pwd.value.length < 3 || pwd.value.length > 10){
		alert('비밀번호는 3자리 이상 10자리 이하로 입력해 주세요');
		return false;
	}
	
	if(pwd.value != pwd2.value){
		alert('비밀번호와 확인을 일치시켜 주세요');
		return false;
	}
	
	if(name.value.length < 1){
		  alert('이름을 입력해 주세요');
		  return false; 
	  } 
	
	if(email.value.length < 1){
		alert('email을 입력해 주세요');
		return false;
	}
	return true;
}
</script>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/sign-in/">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">

<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/5.2/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg"
	color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">

<style>
.form-floating {
	
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

.form-floating {
	width: 300px;
	margin: auto;
	text-align: center;
}

body {
	position: relative;
}
</style>
<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">
</head>
<body class="text-center">

	<main class="form-signin w-100 m-auto">
		<form action="update" method="post" onsubmit="return formCheck()">

			<h1 class="h3 mb-3 fw-normal">마이페이지</h1>
			<c:if test="${user != null}">
				<div class="form-floating">
					<p style="text-align: left;">아이디</p>
					<input type="text" class="form-control" name="user_id"
						id="floatingId" value="${user.user_id}" readonly="readonly">
				</div>
				<div class="form-floating">
					<p style="text-align: left;">비밀번호</p>
					<input type="password" class="form-control readonly"
						id="floatingPassword" name="user_password" readonly="readonly">
				</div>
				<div class="form-floating">
					<p style="text-align: left;">비밀번호 확인</p>
					<input type="password" class="form-control readonly"
						id="floatingPassword2" readonly="readonly">
				</div>
				<div class="form-floating">
					<p style="text-align: left;">이름</p>
					<input type="text" class="form-control readonly" id="floatingName"
						name="user_name" value="${user.user_name}" readonly="readonly">
				</div>
				<div class="form-floating">
					<p style="text-align: left;">이메일</p>
					<input type="email" class="form-control readonly"
						id="floatingEmail" name="user_email" value="${user.user_email}"
						readonly="readonly">
				</div>
			</c:if>
			<c:if test="${admin != null}">
				<div class="form-floating">
					<p style="text-align: left;">아이디</p>
					<div class="form-floating">
						<input type="text" class="form-control readonly"
							name="admin_password" id="floatingId" value="${admin.admin_id}"
							readonly="readonly">
					</div>
					<div class="form-floating">
						<p style="text-align: left;">비밀번호</p>
						<input type="password" class="form-control readonly"
							id="floatingPassword" name="admin_password" readonly="readonly">
					</div>
					<div class="form-floating">
						<p style="text-align: left;">비밀번호 확인</p>
						<input type="password" class="form-control readonly"
							id="floatingPassword2" readonly="readonly">
					</div>
					<div class="form-floating">
						<p style="text-align: left;">이름</p>
						<input type="text" class="form-control readonly" id="floatingName"
							name="admin_name" value="${admin.admin_name}" readonly="readonly">
					</div>
					<div class="form-floating">
						<p style="text-align: left;">이메일</p>
						<input type="email" class="form-control readonly"
							id="floatingEmail" name="admin_email"
							value="${admin.admin_email}" readonly="readonly">
					</div>
			</c:if>
			<button type="button" class="btn btn-primary" id="updateForm">정보
				수정</button>
			<button type="reset" class="btn btn-secondary">다시 입력</button>
			<button type="button" class="btn btn-success" id="back">홈 화면</button>
		</form>
	</main>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>