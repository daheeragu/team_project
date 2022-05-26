<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zfofulyw3m&submodules=geocoder"></script>
</head>
<body>
<div id="map" style="width:100%;height:400px;"></div>

<script>


//지도의 초기 중심 좌표
var mapOptions = {
    center: new naver.maps.LatLng(35.114543, 129.039338),
    zoom: 10
};

var map = new naver.maps.Map('map', mapOptions);

//마커 표시
var HOME_PATH = window.HOME_PATH || '.';
var busanStation = new naver.maps.LatLng(35.114543, 129.039338),
    map = new naver.maps.Map('map', {
        center: busanStation,
        zoom: 15
    }),
    marker = new naver.maps.Marker({
        map: map,
        position: busanStation
    });
    
 

</script>
</body>
</html>