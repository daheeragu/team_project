<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행지 | BUSANONNA</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script type="text/javascript" src="../resources/js/jquery-3.6.0.js"></script>
</head>

<!-- 페이지 이동 스크립트  -->
<script type="text/javascript">
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

function pagingFormSubmit(currentPage) {
	var form = document.getElementById('pagingForm');
	var page = document.getElementById('page');
	page.value = currentPage;
	form.submit();
}

function backpage(){
	window.location = "../user/logout";
	location.href = "../tourinfo/spot";
}
</script>


<style>
.container {
	margin-top: 10px;
}

a {
	text-decoration-line: none;
	color: black;
}

.subvis {
	width: 100%;
	height: 370px;
	background-image: url('../resources/image/sunset.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: scroll;
}

h1 {
	text-align: center;
	color: black;
	margin: auto;
	top: 100px;
	position: relative;
	top: 45%
}

.firstLine {
	margin-top: 150px;
	margin-left: 50px;
}

.pagingForm {
	margin-left: 1030px;
}

.bottom-line {
	padding-top: 10px;
	position: absolute;
	right: 8%;
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
								<li><a class="dropdown-item" href="spot">명소</a></li>
								<li><a class="dropdown-item" href="food">먹거리</a></li>
								<li><a class="dropdown-item" href="leisure">레저</a></li>
								<li><a class="dropdown-item" href="experience">체험</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#">내주변</a></li>
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
					<div>
						<a href="https://www.kma.go.kr/busan/html/main/index.jsp"
							style="text-decoration: none"> <span class="ctemp"
							style="color: white;">현재 온도 : </span> <span class="cicon"
							style="width: 25px; height: 25px;"></span></a>
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
									href="../user/mypage">마이페이지</a></li>
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

	<br>
	<div class="firstLine">
		<h1>
			<c:if test="${theme == 'spot'}">
		여행지 - 명소
	</c:if>
			<c:if test="${theme == 'food'}">
		여행지 - 먹거리
	</c:if>
			<c:if test="${theme == 'leisure'}">
		여행지 - 레저
	</c:if>
			<c:if test="${theme == 'exp'}">
		여행지 - 체험
	</c:if>
		</h1>
	</div>

	<!-- 글 개수 / 검색폼 / 글쓰기버튼-->
	<div class="firstLine">
		<b>총(전체) ${navi.totalRecordsCount}건</b>
		<div class="pagingForm">
			<form id="pagingForm" method="get" action="list">
				<input type="hidden" name="page" id="page"> 검색어 : <input
					type="text" name="searchText" value="${searchText}"> <input
					type="button" onclick="pagingFormSubmit(1)" value="검색">
				<c:if test="${sessionScope.loginAdmin != null}">
					<input type="button" value="글쓰기" onclick="location.href='write'">
				</c:if>
			</form>
		</div>
	</div>

	<br>

	<!-- 글 목록을 카드 형식으로 출력 -->

	<div class="container">
		<div class="row">
			<c:forEach var="list" items="${infolist}">
				<div class="col-lg-3" style="padding-top: 20px;">
					<a href="read?info_num=${list.info_num}">
						<div class="card" style="width: 18rem;">
							<div class="card-body">
								<h5 class="card-title">${list.info_title}</h5>
								<p class="card-text">${list.info_subtitle}</p>
								<p class="card-subinfo">조회수: ${list.info_hits} 땡기네:
									${list.info_like}</p>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>

		</div>
	</div>


	<!-- 페이지 이동 부분 -->
	<div id="navigator">
		<a
			href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁
		</a> &nbsp;&nbsp; <a
			href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a>
		&nbsp;&nbsp;

		<c:forEach var="counter" begin="${navi.startPageGroup}"
			end="${navi.endPageGroup}">
			<c:if test="${counter == navi.currentPage}">
				<b>
			</c:if>
			<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
		<c:if test="${counter == navi.currentPage}">
				</b>
			</c:if>
		</c:forEach>
		&nbsp;&nbsp; <a
			href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a>
		&nbsp;&nbsp; <a
			href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>
		<br />
		<br />
	</div>
	<!-- /페이지 이동 끝 -->


	<!-- /검색폼 -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>