<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script src = "../resources/ckeditor/ckeditor.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

<script>
function spotSearchOpen() {
	window.open('spotSearch', 'win', 'top=300,left=500,width=400,height=300,location=no,status=no');
}
</script>


</head>

   
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
								<li><a class="dropdown-item" href="../review/List">리뷰</a></li>
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
                            <a class="nav-link" href="user/logout">로그아웃</a>
                           </li>
                           </li>
								<li class="nav-item"><a class="nav-link" href="../user/mypage">마이페이지</a>
								</li>
                          </c:if>
                          <c:if test = "${loginAdmin != null}">
                          <li class="nav-item">
                             <a class="nav-link">${loginName}님</a>
                           </li>
                           <li class="nav-item">
                            <a class="nav-link" href="../user/logout">로그아웃</a>
                           </li>
                          </c:if>

                          <c:if test = "${loginId == 'manager' && loginName == '관리자'}">
                          <li class="nav-item">
                             <a class="nav-link">${loginName}님</a>
                           </li>
                           <li class="nav-item">
                            <a class="nav-link" href="../user/logout">로그아웃</a>
                           </li>
                          </c:if>

                           </li>
								<li class="nav-item"><a class="nav-link" href="../user/mypage">마이페이지</a>
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
                                                   <!-- 파일 보낼 때 꼭 필요 -->
<form id="writeForm" action = "write" method ="post" enctype="multipart/form-data"
      onsubmit="return formCheck();">
<table>
  <tr>
    <th>제목</th>
    <td><input type="text" name="review_title" id="title"></td> 
  </tr>
</table>
  <tr>
		<th>관광지</th>
		<td>
			<input type="text" name="spot" id="spot" maxlength="10" placeholder="관광지를 입력하세요" readonly="readonly">
			<input type="button" value="관광지 검색" onclick="spotSearchOpen()">
			<input type="hidden" name="info_num" id="info_num">
		</td>
	</tr>
	<tr>

<table>   
  <tr>
    <th>내용</th>
      <td>
		 <textarea id="editor" name="review_content"></textarea>
	            <script>
	                CKEDITOR.replace('editor'
	                		, {filebrowserUploadUrl:'imageUpload.do'
	                		, extraPlugins:'image2'
	                		, height:'600px'
	                				});
	            </script>
		  </td>
  </tr>
  
  <tr id="save">
	    <td colspan ="2">
	      <input type="submit" value="등록">
	    </td>
	  </tr>
  
</table>

</form>
</body>
</html>