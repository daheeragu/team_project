<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
   
    <title>여행지 | 상세정보 | BUSANONNA </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zfofulyw3m&submodules=geocoder"></script>

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

    <!-- Custom styles for this template -->
    <link href="../resources/css/carousel.css" rel="stylesheet">
    
<script type="text/javascript" src="../resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

$(document).ready(function(){
    $('#gobtn').on('click', returnList);
    $('#editbtn').on('click', updateInfo);
    $('#deletebtn').on('click', deleteInfo);
    $('#likebtn').on('click', like);
  }); 
  
  function returnList(){
	  location.href = '../tourinfo/${info.info_theme}';
  }
  
  function updateInfo(){
	  location.href = 'edit?info_num=${info.info_num}';
  }
  
  function deleteInfo(){
	  if(confirm('정말 삭제하시겠습니까?')){
	 	 location.href = 'delete?info_num=${info.info_num}';
	  }
  }
  
  function like(){
	 let loginId = '<%=(String)session.getAttribute("loginId")%>';
	 
	 if(loginId != "null") {
		 location.href = 'like?info_num=${info.info_num}';
	 } else {
		 alert('로그인 후 이용할 수 있습니다.');
		 location.href = '../user/loginForm';
	 }
  }

</script>
  
 <style>
 .container {
	margin-top: 200px;
        }

 .titleback {
	width: 100%;
	height: 335px;
 	background-image: url('');
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
	top: 40%
   }
   
  h3 {
	text-align: center;
	color: black;
	margin: auto;
	top: 100px;
	position: relative;
	top: 40%
  }
  
</style>



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
							<li><a class="dropdown-item" href="spot">명소</a></li>
							<li><a class="dropdown-item" href="food">먹거리</a></li>
							<li><a class="dropdown-item" href="leisure">레저</a></li>
							<li><a class="dropdown-item" href="experience">체험</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">내주변</a></li>
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
                           <a class="nav-link" href="../user/logout">로그아웃</a>
                          </li>
                          <li class="nav-item">
                           <a class="nav-link" href="../user/mypage">마이페이지</a>
                          </li>
                         </c:if>
                         <c:if test = "${loginAdmin != null}">
                         <li class="nav-item">
                            <a class="nav-link">${loginName}님</a>
                          </li>
                          <li class="nav-item">
                           <a class="nav-link" href="../user/logout">로그아웃</a>
                          </li>
                          <li class="nav-item">
                           <a class="nav-link" href="../user/mypage">마이페이지</a>
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

<div class="thumbnail">
	
</div>

<div class="titleback">
   <h1>${info.info_title}</h1>
   <p></p>
   <h3>${info.info_subtitle}</h3>
</div>

<div class = "container">
 <table class="table">
  <tbody>
  
  	<tr>
  		<td scope="row" colspan="2">${info.savedfile }</td>
  	</tr>
  
    
    <tr>
      <th scope="row">제목</th>
      <td>${info.info_title}</td>
    </tr>
    
    <tr>
      <th scope="row">주소</th>
      <td id="address" >${info.info_address}</td>
    </tr>
    
    <tr>
      <th scope="row">조회수</th>
      <td>${info.info_hits}</td>
    </tr>
    
    <tr>
      <th scope="row">땡기네  <button id="likebtn" type="button" class="btn btn-outline-dark">내도 땡기네!</button></th>
      <td>${info.info_like} </td>
    </tr>
    
    <tr>
      <th scope="row">이용 가능 여부</th>
      <td>
      <c:if test="${info.info_state == 'available'}">
      	이용 가능
      </c:if>
      <c:if test="${info.info_state == 'unavailable'}">
      	이용 불가
      </c:if>
      </td>
    </tr>
     
    <tr>
      <td class="contnet" scope="row" colspan="2">
          ${info.info_content}
      </td>
    </tr>
    
    <tr>
    	<th scope="row" colspan="2" style="text-align:center;">
    	<div id="map" style="width:100%;height:600px;"></div>
    	<script>

    	var map = new naver.maps.Map("map", {
		  center: new naver.maps.LatLng(37.3595316, 127.1052133),
		  zoom: 15,
		  mapTypeControl: true
		});
		
		var infoWindow = new naver.maps.InfoWindow({
		  anchorSkew: true
		});
		
		map.setCursor('pointer');
		
		function searchCoordinateToAddress(latlng) {
		
		  infoWindow.close();
		
		  naver.maps.Service.reverseGeocode({
		    coords: latlng,
		    orders: [
		      naver.maps.Service.OrderType.ADDR,
		      naver.maps.Service.OrderType.ROAD_ADDR
		    ].join(',')
		  }, function(status, response) {
		    if (status === naver.maps.Service.Status.ERROR) {
		      if (!latlng) {
		        return alert('ReverseGeocode Error, Please check latlng');
		      }
		      if (latlng.toString) {
		        return alert('ReverseGeocode Error, latlng:' + latlng.toString());
		      }
		      if (latlng.x && latlng.y) {
		        return alert('ReverseGeocode Error, x:' + latlng.x + ', y:' + latlng.y);
		      }
		      return alert('ReverseGeocode Error, Please check latlng');
		    }
		
		    var address = response.v2.address,
		        htmlAddresses = [];
		
		    if (address.jibunAddress !== '') {
		        htmlAddresses.push('[지번 주소] ' + address.jibunAddress);
		    }
		
		    if (address.roadAddress !== '') {
		        htmlAddresses.push('[도로명 주소] ' + address.roadAddress);
		    }
		
		    infoWindow.setContent([
		      '<div style="padding:10px;min-width:200px;line-height:150%;">',
		      '<h4 style="margin-top:5px;">검색 좌표</h4><br />',
		      htmlAddresses.join('<br />'),
		      '</div>'
		    ].join('\n'));
		
		    infoWindow.open(map, latlng);
		  });
		}
		
		function searchAddressToCoordinate(address) {
		  naver.maps.Service.geocode({
		    query: address
		  }, function(status, response) {
		    if (status === naver.maps.Service.Status.ERROR) {
		      if (!address) {
		        return alert('Geocode Error, Please check address');
		      }
		      return alert('Geocode Error, address:' + address);
		    }
		
		    if (response.v2.meta.totalCount === 0) {
		      return alert('No result.');
		    }
		
		    var htmlAddresses = [],
		      item = response.v2.addresses[0],
		      point = new naver.maps.Point(item.x, item.y);
		
		    if (item.roadAddress) {
		      htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
		    }
		
		    if (item.jibunAddress) {
		      htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
		    }
		
		    if (item.englishAddress) {
		      htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
		    }
		
		    infoWindow.setContent([
		      '<div style="padding:10px;min-width:200px;line-height:150%;">',
		      '<h4 style="margin-top:5px;">검색 주소 : '+ address +'</h4><br />',
		      htmlAddresses.join('<br />'),
		      '</div>'
		    ].join('\n'));
		
		    map.setCenter(point);
		    infoWindow.open(map, point);
		  });
		}
		
		function initGeocoder() {
		  if (!map.isStyleMapReady) {
		    return;
		  }
		
		  map.addListener('click', function(e) {
		    searchCoordinateToAddress(e.coord);
		  });
		
		  $('#address').on('keydown', function(e) {
		    var keyCode = e.which;
		
		    if (keyCode === 13) { // Enter Key
		      searchAddressToCoordinate($('#address').val());
		    }
		  });
		
		  $('#submit').on('click', function(e) {
		    e.preventDefault();
		
		    searchAddressToCoordinate($('#address').val());
		  });
			let info_address = document.getElementById('address').innerText;
		  searchAddressToCoordinate(info_address);
		}
		
		naver.maps.onJSContentLoaded = initGeocoder;
		naver.maps.Event.once(map, 'init_stylemap', initGeocoder);
    	</script>
    </tr>
    
    <tr>
      <th scope="row" colspan="2" style="text-align:center;">
      <button id="gobtn" type="button" class="btn btn-outline-dark">목록</button>
      <button id="editbtn" type="button" class="btn btn-outline-dark">수정</button>
      <button id="deletebtn" type="button" class="btn btn-outline-dark">삭제</button>
      </th>
    </tr>
    
    
  </tbody>
</table>
</div>

 



<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>


</html>