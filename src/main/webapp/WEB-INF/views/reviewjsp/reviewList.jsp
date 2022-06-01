<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 글읽기</title>
<link rel="stylesheet" type="text/css" href="../resources/css/default.css"/>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script type="text/javascript" src="../resources/js/jquery-3.6.0.js"></script>
<!-- 페이지 이동 스크립트  -->
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

function pagingFormSubmit(currentPage) {
	var form = document.getElementById('pagingForm');
	var page = document.getElementById('page');
	page.value = currentPage;
	form.submit();
}

function backpage(){
	window.location = "../user/logout";
	location.href = "../review/List";
}
</script>

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
					   <div>
						<a href="https://www.kma.go.kr/busan/html/main/index.jsp"
							style="text-decoration: none"> <span class="ctemp"
							style="color: white;">현재 온도 : </span> <span class="cicon"
							style="width: 25px; height: 25px;"></span></a>
					   </div>
					   <div class="collapse navbar-collapse justify-content-end" id="navbarNav-menu">
                         <ul class="navbar-nav text-center">
                          <c:if test = "${loginId == null && loginAdmin == null}">
                           <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="../user/loginForm">로그인</a>
                           </li>
                           <li class="nav-item">
                             <a class="nav-link" href="../user/joinForm">회원가입</a>
                           </li>
                          </c:if>
                          <c:if test = "${loginId != null}">
                          <li class="nav-item">
                             <a class="nav-link">${loginName}님</a>
                           </li>
                           <li class="nav-item">
                            <a class="nav-link" href="#" onclick = "backpage()">로그아웃</a>
                           </li>
                           <li class="nav-item"><a class="nav-link" href="../user/mypage">마이페이지</a>
						   </li>
                          </c:if>
                          <c:if test = "${loginAdmin != null}">
                          <li class="nav-item">
                             <a class="nav-link">${loginName}님</a>
                           </li>
                           <li class="nav-item">
                            <a class="nav-link" href="#" onclick = "backpage()">로그아웃</a>
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
<br>
<br>
<br>

<p>
	전체 : ${total}	
</p>

<table class="table">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
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
			<input type="button" value="글쓰기" onclick="location.href='write'" style="float : right;">
		</div>
		
		<!-- /페이지 이동 끝 -->
		
<!-- 검색 폼 -->
		<div class="pagingForm">
			<form id="pagingForm" method="get" action="List">
				<input type="hidden" name="page" id="page"> 검색어 : <input
					type="text" name="searchText" value="${searchText}"> <input
					type="button" onclick="pagingFormSubmit(1)" value="검색">
			</form>
		</div>
		<!-- /검색폼 -->



<%-- <!-- 검색 폼 -->
<form action="List" method="get">
제목 : <input type="text" name="searchText" value="${searchText}">
	 <input type="submit" value="검색">
</form>--%>

 
</body>
</html>