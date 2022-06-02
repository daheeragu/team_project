<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>


<meta charset="UTF-8">
<title>꿀팁 | 이벤트 | BUSANONNA</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet">

</head>
<script type="text/javascript" src="../resources/js/jquery-3.6.0.js"></script>
<script>
function pagingFormSubmit(currentPage) {
	var form = document.getElementById('pagingForm');
	var page = document.getElementById('page');
	page.value = currentPage;
	form.submit();
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

function backpage(){
	window.location = "../user/logout";
	location.href = "../event/list";
}
</script>

<style>
.container {
	margin-top: 10px;
}

.subvis {
	width: 100%;
	height: 370px;
	background-image: url('../resources/image/flower_park.jpg');
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
	margin-top: 150px;
	margin-left: 50px;
}

.card-img-top{
   height: 200px;
}
.card-body{
    height: 150px;
    text-decoration: none;
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
									href="#" onclick="backpage()">로그아웃</a></li>
								<li class="nav-item"><a class="nav-link"
									href="../user/mypage">마이페이지</a></li>
							</c:if>
							<c:if test="${loginAdmin != null}">
								<li class="nav-item"><a class="nav-link">${loginName}님</a>
								</li>
								<li class="nav-item"><a class="nav-link"
									href="#" onclick="backpage()">로그아웃</a></li>
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

	<!--서브 비주얼 -->
	<div class="subvis">
		<h1>이벤트</h1>
	</div>


	<!-- 업로드된 총이벤트 수 / 검색폼-->
	<div class="firstLine">
		<b>총(전체) ${navi.totalRecordsCount}건</b>
		<div class="pagingForm">
			<form id="pagingForm" method="get" action="list">
				<input type="hidden" name="page" id="page"> 검색어 : <input
					type="text" name="searchText" value="${searchText}"> <input
					type="button" onclick="pagingFormSubmit(1)" value="검색">
			</form>
		</div>
	</div>
	<!-- 이벤트 카드 목록 출력 -->

	<div class="container">
		<div class="row">
			<c:forEach var="event" items="${eventList}">
				<c:forEach var="pic" items="${picList}">
					<c:if test="${event.event_num == pic.event_num}">
						<div class="col-lg-3" style="padding-top: 20px;">
							<a href="read?event_num=${event.event_num}">
								<div class="card" style="width: 18rem;">
									<img src="download?eventpic_num=${pic.eventpic_num}"
										class="card-img-top" alt="...">
									<div class="card-body">
										<p class="card-text">
											${event.event_title}<br> ${event.event_startdate} -
											${event.event_enddate} ${event.event_state}
										</p>
									</div>
								</div>
							</a>
						</div>
					</c:if>
				</c:forEach>
			</c:forEach>
		</div>
	</div>

	<!-- 관리자에게만 보이는 등록 버튼 -->
	<c:if test="${loginAdmin != null}">
		<div class="bottom-line">
			<button type="button" class="btn btn-outline-dark"
				onclick="location.href='write'">등록</button>
		</div>
	</c:if>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>