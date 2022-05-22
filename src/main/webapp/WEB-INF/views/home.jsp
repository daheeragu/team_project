<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
   
    <title>Carousel Template · Bootstrap v5.1</title>

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
								<li><a class="dropdown-item" href="boardjsp/readReview">리뷰</a></li>
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

<main>

  <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="resources/image/beach.png" class="d-block w-100" alt="송도">
      <div class="carousel-caption d-none d-md-block">
        <h5>부산을 머무르는 다양한 방법</h5>
        <p>나에게 딱 맞는 부산여행 코스, 여기서 골라봐</p>
        <p><a class="btn btn-lg btn-primary" href="#">자세히 보기</a></p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="resources/image/forest.jpg" class="d-block w-100" alt="대숲길">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second slide label</h5>
        <p>Some representative placeholder content for the second slide.</p>
        <p><a class="btn btn-lg btn-primary" href="#">자세히 보기</a></p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="resources/image/town.jpg" class="d-block w-100" alt="감천문화마을">
      <div class="carousel-caption d-none d-md-block">
        <h5>Third slide label</h5>
        <p>Some representative placeholder content for the third slide.</p>
        <p><a class="btn btn-lg btn-primary" href="#">자세히 보기</a></p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
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
        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false">
        <image height="150" width="130" xlink:href="resources/image/tour_guide.png"></svg>

        <h2 style="font-family:'Black Han Sans', sans-serif; margin-top: 10px;">부산을 즐기자</h2>
        <p style="font-family:'Black Han Sans', sans-serif;">
                 부산을 머무르는 다양한 방법 ! <br> 나에게 딱 맞는 부산 코스 여기서 골라봐</p>
        <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      
      <div class="col-lg-4">
        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false">
        <image height="150" width="130" xlink:href="resources/image/spot.png"></svg>
        <h2 style="font-family:'Black Han Sans', sans-serif; margin-top: 10px;">명소를 찾아서</h2>
        <p style="font-family:'Black Han Sans', sans-serif;">
                 부산의 대표 명소부터 숨은 명소까지 <br>샅샅이 소개해줄게</p>
        <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      
     
      <div class="col-lg-4">
        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false">
        <image height="150" width="130" xlink:href="resources/image/review.png"></svg>

        <h2 style="font-family:'Black Han Sans', sans-serif; margin-top: 10px;">리뷰</h2>
        <p style="font-family:'Black Han Sans', sans-serif;">
                  다녀온 사람들의 리뷰가<br>한눈에 쏙쏙</p>
        <p><a class="btn btn-secondary" href="boardjsp/readReview">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      
    </div><!-- /.row -->

    <div id="fixed_layer">
     <p><a href="./chatView" target="_blank"><img src="resources/image/chat.png" width="49" height="49" border="0"></a></p>
    </div>


    <!-- START THE FEATURETTES -->

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">First featurette heading. <span class="text-muted">It’ll blow your mind.</span></h2>
        <p class="lead">Some great placeholder content for the first featurette here. Imagine some exciting prose here.</p>
      </div>
      <div class="col-md-5">
        <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading">Oh yeah, it’s that good. <span class="text-muted">See for yourself.</span></h2>
        <p class="lead">Another featurette? Of course. More placeholder content here to give you an idea of how this layout would work with some actual real-world content in place.</p>
      </div>
      <div class="col-md-5 order-md-1">
        <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">And lastly, this one. <span class="text-muted">Checkmate.</span></h2>
        <p class="lead">And yes, this is the last block of representative placeholder content. Again, not really intended to be actually read, simply here to give you a better view of what this would look like with some actual content. Your content.</p>
      </div>
      <div class="col-md-5">
        <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

      </div>
    </div>

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->

 

  <!-- FOOTER -->
  <footer class="container">
    <p class="float-end"><a href="#">Back to top</a></p>
    <p>&copy; 2017–2021 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
  </footer>
</main>


 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

      
  </body>

</html>