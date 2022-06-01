<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광지 검색</title>
<script>
function formCheck() {
	let id = document.getElementById('spotName');
	if (id.value == '') {
		alert('검색할 관광지를 입력하세요.');
		return false;
	}
	return true;
}

function selectid() {
	opener.document.getElementById('id').value = '${searchId}';
	this.close();
}
</script>

</head>
<body>
<form action="spotSearch" method="post" onSubmit="return formCheck();">
	검색할 관광지 <input type="text" name="spotName" id="spotName" />
			<input type="submit" value="검색" />
</form>

<!-- 검색 후 -->
<c:if test="${spotName != null}">
	<!-- 검색결과가 없음 -->
	<c:if test="${tourinfo == null}">
		<p>검색어에 해당하는 관광지가 존재하지 않습니다</p>
		<!-- <p><input type="button" value="ID사용하기" onclick="selectid()"></p> -->
	</c:if>
	<!-- 검색결과가 있음 -->
	<c:if test="${tourinfo != null}">
		<c:forEach var="tour" items="${tourinfo}">
			<p>${tour.info_name}</p>
		</c:forEach>
	</c:if>
</c:if>


</body>
</html>