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
<title>로그인</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script type="text/javascript">
$(document).ready(function(){
	$('#back').on('click', backHome);
	$('#submit').on('click', submit);
});

function backHome(){
	location.href = "../"
}

function submit() {
	var submit = $('submit').val();
	
	//서버로 삭제할 글번호를 전달.
 	
}

function formCheck(){
	let id = document.getElementById('#floatingInput');
	let pwd = document.getElementById('#floatingPassword');
	let id1 = $('#floatingInput').val();
	let pwd1 = $('#floatingPassword').val();		
	
	$.ajax({
		url: 'select',
		type: 'POST',
		data: { "id" : id1, "pwd": pwd1},
		success: function(cnt) {
			if (cnt == 1) {
				alert(id1 + '님, 로그인에 성공하였습니다');
			} else if (cnt == 2){
				alert('관리자님, 로그인에 성공하였습니다');
			}else {
				alert('아이디나 비밀번호가 일치하지 않습니다');
			}
		}
	});

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
.swal-title {
	margin: 0px;
	font-size: 16px;
	box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.21);
	margin-bottom: 28px;
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
	top: 150px;
}

button {
	width: 200px;
	margin: auto;
}
</style>
<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">
</head>
<body class="text-center">

	<main class="form-signin w-100 m-auto">
		<form action="login" method="post" onsubmit="return formCheck()">

			<h1 class="h3 mb-3 fw-normal">정보이외의 컨텐츠를 이용하시려면 로그인을 해 주세요</h1>

			<div class="form-floating">
				<input type="text" class="form-control" value="${id}" name="id"
					id="floatingInput" placeholder="아이디"> <label
					for="floatingInput">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword"
					name="password" placeholder="비밀번호"> <label
					for="floatingPassword">비밀번호</label>

			</div>

			<div class="checkbox mb-3">
				<label> <input type="checkbox" value="remember"
					name="remember" id="remember" checked="checked"> 아이디 기억하기
				</label>
			</div>
			<button type="submit" class="btn btn-primary" id="submit">로그인</button>
			<button type="button" id="back" class="btn btn-success">홈 화면</button>
		</form>
	</main>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>