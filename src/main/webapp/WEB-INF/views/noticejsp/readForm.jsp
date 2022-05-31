<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
   
    <title>꿀팁 | 공지 | BUSANONNA </title>
   

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">

    

    <!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="https://getbootstrap.com/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<script type="text/javascript" src="../resources/js/jquery-3.6.0.js"></script>
<script>
  
  $(document).ready(function(){
	    $('#updatebtn').on('click', updateNotice);
	    $('#deletebtn').on('click', deleteNotice);
	    $('#golistbtn').on('click', returnList);
	    
	  }); 
	  
  function updateNotice(){
	  location.href='edit?notice_num=${notice.notice_num}';	  
  }
  
  function deleteNotice(){
	  if(confirm('정말 삭제하시겠습니까?')){
	  location.href='delete?notice_num=${notice.notice_num}';
     }
  }
  function returnList(){
    	location.href = 'list';
    }  
  
  function backpage(){
		window.location = "../user/logout";
		location.href = "../notice/readForm";
	}
  </script>
 
  <style>
   
   table{
     margin: auto; 
   }
   
 
   tr{
    border: 1px solid;
    border-color: #BDBDBD;
   }
   
   .notice-content{
    margin-top: 50px;
    margin-left: 150px;
    width: 80%;
   }
   
   .subvis {
	width: 100%;
	height: 300px;
	background-image: url('../resources/image/sunset.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: scroll;
     }

 h1 {
	text-align: center;
	font-family:'Black Han Sans', sans-serif;
	color: white;
	margin: auto;
	top: 100px;
	position: relative;
	top: 45%
   }
   
</style>

    
    <!-- Custom styles for this template -->
    <link href="../resources/css/carousel.css" rel="stylesheet">
  </head>
  <body>
    
<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="../">BUSAN</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
					aria-controls="navbarCollapse" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<ul class="navbar-nav me-auto mb-2 mb-md-0">
						<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								여행지 </a>
								
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="../tourinfo/spot">명소</a></li>
								<li><a class="dropdown-item" href="../tourinfo/food">먹거리</a></li>
								<li><a class="dropdown-item" href="../tourinfo/leisure">레저</a></li>
								<li><a class="dropdown-item" href="../tourinfo/experience">체험</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="../notice/recommend">내주변</a></li>
							</ul>
						</li>
						<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								회원마당 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#">리뷰</a></li>
								<li><a class="dropdown-item" href="#">질문과 답변</a></li>
							</ul>
						</li>
						
						<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								꿀팁 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="../notice/list">공지</a></li>
								<li><a class="dropdown-item" href="../event/list">이벤트</a></li>
							</ul>
						</li>
				
						</ul>
					   
					 <div class="collapse navbar-collapse justify-content-end"
						id="navbarNav-menu">
						<ul class="navbar-nav text-center">
							<c:if test="${loginId == null && loginAdmin == null}">
								<li class="nav-item"><a class="nav-link active" aria-current="page" href="../user/loginForm">로그인</a></li>
								<li class="nav-item"><a class="nav-link" href="../user/joinForm">회원가입</a></li>
							</c:if>
							<c:if test="${loginId != null}">
								<li class="nav-item"><a class="nav-link">${loginName}님</a>
								</li>
								<li class="nav-item"><a class="nav-link" 
								href="#" onclick = "backpage()">로그아웃</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="../user/mypage">마이페이지</a>
								</li>
							</c:if>
							<c:if test="${loginAdmin != null}">
								<li class="nav-item"><a class="nav-link">${loginName}님</a>
								</li>
								<li class="nav-item"><a class="nav-link" 
								href="#" onclick = "backpage()">로그아웃</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="../user/mypage">마이페이지</a>
								</li>
							</c:if>
						</ul>
				    
					<form class="d-flex">
							<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
			</div>
		</nav>
	</header>

<main>

 <div class="subvis">
    <h1>공지사항</h1>
 </div>

<br><br>

<div class="notice-content">
<table class="table">
    <tr>
     <th scope="row" style="width:100px; text-align:center;">제목</th>
     <td style="width:800px">${notice.notice_title}</td>
    </tr>
    
    <tr>
     <th scope="row" style="width:100px; text-align:center;">작성자</th>
     <td style="width:800px">${notice.admin_id}</td>
    </tr>
    
    <tr>
     <td scope="row" colspan="2">
        ${notice.notice_content}
     <c:forEach var="pic" items="${picList}">
        <img src = "download?noticepic_num=${pic.noticepic_num}"> 
      </c:forEach></td>
    </tr>

				<tr id="return" style="border: white; text-align: right;">
					<td colspan="2">
						<button type="button" class="btn btn-outline-secondary"
							id="updatebtn">수정</button> &nbsp;
						<button type="button" class="btn btn-outline-secondary"
							id="deletebtn">삭제</button> &nbsp;
						<button type="button" class="btn btn-outline-secondary"
							id="golistbtn">목록</button>
					</td>
				</tr>

			</table>

</div>


<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</main>

</html>