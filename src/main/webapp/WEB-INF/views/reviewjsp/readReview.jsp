<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
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
<script type="text/javascript">
//게시글 삭제
function deleteReview(num){
	if(confirm('정말 삭제하시겠습니까?')) {
		location.href = 'delete?review_num='+num;
	}
}

//리플 삭제
function deleteReply(reply_num, review_num) {
	if (confirm('리플을 삭제하시겠습니까?')) {
		location.href='deleteReply?reply_num=' + reply_num + '&review_num=' + review_num;
	}
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


<div class = "centerview">

<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">BUSAN</a>
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
								<li><a class="dropdown-item" href="#">명소</a></li>
								<li><a class="dropdown-item" href="#">먹거리</a></li>
								<li><a class="dropdown-item" href="#">레저</a></li>
								<li><a class="dropdown-item" href="#">체험</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#">내주변</a></li>
							</ul>
						</li>
						<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								회원마당 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="review/List">리뷰</a></li>
								<li><a class="dropdown-item" href="#">질문과 답변</a></li>
							</ul>
						</li>
						
						<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								꿀팁 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#">공지</a></li>
								<li><a class="dropdown-item" href="#">이벤트</a></li>
							</ul>
						</li>
				
						</ul>
					   
					   <div class="collapse navbar-collapse justify-content-end" id="navbarNav-menu">
                         <ul class="navbar-nav text-center">
                          <c:if test = "${loginId == null}">
                           <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="user/loginForm">로그인</a>
                           </li>
                           <li class="nav-item">
                             <a class="nav-link" href="user/joinForm">회원가입</a>
                           </li>
                          </c:if>
                          <c:if test = "${loginId != 'manager' && loginName != '관리자' && loginId != null}">
                          <li class="nav-item">
                             <a class="nav-link">${loginName}님</a>
                           </li>
                           <li class="nav-item">
                            <a class="nav-link" href="user/logout">로그아웃</a>
                           </li>
                          </c:if>
                          <c:if test = "${loginId == 'manager' && loginName == '관리자'}">
                          <li class="nav-item">
                             <a class="nav-link">${loginName}님</a>
                           </li>
                           <li class="nav-item">
                            <a class="nav-link" href="user/logout">로그아웃</a>
                           </li>
                          </c:if>
                           <li class="nav-item">
                            <a class="nav-link" href="#">Language</a>
                           </li>
                          </ul>
				    
					<form class="d-flex">
							<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
			</div>
		</nav>
	</header>

<table style="margin-top: 50px;" class="table"  >

<tr>
<th scope="row" style="width:100px; text-align:center;" >제목</th>
<td style="width:800px;" >${review.review_title}</td>
</tr>

<tr>
<th scope="row" style="width:100px; text-align:center;"  >작성자</th>
<td style="width:800px;">${review.user_id}</td>
</tr>


<tr>
<th scope="row" style="width:100px; text-align:center;" >관광지</th>
<td style="width:800px;" >${review.info_name}</td>
</tr>

<tr>
<th scope="row" style="width:100px; text-align:center;" >글번호</th>
<td style="width:800px;" >${review.review_num}</td>
</tr>

<tr>
<th scope="row" style="width:100px; text-align:center;" >작성일</th>
<td style="width:800px;" >${review.review_inputdate}</td>
</tr>


<tr>
<th scope="row" style="width:100px; text-align:center;" >조회수</th>
<td style="width:800px;" >${review.review_hits}</td>
</tr>

<tr>
<th scope="row" style="width:100px; text-align:center;" >내용</th>
<td style="width:800px;" >${review.review_content}</td>
</tr>

</table>

<!-- 본인 글 수정/삭제 출력하고 있는 ID와 세션에 저장된 ID가 같을 때만 보임-->
<c:if test="${sessionScope.loginId == review.user_id}">
	<a href="edit?review_num=${review.review_num}"><button class="btn btn-outline-secondary">수정</button></a>
	<a href="javascript:deleteReview(${review.review_num})"><button class="btn btn-outline-secondary">삭제</button></a>
</c:if>
<!-- 목록보기 -->
<a href="List"><button class="btn btn-outline-secondary">목록보기</button></a>


<!-- 리플 목록 출력 시작 -->
<table class="reply">
<c:forEach var="reply" items="${replyList}">
	<tr>
		<th scope="row" style="width:100px; text-align:center;" class="replyid">
			<b>${reply.user_id}</b>
		</th>
		<td style="width:800px" class="replytext">
			${reply.reply_content}
		</td>
		<td style="width:800px" class="replybutton">
			<c:if test="${sessionScope.loginId == reply.user_id}">
				[<a href="javascript:deleteReply(${reply.reply_num}, ${reply.review_num })">삭제</a>]
			</c:if>
		</td>
	</tr>	
</c:forEach>
</table>
<!-- /리플 목록 출력 끝 -->
<!-- 리플 작성 폼 (로그인 한 사람에게만 보이게)-->
<c:if test="${sessionScope.loginId != null}">
<form action="replyWrite" method="post" onSubmit="return replyFormCheck();">
리플 입력
	<input type="hidden" name="review_num" value="${review.review_num}">
	<input type="text" name="reply_content" placeholder="리플을 입력하세요" style="width:800px;height:30px;">
	<input type="submit" class="btn btn-outline-secondary" value="리플 등록">
</form>
</c:if>
 
</div>
</body>
</html>