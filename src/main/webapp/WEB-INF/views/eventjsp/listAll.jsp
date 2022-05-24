<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  

<meta charset="UTF-8">
<title>꿀팁 | 이벤트 | BUSANONNA</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


</head>

<script>
function pagingFormSubmit(currentPage) {
	var form = document.getElementById('pagingForm');
	var page = document.getElementById('page');
	page.value = currentPage;
	form.submit();
}
</script>

<style>
   .container{
     margin-top: 10px; 
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
	color: white;
	margin: auto;
	top: 100px;
	position: relative;
	top: 45%
   }
   
   .firstLine{
    margin-top: 150px;
    margin-left: 50px;
   }
   
   .pagingForm{
    margin-left: 1030px;
   }
  
   .bottom-line{
      padding-top: 10px;
      position: absolute; 
      right: 8%; 
   }
   
   #navigator{
      padding-top: 10px;
      position:absolute;
      left:43%
  }
</style>
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
					   
					   <div class="collapse navbar-collapse justify-content-end" id="navbarNav-menu">
                         <ul class="navbar-nav text-center">
                           <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">로그인</a>
                           </li>
                           <li class="nav-item">
                             <a class="nav-link" href="#">회원가입</a>
                           </li>
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
  
  <!--서브 비주얼 --> 
 <div class="subvis">
   <h1>이벤트</h1>
</div>
 

  <!-- 업로드된 총이벤트 수 / 검색폼-->
  <div class="firstLine"> 
    <b>총(전체)  ${navi.totalRecordsCount}건</b>
      <div class="pagingForm"> 
         <form id="pagingForm" method="get" action="list">
         <input type="hidden" name="page" id="page">
                  검색어 : <input type="text" name="searchText" value="${searchText}">
         <input type="button" onclick="pagingFormSubmit(1)" value="검색">
         </form>
      </div>
  </div>
  <!-- 이벤트 카드 목록 출력 -->

	<div class="container">
		<div class="row">
		<c:forEach var="event" items="${eventList}">
		  <c:forEach var="pic" items="${picList}">
			<div class="col-lg-3" style="padding-top:20px;">
			      <a href="read?event_num=${event.event_num}">
			    	  <div class="card" style="width: 18rem;">			
						<img src="download?eventpic_num=${pic.eventpic_num}" class="card-img-top"
							alt="...">  
						<div class="card-body">
							<p class="card-text">
								${event.event_title}<br> ${event.event_startdate} -
								${event.event_enddate} ${event.event_state}
							</p>
						</div>
					  </div>
				    </a>
			     </div>
			    </c:forEach>
			</c:forEach>
		</div>
	</div>

	<!-- 관리자에게만 보이는 등록 버튼 -->
	<div class="bottom-line">
		<button type="button" class="btn btn-outline-dark"
			onclick="location.href='write'">등록</button>
	</div>

   <!-- 페이지 이동 부분 -->
 
 <div id="navigator"> 
  <ul class="pagination">
    <li class="page-item"><a class="page-link" 
    href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">Previous</a></li>

    <c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
      <c:if test="${counter == navi.currentPage}"></c:if>
      <li class="page-item"><a class="page-link" 
          href="javascript:pagingFormSubmit(${counter})">${counter}</a></li>
      <c:if test="${counter == navi.currentPage}"></c:if>
    </c:forEach>

    <li class="page-item"><a class="page-link" 
    href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">Next</a></li>
  </ul>
</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>