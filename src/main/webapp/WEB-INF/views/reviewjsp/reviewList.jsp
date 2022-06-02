<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">

<title>회원마당 | 리뷰 | BUSANONNA</title>
<!--
<link rel="stylesheet" type="text/css" href="../resources/css/default.css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script type="text/javascript" src="../resources/js/jquery-3.6.0.js"></script>
  -->
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/carousel/">

<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/5.1/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest"
	href="https://getbootstrap.com/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg"
	color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet">

<!-- Custom styles for this template -->
<script type="text/javascript" src="../resources/js/jquery-3.6.0.js"></script>
<link href="../resources/css/carousel.css" rel="stylesheet">
</head>

<!-- 페이지 이동 스크립트  -->
<script>
$.getJSON('https://api.openweathermap.org/data/2.5/weather?id=1838524&appid=ac2190fcb873d3f767de9e3773f21704&units=metric', function(data){
	// data로 할 일...
//	alert(data.list[0].main.temp_min);
	var $cTemp = data.main.temp;
	var $minTemp = data.main.temp_min;
	var $maxTemp = data.main.temp_max;
	var $cIcon = data.weather[0].icon;
	var $now = new Date($.now());
	var $cDate = $now.getFullYear() + '/' + ($now.getMonth() + 1) + '/' + $now.getDate() + '/' + $now.getHours() + ':' + $now.getMinutes()
	// A.appendTo(B) B요소의 내용의 뒤에 A를 추가
	// A.append(B) A요소의 내용의 뒤에 B를 추가
	// A.prependTo(B) B요소의 내용의 앞에 A를 추가
	// A.prepend(B) A요소의 내용의 앞에 B를 추가
	// Date.now();, == $.now : 현재시간 출력
	// new Date(Date.now());
	// alert(new Date(Date.now()));
	// .getFullYear() : 년도
	// .getHours() : 시간
	// .getMinutes() : 분
	// .getMonth() : 월 - 0이 1월
	// .getDate() : 일
	
	$('.ctemp').append($cTemp);
	$('.cicon').append('<img style = "width : 50px; height:50px;" src = "http://openweathermap.org/img/wn/' +$cIcon+ '@2x.png">')
});

function backpage(){
	window.location = "../user/logout";
	location.href = "../review/List";
}

function pagingFormSubmit(currentPage) {
	var form = document.getElementById('pagingForm');
	var page = document.getElementById('page');
	page.value = currentPage;
	form.submit();
}

</script>

<style>
tr {
	border: 1px solid;
	border-color: #EAEAEA;
}

#upper {
	font-weight: bold;
	background-color: #BDBDBD;
	text-align: center;
}

#bottom {
	background-color: #FFFFFF;
	text-align: center;
}

#top-bt {
	text-align: right;
	border: white;
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
	font-family: 'Black Han Sans', sans-serif;
	color: white;
	margin: auto;
	top: 100px;
	position: relative;
	top: 45%
}

.firstLine {
	padding-left: 260px;
}

#pagingForm {
	margin-top: 60px;
	padding-left: 600px;
}

#navigator {
	padding-top: 10px;
	position: absolute;
	left: 43%
}
</style>





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
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								여행지 </a>

							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="../tourinfo/spot">명소</a></li>
								<li><a class="dropdown-item" href="../tourinfo/food">먹거리</a></li>
								<li><a class="dropdown-item" href="../tourinfo/leisure">레저</a></li>
								<li><a class="dropdown-item" href="../tourinfo/experience">체험</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="../notice/recommend">내주변</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								회원마당 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="../review/List">리뷰</a></li>
								<li><a class="dropdown-item" href="#">질문과 답변</a></li>
							</ul></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								꿀팁 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="../notice/list">공지</a></li>
								<li><a class="dropdown-item" href="../event/list">이벤트</a></li>
							</ul></li>

					</ul>
					<div style="text-align: center;">
						<a href="https://www.kma.go.kr/busan/html/main/index.jsp"
							style="text-decoration: none"> <span class="ctemp"
							style="color: white;">현재 온도 : </span> <span class="cicon"
							style="width: 25px; height: 25px;"></span>
						</a>
					</div>
					<div class="collapse navbar-collapse justify-content-end"
						id="navbarNav-menu">
						<ul class="navbar-nav text-center">
							<c:if test="${loginId == null && loginAdmin == null}">
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="../user/loginForm">로그인</a></li>
								<li class="nav-item"><a class="nav-link"
									href="../user/joinForm">회원가입</a></li>
							</c:if>
							<c:if test="${loginId != null}">
								<li class="nav-item"><a class="nav-link">${loginName}님</a>
								</li>
								<li class="nav-item"><a class="nav-link"
									href="#" onclick = "backpage()">로그아웃</a></li>
								<li class="nav-item"><a class="nav-link"
									href="../user/mypage" ">마이페이지</a></li>
							</c:if>
							<c:if test="${loginAdmin != null}">
								<li class="nav-item"><a class="nav-link">${loginName}님</a>
								</li>
								<li class="nav-item"><a class="nav-link"
									href="#" onclick = "backpage()">로그아웃</a></li>
								<li class="nav-item"><a class="nav-link"
									href="../user/mypage">마이페이지</a></li>
							</c:if>
						</ul>

						<form class="d-flex">
							<input class="form-control me-2" type="search"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success" type="submit">Search</button>
						</form>
					</div>
				</div>
		</nav>
	</header>

	<div class="subvis">
			<h1>리뷰</h1>
		</div>
<br>
<br>

	<div class="firstLine">
			<span style="color: orange;"><b>전체 : ${total}</b></span>
	</div>

<table style="margin: auto;" class="table">
  <thead>
    <tr id="upper">
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">관광지</th>
      <th scope="col">작성자</th>
      <th scope="col">조회수</th>
      <th scope="col">등록일</th>
    </tr>
  </thead>
  
  <tbody>
   <c:forEach var="review" items="${reviewList}">
    <tr>
      <th scope="row">${review.review_num}</th>
      <td><a href="readReview?review_num=${review.review_num}">${review.review_title}</a></td>
      <td>${review.info_name}</td>
      <td>${review.user_id}</td>
      <td>${review.review_hits}</td>
      <td>${review.review_inputdate}</td>
    </tr>
   </c:forEach>
  </tbody>
</table>

<!-- 페이지 이동 부분 -->
		<div id="navigator">
			<ul class="pagination">
				<li class="page-item"><a class="page-link"
					href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">Previous</a></li>

				<c:forEach var="counter" begin="${navi.startPageGroup}"
					end="${navi.endPageGroup}">
					<c:if test="${counter == navi.currentPage}"></c:if>
					<li class="page-item"><a class="page-link"
						href="javascript:pagingFormSubmit(${counter})">${counter}</a></li>
					<c:if test="${counter == navi.currentPage}"></c:if>
				</c:forEach>

				<li class="page-item"><a class="page-link"
					href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">Next</a></li>
			</ul>
		</div>
		<input type="button" value="글쓰기" onclick="location.href='write'" style="float : right;">
		
		<!-- /페이지 이동 끝 -->
		
<!-- 검색 폼 -->
		<div class="pagingForm">
			<form id="pagingForm" method="get" action="List">
				<input type="hidden" name="page" id="page"> 검색어 : 
				<input type="text" name="searchText" value="${searchText}"> 
				<input type="button" onclick="pagingFormSubmit(1)" value="검색">
			</form>
		</div>
		<!-- /검색폼 -->



<%-- <!-- 검색 폼 -->
<form action="List" method="get">
제목 : <input type="text" name="searchText" value="${searchText}">
	 <input type="submit" value="검색">
</form>--%>

<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
 
</body>
</html>