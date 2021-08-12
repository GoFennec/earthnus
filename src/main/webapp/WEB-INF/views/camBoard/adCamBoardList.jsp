<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	table {width: 100%; border-collapse: collapse; text-align: left; line-height: 1.5;}
	thead th {padding: 10px; font-weight: bold; vertical-align: top; color: #086121; border-bottom: 3px solid #0ed145;}
	thead td {padding: 10px; font-weight: bold; vertical-align: top; color: #086121; border-bottom: 3px solid #0ed145;}
	tbody th {padding: 10px; font-weight: bold; text-align: center; vertical-align: center; border-bottom: 1px solid #ccc; background: #f3f6f7;}
	tr:hover {background-color: #FFFFDE}
	td {width: 350px; padding: 10px; vertical-align: center; text-align: center; border-bottom: 1px solid #ccc;}
	td .camBoardImg {text-align: center; margin: auto; padding: 1px;}
	.paging {text-align: center;}
	.camBoardInfo {cursor: pointer;}
	.btn-dark {float: right; margin-left: 10px;}
	ul {list-style: none; margine: 0; padding: 0;}
	li {margine: 0 0 0 0; padding: 0 0 0 0; border: 0; float: left;}
	a:visited{ color: #086121;}
</style>
<script type="text/javascript">
   function changepage(){
       location.href="file:///Users/gimjeongbin/Desktop/finalproject/camBoardDetail.html";
   }
   
   function searchUrl(){
	   location.href="/adCamBoard/list/search?search="+ document.getElementById("search").value
   }
	
   $.urlParam = function(name){
	    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
	    if (results==null){
	       return null;
	    }
	    else{
	       return results[1] || 0;
	    }
	}

</script>

<title>EARTH & US</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>

<div class="container"><br>

	<table class="goodsTitle">
		<thead>
			<tr><th scope="col">캠페인 관리</th>
			<td><button class="btn-dark" type="button" onClick="location.href='/adCamBoard/insert'">캠페인 추가</button></td></tr>
		</thead>
	</table><br>
	
	<div>
		<ul style="text-align: left;">
			<c:if test="${empty page.search}">
			<li><a href="/adCamBoard/list?arr=entire" id="entire">캠페인 전체</a></li>&nbsp;&nbsp;&nbsp;
			<li><a href="/adCamBoard/list?arr=doing" id="doing">캠페인 중</a></li>&nbsp;&nbsp;&nbsp;
			<li><a href="/adCamBoard/list?arr=end" id="end">캠페인 종료</a></li>
			</c:if>
			<c:if test="${!empty page.search}">
			<li><a href="/adCamBoard/list/search?search=${page.search}&arr=entire" id="entire">캠페인 전체</a></li>&nbsp;&nbsp;&nbsp;
			<li><a href="/adCamBoard/list/search?search=${page.search}&arr=doing" id="doing">캠페인 중</a></li>&nbsp;&nbsp;&nbsp;
			<li><a href="/adCamBoard/list/search?search=${page.search}&arr=end" id="end">캠페인 종료</a></li>
			</c:if>
		</ul>
	
		<form  style="text-align: right;">
			<input type="text" id="search" placeholder="캠페인 검색" value="${page.search}">
			<input type="button" value="검색" onclick="searchUrl()">
		</form>
	</div>
		
	<div class="row">
		<div class="col-sm-12">
			<table class="goodsTable">
			<tr>
				<th scope="col">캠페인번호</th>
				<th scope="col">캠페인사진</th>
				<th scope="col">캠페인이름</th>
				<th scope="col">캠페인주제</th>
				<th scope="col">캠페인내용</th>
			</tr>	
			<c:forEach items="${CamBoardList}" var="list">
					<tr onclick="location.href='/adCamBoard/detail?CAMB_NUM=${list.CAMB_NUM}'">
						<td>${list.CAMB_NUM}</td>
						<td class="camBoardImg"><img src="${list.CAMB_FILE}" width="150" alt="캠페인" title="${list.CAMB_NAME} 이미지"/></td>
						<td>${list.CAMB_NAME}</td>
						<td>${list.CAMB_SUBJECT}</td>
						<td><c:set var = "CAMB_CONTENT" value="${list.CAMB_CONTENT}"/>
						${fn.substring(CAMB_CONTENT,0,20)}
						${liat.CAMB_CONTENT}
						</td>
					</tr>
			</c:forEach>
			</table>
		</div>
	</div>
	
	<div class="row">
	<div class="col-sm-12">
		<table class="paging">
			<tr>
				<td style="background-color: #0ed145;">
					<c:if test="${page.prev}">
						<a href="?pagenum=${page.getStartPage()-1}">&lt;</a>
					</c:if>&nbsp;
					<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">
						<a href="?pagenum=${idx}">${idx}&nbsp;</a>
					</c:forEach>
					<c:if test="${page.next}">
						<a href="?pagenum=${page.getEndPage()+1}">&gt;</a>
					</c:if>
				</td>
			</tr>
		</table><br/>
	</div>
	</div>

</div>
	
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>