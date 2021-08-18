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
	li:hover {background-color: #FFFFDE}
	a:visited{ color: #086121;}
</style>

<title>EARTH & US</title>
<link rel="shortcut icon" href="/resources/assets/img/favicon.ico">
<link rel="icon" href="/resources/assets/img/favicon.ico">
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>

<div class="container"><br>

	<table class="goodsTitle">
		<thead>
			<tr><th scope="col">캠페인 관리 ${page.search_type}</th>
			<td><button class="btn-dark" type="button" onClick="location.href='/adCamBoard/insert'">캠페인 추가</button></td></tr>
		</thead>
	</table><br>
	
	<div>
		<ul style="text-align: left;">
			<c:if test="${empty page.search}">
			<li><a href="/adCamBoard/list?arr=entire" id="entire">캠페인 전체</a></li>&nbsp;&nbsp;&nbsp;
			<li><a href="/adCamBoard/list?arr=doing" id="doing">캠페인 중</a></li>&nbsp;&nbsp;&nbsp;
			<li><a href="/adCamBoard/list?arr=end" id="end">캠페인 종료</a></li><br>
			<li><a href="/adCamBoard/list?arr=${page.arr}&order=desc" id="desc">최신순</a></li>&nbsp;&nbsp;&nbsp;
			<li><a href="/adCamBoard/list?arr=${page.arr}&order=asc" id="asc">오래된순</a></li>
			</c:if>
			<c:if test="${!empty page.search}">
			<li><a href="/adCamBoard/list/search?search=${page.search}&search_type=${page.search_type}&arr=entire" id="entire">캠페인 전체</a></li>&nbsp;&nbsp;&nbsp;
			<li><a href="/adCamBoard/list/search?search=${page.search}&search_type=${page.search_type}&arr=doing" id="doing">캠페인 중</a></li>&nbsp;&nbsp;&nbsp;
			<li><a href="/adCamBoard/list/search?search=${page.search}&search_type=${page.search_type}&arr=end" id="end">캠페인 종료</a></li><br>
			<li><a href="/adCamBoard/list/search?search=${page.search}&search_type=${page.search_type}&arr=${page.arr}&order=desc" id="desc">최신순</a></li>&nbsp;&nbsp;&nbsp;
			<li><a href="/adCamBoard/list/search?search=${page.search}&search_type=${page.search_type}&arr=${page.arr}&order=asc" id="asc">오래된순</a></li>
			</c:if>
		</ul>
	
		<div style="text-align: right;">		
			<select id="search_type">
				<option value="CAMB_ENTIRE">전체검색</option>
				<option value="CAMB_NAME">제목검색</option>
				<option value="CAMB_SUBJECT">주제검색</option>
				<option value="CAMB_CONTENT">내용검색</option>
			</select>
			<input type="text" id="search" placeholder="캠페인 검색"  value="${page.search}">
			<input type="button" value="검색" onclick="searchUrl()">
		</div>

	</div>
		
	<div class="row">
		<div class="col-sm-12">
			<c:if test="${page.totalcount ne 0}">
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
			</c:if>
			<c:if test="${page.totalcount eq 0}">
				<div><h2 style="text-align: center;">'${page.search}'에 대한 검색 결과가 없습니다.</h2></div>
			</c:if>	
		</div>
	</div>
	<c:if test="${page.totalcount ne 0}">
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
	</c:if>
	<c:if test="${page.totalcount eq 0}">
		<table class="paging">
			<tr>
				<td style="background-color: #0ed145;"></td>
			</tr>
		</table><br/>
	</c:if>
</div>
	
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<script type="text/javascript">
	window.onload = function(){
		var search_type = "${page.search_type}";
		
		$('select[id="search_type"]').find('option:contains(search_type)').attr("selected",true);
		
		var obj = document.getElementsByName("search_type");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] !== search_type){
	            obj[i].checked = false;
	        }else if(obj[i] === search_type){
	        	obj[i].checked = true;
	        }
	    }
	}
	
   function changepage(){
       location.href="file:///Users/gimjeongbin/Desktop/finalproject/camBoardDetail.html";
   }
   
   function searchUrl(){
	   
	   var search = document.getElementById("search").value;
	   var search_type = document.getElementById("search_type");
	   search_type = search_type.options[search_type.selectedIndex].value;
	   
	   location.href="/adCamBoard/list/search?search=" + search + "&search_type=" + search_type;
   }
	
   $.urlParam = function(name){
	   const results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
	    if (results==null){
	       return null;
	    }
	    else{
	       return results[1] || 0;
	    }
	}
   
</script>
</body>
</html>