<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">

<title>부산온나</title>
<script>
	
	function new_window(){
		w = window.open('chatView', 'win', 'top=500, left=500, width=600, height=550, location=no, status=no');
	}
	
	function backpage(){
		window.location = "user/logout";		
	}
</script>
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

<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

$(document).ready(function(){
    $('#goNoticeBtn').on('click', goList);   
    $('#search').on('click', search);
  }); 

function search(){
	
}

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

  function goList(){
	  location.href = 'notice/list';
  }
  

</script>
<style>
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

.boardTitle {
	text-decoration: none;
	color: #5A5A5A;
}

.intro_notice {
	width: 400px;
	height: 160px;
}

.noticeListForHome {
	width: 900px;
	height: 300px;
	margin-left: 400px;
	text-decoration: none;
	position: relative;
	bottom: 160px;
}

td {
	width: 200px;
}

.goNotice {
	text-decoration: none;
	color: #5D5D5D;
}

.nav-item1 {
	float: right;
	padding: 10%;
}

#fixed_layer {
	position: fixed;
	z-index: 1000;
	height: 50px;
	width: 50px;
	bottom: 20px;
	right: 20px;
}
</style>


<!-- Custom styles for this template -->
<link href="resources/css/carousel.css" rel="stylesheet">
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="/busanonna_tour">BUSAN</a>
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
								<li><a class="dropdown-item" href="tourinfo/spot">명소</a></li>
								<li><a class="dropdown-item" href="tourinfo/food">먹거리</a></li>
								<li><a class="dropdown-item" href="tourinfo/leisure">레저</a></li>
								<li><a class="dropdown-item" href="tourinfo/experience">체험</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="notice/recommend">내주변</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								회원마당 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="review/List">리뷰</a></li>
								<li><a class="dropdown-item" href="#">질문과 답변</a></li>
							</ul></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								꿀팁 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="notice/list">공지</a></li>
								<li><a class="dropdown-item" href="event/list">이벤트</a></li>
							</ul></li>

					</ul>
					<div style="text-align: center;">
						<a href="https://www.kma.go.kr/busan/html/main/index.jsp"
							style="text-decoration: none"> <span class="ctemp"
							style="color: white;">현재 온도 : </span> 
							<span class="cicon" style = "width: 25px; height: 25px;"></span>
						</a>
					</div>
					<div class="collapse navbar-collapse justify-content-end"
						id="navbarNav-menu">
						<ul class="navbar-nav text-center">
							<c:if test="${loginId == null && loginAdmin == null}">
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="user/loginForm">로그인</a></li>
								<li class="nav-item"><a class="nav-link"
									href="user/joinForm">회원가입</a></li>
							</c:if>
							<c:if test="${loginId != null}">
								<li class="nav-item"><a class="nav-link">${loginName}님</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#" onclick="backpage()">로그아웃</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="user/mypage">마이페이지</a>
								</li>
							</c:if>
							<c:if test="${loginAdmin != null}">
								<li class="nav-item"><a class="nav-link">${loginName}님</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#" onclick="backpage()">로그아웃</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="user/mypage">마이페이지</a>
								</li>
							</c:if>
						</ul>

						<form class="d-flex">
							<input class="form-control me-2" id = "search" type="search"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success" type="button">Search</button>
						</form>
					</div>
				</div>
		</nav>
	</header>

	<main>

		<div id="carouselExampleCaptions" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="tourinfo/download?info_num=${top1.info_num}" class="d-block w-100" alt="송도">
					<div class="carousel-caption d-none d-md-block">
						<h5>'부산온나'의 top1</h5>
						<p>가장 인기있는 여행지 ${top1.info_name}</p>
						<p>
							<a class="btn btn-lg btn-primary" 
							href="tourinfo/read?info_num=${top1.info_num}">자세히 보기</a>
						</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="tourinfo/download?info_num=${top2.info_num}" class="d-block w-100"
						alt="대숲길">
					<div class="carousel-caption d-none d-md-block">
						<h5>'부산온나'의 top2</h5>
						<p>부산에서 둘째가라면 서러운 여행지 ${top2.info_name}</p>
						<p>
							<a class="btn btn-lg btn-primary" 
							href="tourinfo/read?info_num=${top2.info_num}">자세히 보기</a>
						</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="tourinfo/download?info_num=${top3.info_num}" class="d-block w-100"
						alt="감천문화마을">
					<div class="carousel-caption d-none d-md-block">
						<h5>'부산온나'의 top3</h5>
						<p>부산의 자랑. 3번째로 추천하는 여행지 ${top3.info_name}</p>
						<p>
							<a class="btn btn-lg btn-primary" 
							href="tourinfo/read?info_num=${top3.info_num}">자세히 보기</a>
						</p>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>


		<!-- Marketing messaging and featurettes
  ================================================== -->
		<!-- Wrap the rest of the page in another container to center all the content. -->

		<div class="container marketing">

			<!-- Three columns of text below the carousel -->

			<div class="row">

				<div class="col-lg-4">
					<svg class="bd-placeholder-img rounded-circle" width="140"
						height="140" xmlns="http://www.w3.org/2000/svg" role="img"
						aria-label="Placeholder: 140x140"
						preserveAspectRatio="xMidYMid slice" focusable="false">
        <image height="150" width="130"
							xlink:href="resources/image/tour_guide.png"></svg>

					<h2
						style="font-family: 'Black Han Sans', sans-serif; margin-top: 10px;">부산을
						즐기자</h2>
					<p style="font-family: 'Black Han Sans', sans-serif;">
						부산을 머무르는 다양한 방법 ! <br> 나에게 딱 맞는 부산 코스 여기서 골라봐
					</p>
					<p>
						<a class="btn btn-secondary" href="#">View details &raquo;</a>
					</p>
				</div>
				<!-- /.col-lg-4 -->

				<div class="col-lg-4">
					<svg class="bd-placeholder-img rounded-circle" width="140"
						height="140" xmlns="http://www.w3.org/2000/svg" role="img"
						aria-label="Placeholder: 140x140"
						preserveAspectRatio="xMidYMid slice" focusable="false">
        <image height="150" width="130"
							xlink:href="resources/image/spot.png"></svg>
					<h2
						style="font-family: 'Black Han Sans', sans-serif; margin-top: 10px;">명소를
						찾아서</h2>
					<p style="font-family: 'Black Han Sans', sans-serif;">
						부산의 대표 명소부터 숨은 명소까지 <br>샅샅이 소개해줄게
					</p>
					<p>
						<a class="btn btn-secondary" href="tourinfo/spot">View details
							&raquo;</a>
					</p>
				</div>
				<!-- /.col-lg-4 -->


				<div class="col-lg-4">
					<svg class="bd-placeholder-img rounded-circle" width="140"
						height="140" xmlns="http://www.w3.org/2000/svg" role="img"
						aria-label="Placeholder: 140x140"
						preserveAspectRatio="xMidYMid slice" focusable="false">
        <image height="150" width="130"
							xlink:href="resources/image/review.png"></svg>

					<h2
						style="font-family: 'Black Han Sans', sans-serif; margin-top: 10px;">리뷰</h2>
					<p style="font-family: 'Black Han Sans', sans-serif;">
						다녀온 사람들의 리뷰가<br>한눈에 쏙쏙
					</p>
					<p>
						<a class="btn btn-secondary" href="review/List">View details
							&raquo;</a>
					</p>
				</div>
				<!-- /.col-lg-4 -->

			</div>
			<!-- /.row -->

			<!-- 새 창 열기 -->
			<!-- 
    <div id="fixed_layer">
     <p><a href="javascript:new_window()"><img src="resources/image/chat.png" width="49" height="49" border="0"></a></p>
    </div>
	 -->
	 
			<div id="fixed_layer">
				<p>
					<!-- <a href="./chatView" target="_blank">-->
					<img src="resources/image/chat.png" width="49" height="49" border="0" onclick="new_window()">
				</p>
			</div>

			<!-- START THE FEATURETTES -->

			<hr class="featurette-divider">

			<div class="row featurette">
				<div class="col-md-7">
					<h2 class="featurette-heading">
					<a class="boardTitle" href="tourinfo/read?info_num=${info.info_num}">
						${info.info_title}
					</a></h2>
					<br>
					<p class="lead">${info.info_subtitle}</p>
				</div>
				<div class="col-md-5">
					<img style="width:500px; height:350px;"
						src="tourinfo/download?info_num=${info.info_num}" class="card-img-top" alt="${info.info_title}">
				</div>
			</div>

			<hr class="featurette-divider">

			<div class="row featurette">
				<div class="col-md-7 order-md-2">
					<h2 class="featurette-heading">
						Oh yeah, it’s that good. <span class="text-muted">See for
							yourself.</span>
					</h2>
					<p class="lead">Another featurette? Of course. More placeholder
						content here to give you an idea of how this layout would work
						with some actual real-world content in place.</p>
				</div>
				<div class="col-md-5 order-md-1">
					<svg
						class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
						width="500" height="500" xmlns="http://www.w3.org/2000/svg"
						role="img" aria-label="Placeholder: 500x500"
						preserveAspectRatio="xMidYMid slice" focusable="false">
						<title>Placeholder</title><rect width="100%" height="100%"
							fill="#eee" />
						<text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

				</div>
			</div>

			<hr class="featurette-divider">

			<div class="intro_notice">
				<h3
					style="font-weight: bold; font-family: 'Black Han Sans', sans-serif;">
					공지사항
					<h3>
						<p
							style="font-size: 24px; font-family: 'Black Han Sans', sans-serif;">
							부산온나의 이슈와 <br> 새로운 소식을 전해드립니다
						</p>
						<button type="button" id="goNoticeBtn"
							class="btn btn-outline-secondary">더보기</button>
			</div>

			<div class="noticeListForHome">
				<table class="table table-striped table-hover">

					<c:forEach var="notice" items="${noticeList}" begin="1" end="5">
						<tr>
							<th scope="row"><a class="goNotice"
								href="notice/read?notice_num=${notice.notice_num}">
									${notice.notice_title}</a></th>

							<td style="text-align: center;">${notice.notice_inputdate}</td>
						</tr>
					</c:forEach>

				</table>
			</div>

			<hr class="featurette-divider">

			<!-- /END THE FEATURETTES -->

		</div>
		<!-- /.container -->



		<!-- FOOTER -->
		<footer class="container">
			<p class="float-end">
				<a href="#">Back to top</a>
			</p>
			<p>
				&copy; 2017–2021 Company, Inc. &middot; <a href="#">Privacy</a>
				&middot; <a href="#">Terms</a>
			</p>
		</footer>
	</main>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>


</body>

</html>