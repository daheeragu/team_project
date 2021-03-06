<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>

<!-- 페이지 이동 스크립트  -->
<script>
function pagingFormSubmit(currentPage) {
	var form = document.getElementById('pagingForm');
	var page = document.getElementById('page');
	page.value = currentPage;
	form.submit();
}
</script>


<style>
 * { 
   margin: auto; 
 }
   
  h1 {
   text-align: center; 
  } 
  
  .firstLine{
    margin-left: 34%;
  }
  th, td{
    border: 1px solid; 
    border-color: white;
   }
  #upper{
    font-weight: bold; 
    background-color: #BDBDBD;
    text-align: center;
  } 
  
  #bottom{
    background-color: #EAEAEA;
    text-align: center;
  }
  
  #pagingForm{
     text-align: center; 
  }
  
  #navigator{
     text-align: center;
  }
</style>
<body>
<h1>[게시판]</h1>
<br>
<div class="firstLine"> 
전체 : ${navi.totalRecordsCount} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
      <input type="button" value="글쓰기" onclick="location.href='write'">
</div>

<br>
<!-- 글 목록 출력 -->

<table>
 <tr id="upper">
  <td>번호</td>
  <td style="width:250px">제목</td>
  <td style="width:70px">작성자</td>
  <td>조회수</td>
  <td style="width:60px">등록일</td>
 </tr> 
 
<c:forEach var="board" items="${boardlist}">
 <tr id="bottom">
  <td>${board.boardnum}</td>
  <td><a href="read?boardnum=${board.boardnum}">${board.title}</a></td>
  <td>${board.id}</td>
  <td>${board.hits}</td>
  <td>${board.inputdate}</td>
 </tr>
</c:forEach>
</table>
<br>

<!-- 페이지 이동 부분 -->
<div id="navigator">
<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a> &nbsp;&nbsp;

	<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
		<c:if test="${counter == navi.currentPage}"><b></c:if>
			<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
		<c:if test="${counter == navi.currentPage}"></b></c:if>
	</c:forEach>
	&nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>
<br/><br/>
</div>
<!-- /페이지 이동 끝 -->                      

<!-- 검색 폼 -->
<div class="pagingForm">
<form id="pagingForm" method="get" action="list">
	<input type="hidden" name="page" id="page" />
	제목 : <input type="text"  name="searchText" value="${searchText}" />
	<input type="button" onclick="pagingFormSubmit(1)" value="검색">
</form>
<br><br>
</div>
<!-- /검색폼 --> 
</body>
</html>