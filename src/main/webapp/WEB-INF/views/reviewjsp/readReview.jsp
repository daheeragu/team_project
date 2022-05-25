<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 읽기</title>
<link rel="stylesheet" type="text/css" href="../resources/css/default.css"/> 

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

<script type="text/javascript">
//게시글 삭제
function deleteBoard(num){
	if(confirm('정말 삭제하시겠습니까?')) {
		location.href = 'delete?boardnum='+num;
	}
}

//리플 삭제
function replyDelete(replynum, boardnum) {
	if (confirm('리플을 삭제하시겠습니까?')) {
		location.href='replyDelete?replynum=' + replynum + '&boardnum=' + boardnum;
	}
}




</script>
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

<table>
<tr>
<th style="width:100px;">작성자</th>
<td style="width:600px;">${review.user_id}</td>
</tr>


<tr>
<th>작성일</th>
<td>${review.review_inputdate}</td>
</tr>


<tr>
<th>조회수</th>
<td>${review.review_hits}</td>
</tr>


<tr>
<th>제목</th>
<td>${review.review_title}</td>
</tr>

<tr>
<th>내용</th>
<td>${review.review_content}</td>
</tr>

<tr>
<th>파일첨부</th>
<td>
	<a href = "download"?boardnum=${board.boardnum}">${board.originalfile}</a>
</td><!-- 글번호가 컨트롤러의 파일 다운로드 메소드로 전달됨 -->
</tr>
</table>

<!-- 본인 글 수정/삭제 출력하고 있는 ID와 세션에 저장된 ID가 같을 때만 보임-->
<c:if test="${sessionScope.loginId == review.user_id}">
	<a href="edit?review_num=${review.review_num}">수정</a>
	<a href="javascript:deleteReview(${review.review_num})">삭제</a>
</c:if>

<!-- 목록보기 -->
<a href="List">목록보기</a>


<!-- 리플 작성 폼 (로그인 한 사람에게만 보이게)-->
<c:if test="${sessionScope.loginId != null}">
<form action="replyWrite" method="post" onSubmit="return replyFormCheck();">
리플내용
	<input type="hidden" name="boardnum" value="${board.boardnum}">
	<input type="text" name="text" style="width500px;">
	<input type="submit" value="확인">
</form>
</c:if>



<!-- 리플 목록 출력 시작 -->
<table class="reply">
<c:forEach var="reply" items="${replylist}">
	<tr>
		<td class="replyid">
			<b>${reply.id}</b>
		</td>
		<td class="replytext">
			${reply.text}
		</td>
		<td class="replybutton">
			<c:if test="${loginId == reply.id}">
				[<a href="javascript:replyDelete(${reply.replynum}, ${reply.boardnum })">삭제</a>]
			</c:if>
		</td>
	</tr>	
</c:forEach>
</table>
<!-- /리플 목록 출력 끝 --> 
</div>
</body>
</html>