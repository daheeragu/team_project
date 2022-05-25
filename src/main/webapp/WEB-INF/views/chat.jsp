<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebSocket Chatting</title>
<style>
#outputDiv {
	width: 500px;
	height: 400px;
	border: 1px solid black;
	overflow-y:scroll;
}
#text {
	width: 300px;
}
</style>
<script src="./resources/js/jquery-3.1.1.min.js"></script>
<script>
var url;
var sock;

$(document).ready(function() {
	openSession();
	$('#sendBt').on('click', sendMessage);
	$('#text').on('keypress', textKeyPress);
});

//웹 소켓 오픈
function openSession() {
	url = 'ws://localhost:8888/busanonna_tour/chat';
	sock = new WebSocket(url);
	sock.onopen = function() {
		alert('Open');
	}
	sock.onclose = function() {
		alert('Close');
	}
	sock.onmessage = receiveMessage;
}

//입력란에서 엔터쳤을 때 서버로 메시지 전송
function textKeyPress(event) {
	if (event.which == 13) {
		sendMessage();
	}
}
//버튼을 클릭하면 서버로 메시지 전송
function sendMessage() {
	var text = $('#text').val();
	sock.send(text);
	$('#text').val('');
}
//메시지를 받으면 화면에 출력
function receiveMessage(msg) {
	$('#outputDiv').append(msg.data + '<br>');
}
</script>
</head>
<body>

<div id="outputDiv"></div>

<input type="text" id="text">
<input type="button" id="sendBt" value="전송">

</body>
</html>