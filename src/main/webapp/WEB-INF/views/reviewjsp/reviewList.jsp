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


</head>
<body>

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
<br>
<br>
<br>
<table class="table">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">등록일</th>
    </tr>
  </thead>
  
  <tbody>
   <c:forEach var="review" items="${reviewlist}">
    <tr>
      <th scope="row">${review.review_num}</th>
      <td>${review.review_title}</td>
      <td>${review.user_id}</td>
      <td>${review.review_inputdate}</td>
    </tr>
   </c:forEach>
  </tbody>
</table>

</body>
</html>