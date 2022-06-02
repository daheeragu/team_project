<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>물어보러온나 채팅방</title>
<style>
#main {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}

#outputDiv {
	border-radius: 5px;
	width: 500px;
	min-width: 500px;
	height: 450px;
	
	overflow-x: hidden;
	overflow-y: auto;
	background-color: #b7d7e8;
	word-break: break-all;
}

span {
	border: 2px solid lightyellow;
	border-color: lightyellow;
	border-radius: 5px;
	max-width: 350px;
	background-color: lightyellow;
	position: relative;
	left: 10px;
}

#text {
	border: 1px solid black;
	width: 440px;
}

#time {
	font-size: small;
	position: relative;
	left: 10px;
}

.swal-title {
	margin: 0px;
	font-size: 16px;
	box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.21);
	margin-bottom: 28px;
}

</style>
<script src="./resources/js/jquery-3.1.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
		swal({
		    title: "어서오세요!",
		    text: "즐거운 시간 되세요!"
		});
	}
	sock.onmessage = receiveMessage;
}
// 입력란에서 엔터쳤을 때 서버로 메시지 전송
function textKeyPress(event) {
	if (event.which == 13) {
		sendMessage();
	}
}
// 버튼을 클릭하면 서버로 메시지 전송
function sendMessage() {
	var text = $('#text').val();
	sock.send(text);
	$('#text').val('');
}
// 메시지를 받으면 화면에 출력
function receiveMessage(msg) {
	var d = new Date();

	var timeStr = d.toLocaleTimeString();
	
	$('#outputDiv').append("<br>" + "<div><span id='chat'>" + msg.data + "</span></div>"
	+ "<div id='time'>" + timeStr + "</div><br>");
}

window.setInterval(function() {
    var elem = document.getElementById('outputDiv');
    elem.scrollTop = elem.scrollHeight;
}
);
</script>
</head>
<body>
<div id="main">
	<div id="outputDiv">
		
	</div>
	<div>
		<input type="text" id="text" placeholder="채팅 입력">
		<input type="button" id="sendBt" value="전송">
	</div>
	<input type="button" value="나가기" id="outBT" onclick="self.close()">
</div>
</body>
</html>