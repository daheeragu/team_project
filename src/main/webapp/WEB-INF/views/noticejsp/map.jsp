<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>여행지 | 내주변  | 부산온나(BUSANONNA) </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zfofulyw3m&submodules=geocoder"></script>
    <script src="../resources/js/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<style>
  .ad-search{
     text-align: center;
  }
  
  #address{
     margin-left: 350px;
  }
  
  #submit{
     margin-top:10px;
     margin-left: 700px;
     width: 100px;
     height:40px;
  }
</style>
<body>


<div id="map" style="width:100%;height:600px;"></div>

<script>

var HOME_PATH = window.HOME_PATH || '.';
var map = new naver.maps.Map("map", {
    center: new naver.maps.LatLng(35.114543, 129.039338),
    zoom: 15,
    mapTypeControl: true
});

//부산역 마커 표시
var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(35.114543, 129.039338),
    map: map
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
            return alert('Something Wrong!');
        }

        var items = response.v2.results,
            address = '',
            htmlAddresses = [];

        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
            item = items[i];
            address = makeAddress(item) || '';
            addrType = item.name === 'roadaddr' ? '[도로명 주소]' : '[지번 주소]';

            htmlAddresses.push((i+1) +'. '+ addrType +' '+ address);
        }

        infoWindow.setContent([
            '<div style="padding:10px;min-width:200px;line-height:150%;">',
            '<h4 style="margin-top:5px;">검색 주소</h4>',
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
            return alert('Something Wrong!');
        }

        if (response.v2.meta.totalCount === 0) {
            return alert('totalCount' + response.v2.meta.totalCount);
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
            '<h4 style="margin-top:5px;">검색 주소 : '+ address +'</h4>',
            htmlAddresses.join('<br />'),
            '</div>'
        ].join('\n'));

        map.setCenter(point);
        infoWindow.open(map, point);
    });
}

function initGeocoder() {
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

        
}

function makeAddress(item) {
    if (!item) {
        return;
    }

    var name = item.name,
        region = item.region,
        land = item.land,
        isRoadAddress = name === 'roadaddr';

    var sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';

    if (hasArea(region.area1)) {
        sido = region.area1.name;
    }

    if (hasArea(region.area2)) {
        sigugun = region.area2.name;
    }

    if (hasArea(region.area3)) {
        dongmyun = region.area3.name;
    }

    if (hasArea(region.area4)) {
        ri = region.area4.name;
    }

    if (land) {
        if (hasData(land.number1)) {
            if (hasData(land.type) && land.type === '2') {
                rest += '산';
            }

            rest += land.number1;

            if (hasData(land.number2)) {
                rest += ('-' + land.number2);
            }
        }

        if (isRoadAddress === true) {
            if (checkLastString(dongmyun, '면')) {
                ri = land.name;
            } else {
                dongmyun = land.name;
                ri = '';
            }

            if (hasAddition(land.addition0)) {
                rest += ' ' + land.addition0.value;
            }
        }
    }

    return [sido, sigugun, dongmyun, ri, rest].join(' ');
}

function hasArea(area) {
    return !!(area && area.name && area.name !== '');
}

function hasData(data) {
    return !!(data && data !== '');
}

function checkLastString (word, lastString) {
    return new RegExp(lastString + '$').test(word);
}

function hasAddition (addition) {
    return !!(addition && addition.value);
}

naver.maps.onJSContentLoaded = initGeocoder;

//해운대
var marker_Haeundae = new naver.maps.Marker({
    position: new naver.maps.LatLng(35.158150, 129.158400),
    map: map
});

 

var content_Haeundae = [
	'<div class="iw_inner" style="width:200px; height:200px; text-align: center;">',
    '   <h4>해운대 해수욕장</h4><br/>',
    '   <p> <img src="../resources/image/haeundae.jpg" width="100" height="100" alt="해운대 해수욕장" class="thumb" /><br/>',
    '       <a href="http://localhost:8888/busanonna_tour/tourinfo/read?info_num=53" target="_blank">상세보기</a>',
    '   </p>',
    '</div>'
].join('');

var infowindow_Haeundae = new naver.maps.InfoWindow({
  content: content_Haeundae,
  maxWidth: 600,
  backgroundColor: "#FFFFFF",
  borderColor: "#EAEAEA",
  borderWidth: 2,
  anchorSize: new naver.maps.Size(30, 30),
  anchorSkew: true,
  anchorColor: "#FFFFFF",
  pixelOffset: new naver.maps.Point(20, -20)
});




naver.maps.Event.addListener(marker_Haeundae, "click", function(e) {

  if (infowindow_Haeundae.getMap()) {
      infowindow_Haeundae.close();
  } else {
      infowindow_Haeundae.open(map, marker_Haeundae);
  }
});

//광안리
var marker_Gwangan = new naver.maps.Marker({
    position: new naver.maps.LatLng(35.150909, 129.116369),
    map: map
});

var content_Gwangan = [
	'<div class="iw_inner" style="width:200px; height:200px; text-align: center;">',
    '   <h4>광안리 해수욕장</h4><br/>',
    '   <p> <img src="../resources/image/gwangan.jpg" width="100" height="100" alt="해운대 해수욕장" class="thumb" /><br/>',
    '       <a href= "http://localhost:8888/busanonna_tour/tourinfo/read?info_num=29" target="_blank">상세보기</a>',
    '   </p>',
    '</div>'
].join('');

var infowindow_Gwangan = new naver.maps.InfoWindow({
  content: content_Gwangan,
  maxWidth: 600,
  backgroundColor: "#FFFFFF",
  borderColor: "#EAEAEA",
  borderWidth: 2,
  anchorSize: new naver.maps.Size(30, 30),
  anchorSkew: true,
  anchorColor: "#FFFFFF",
  pixelOffset: new naver.maps.Point(20, -20)
});




naver.maps.Event.addListener(marker_Gwangan, "click", function(e) {
  if (infowindow_Gwangan.getMap()) {
      infowindow_Gwangan.close();
  } else {
      infowindow_Gwangan.open(map, marker_Gwangan);
  }
});


//감천문화마을
var marker_culTown = new naver.maps.Marker({
    position: new naver.maps.LatLng(35.098621, 129.010269),
    map: map
});

var content_cul = [
	'<div class="iw_inner" style="width:200px; height:200px; text-align: center;">',
    '   <h3>감천문화마을</h3><br/>',
    '   <p> <img src="../resources/image/culture.jpg" width="100" height="100" alt="감천문화마을" class="thumb" /><br/>',
    '       <a href="http://localhost:8888/busanonna_tour/tourinfo/read?info_num=31" target="_blank">상세보기</a>',
    '   </p>',
    '</div>'
].join('');

var infowindow_culTown = new naver.maps.InfoWindow({
  content: content_cul,
  maxWidth: 600,
  backgroundColor: "#FFFFFF",
  borderColor: "#EAEAEA",
  borderWidth: 2,
  anchorSize: new naver.maps.Size(30, 30),
  anchorSkew: true,
  anchorColor: "#FFFFFF",
  pixelOffset: new naver.maps.Point(20, -20)
});



naver.maps.Event.addListener(marker_culTown, "click", function(e) {
 
  if (infowindow_culTown.getMap()) {
      infowindow_culTown.close();
  } else {
      infowindow_culTown.open(map, marker_culTown);
  }
});

//용두산 공원
var marker_yongPark = new naver.maps.Marker({
    position: new naver.maps.LatLng(35.100601, 129.033005),
    map: map
});

var content_yongPark = [
	'<div class="iw_inner" style="width:200px; height:200px; text-align: center;">',
    '   <h3>용두산공원</h3><br/>',
    '   <p> <img src="../resources/image/yongPark.jpg" width="100" height="100" alt="용두산 공원" class="thumb" /><br/>',
    '       <a href="http://www.seoul.go.kr" target="_blank">상세보기</a>',
    '   </p>',
    '</div>'
].join('');

var infowindow_yongPark = new naver.maps.InfoWindow({
  content: content_yongPark,
  maxWidth: 600,
  backgroundColor: "#FFFFFF",
  borderColor: "#EAEAEA",
  borderWidth: 2,
  anchorSize: new naver.maps.Size(30, 30),
  anchorSkew: true,
  anchorColor: "#FFFFFF",
  pixelOffset: new naver.maps.Point(20, -20)
});


naver.maps.Event.addListener(marker_yongPark, "click", function(e) {
  
  if (infowindow_yongPark.getMap()) {
      infowindow_yongPark.close();
  } else {
      infowindow_yongPark.open(map, marker_yongPark);
  }
});

//초량 차이나 타운
var marker_Choryang_Ch = new naver.maps.Marker({
    position: new naver.maps.LatLng(35.112335, 129.036911),
    map: map
});	

var contentString = [
	  '<div class="iw_inner" style="width:200px; height:200px; text-align: center;">',
      '   <h4>초량 타이나 타운</h4><br/>',
      '   <p> <img src="../resources/image/china_town.jpg" width="100" height="100" alt="서울시청" class="thumb" /><br/>',
      '       <a href="http://www.seoul.go.kr" target="_blank">상세보기</a>',
      '   </p>',
      '</div>'
].join('');

var infowindow = new naver.maps.InfoWindow({
    content: contentString,
    maxWidth: 600,
    backgroundColor: "#FFFFFF",
    borderColor: "#EAEAEA",
    borderWidth: 2,
    anchorSize: new naver.maps.Size(30, 30),
    anchorSkew: true,
    anchorColor: "#FFFFFF",
    pixelOffset: new naver.maps.Point(20, -20)
});

naver.maps.Event.addListener(marker_Choryang_Ch, "click", function(e) {
    if (infowindow.getMap()) {
        infowindow.close();
    } else {
        infowindow.open(map, marker_Choryang_Ch);
    }
});


//국제시장
var marker_gukjemarket = new naver.maps.Marker({
    position: new naver.maps.LatLng(35.101002, 129.028000),
    map: map
});	

var content_gukjemarket = [
	  '<div class="iw_inner" style="width:200px; height:200px; text-align: center;">',
    '   <h3>국제시장</h3><br/>',
    '   <p> <img src="../resources/image/gukjemarket.jpg" width="100" height="100" alt="서울시청" class="thumb" /><br/>',
    '       <a href="http://www.seoul.go.kr" target="_blank">상세보기</a>',
    '   </p>',
    '</div>'
].join('');

var infowindow_gukjemarket = new naver.maps.InfoWindow({
  content: content_gukjemarket,
  maxWidth: 600,
  backgroundColor: "#FFFFFF",
  borderColor: "#EAEAEA",
  borderWidth: 2,
  anchorSize: new naver.maps.Size(30, 30),
  anchorSkew: true,
  anchorColor: "#FFFFFF",
  pixelOffset: new naver.maps.Point(20, -20)
});

naver.maps.Event.addListener(marker_gukjemarket, "click", function(e) {
  if (infowindow_gukjemarket.getMap()) {
      infowindow_gukjemarket.close();
  } else {
      infowindow_gukjemarket.open(map, marker_gukjemarket);
  }
});


//부산박물관 (남구)
var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(35.130096, 129.093399),
    map: map
});	

//기장 롯데월드
var marker_amusePark = new naver.maps.Marker({
  position: new naver.maps.LatLng(35.194028, 129.216684),
  map: map
});	

var content_amusePark = [
	  '<div class="iw_inner" style="width:200px; height:200px; text-align: center;">',
  '   <h3>롯데월드 부산</h3><br/>',
  '   <p> <img src="../resources/image/amuse_park.jpg" width="100" height="100" alt="롯데월드 어드벤처 부산" class="thumb" /><br/>',
  '       <a href="http://www.seoul.go.kr" target="_blank">상세보기</a>',
  '   </p>',
  '</div>'
].join('');

var infowindow_amusePark = new naver.maps.InfoWindow({
content: content_amusePark,
maxWidth: 600,
backgroundColor: "#FFFFFF",
borderColor: "#EAEAEA",
borderWidth: 2,
anchorSize: new naver.maps.Size(30, 30),
anchorSkew: true,
anchorColor: "#FFFFFF",
pixelOffset: new naver.maps.Point(20, -20)
});

naver.maps.Event.addListener(marker_amusePark, "click", function(e) {
if (infowindow_amusePark.getMap()) {
    infowindow_amusePark.close();
} else {
    infowindow_amusePark.open(map, marker_amusePark);
}
});

</script>

<br>
<div class="ad-search">

<p style="font-family:'Black Han Sans', sans-serif; font-size: 50px;"> 검색할 주소를 입력해주세요 (구/동 단위)</p>
 
  <div class="col-md-6">
  <input type="text" class="form-control" id="address"> 
  <button type="button" id ="submit" class="btn btn-secondary">
  <span style="font-family:'Black Han Sans', sans-serif; font-size: 20px;">주소검색</span></button>
  </div>

</div>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>