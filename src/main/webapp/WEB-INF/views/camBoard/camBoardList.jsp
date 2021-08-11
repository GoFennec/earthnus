<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
	int nowPageN = 0;
	if (request.getParameter("pagenum") != null ) {
		nowPageN = Integer.parseInt(request.getParameter("pagenum"));	
	}
%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
	table {width: 100%; border-collapse: collapse; text-align: left; line-height: 1.5;}
	thead th {padding: 10px; font-weight: bold; vertical-align: top; color: #086121; border-bottom: 3px solid #0ed145;}
	tbody th {width: 150px; padding: 10px; font-weight: bold; vertical-align: center; border-bottom: 1px solid #ccc; background: #f3f6f7;}
	td {width: 350px; padding: 10px; vertical-align: center; border-bottom: 1px solid #ccc;}
	td .exGoodsImg {text-align: center; margin: auto; padding: 1px;}
	ul {list-style: none; margine: 0; padding: 0;}
	li {margine: 0 0 0 0; padding: 0 0 0 0; border: 0; float: left;}
	a:visited{ color: #086121;}
	.exButton {text-align: center;}
	.paging {text-align: center;}
	.option{
	float: left;
	padding-top: 0px;
	padding-right: 9px;
	padding-left: 0px;
	padding-bottom: 8px;
	}
</style>

<link rel="stylesheet" type="text/css" href="css/camBoard.css">

<script type="text/javascript">
   function changepage(){
       location.href="file:///Users/gimjeongbin/Desktop/finalproject/camBoardDetail.html";
   }
   
   function searchUrl(){
	   location.href="/camBoard/list/search?search="+ document.getElementById("search").value
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
<title>Campaign</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<div class="container"><br>
	<table class="exGoods">
		<thead>
			<tr><th scope="col">캠페인 게시판</th></tr>
		</thead>
	</table>
	<div>
		<ul style="text-align: left;">
			<c:if test="${empty page.search}">
			<li><a href="/camBoard/list?arr=entire" id="entire">전체</a></li>
			<li><a href="/camBoard/list?arr=doing" id="doing">캠페인 중</a></li>
			<li><a href="/camBoard/list?arr=end" id="end">캠페인 종료</a></li>
			</c:if>
			<c:if test="${!empty page.search}">
			<li><a href="/camBoard/list/search?search=${page.search}&arr=entire" id="entire">캠페인 전체</a></li>
			<li><a href="/camBoard/list/search?search=${page.search}&arr=doing" id="doing">캠페인 중</a></li>
			<li><a href="/camBoard/list/search?search=${page.search}&arr=end" id="end">캠페인 종료</a></li>
			</c:if>
		</ul>
		
		<form  style="text-align: right;">
			<input type="text" id="search" placeholder="캠페인 검색" value="${page.search}">
			<input type="button" value="검색" onclick="searchUrl()">
		</form>	
	</div>
	<c:if test="${page.totalcount ne 0}">
		<div class="row">
		<c:forEach items="${CamBoardList}" var="list" begin="0" end="2">
			<div class="col-sm-12 col-lg-4">
				<table class="goodsTable">
					<tr class="content">
						<td class="tdImg">
							<a href="/camBoard/detail?CAMB_NUM=${list.CAMB_NUM}">
								<img class="content" src="${list.CAMB_FILE}" width="150" alt="캠페인" title="${list.CAMB_SUBJECT}"/>
							</a>
						</td>
						<td><a href="detail?CAMB_NUM=${list.CAMB_NUM}">${list.CAMB_NAME}</a></td>
					</tr>
				</table>
			</div>
		</c:forEach>
		</div>
		
		<div class="clearfix"></div><br>
		<div class="row">
			<c:forEach items="${CamBoardList}" var="list" begin="3" end="5">
				<div class="col-sm-12 col-lg-4">
					<table class="goodsTable">
						<tr class="content">
							<td class="tdImg">
								<a href="/camBoard/detail?CAMB_NUM=${list.CAMB_NUM}">
									<img src="${list.CAMB_FILE}" width="150" alt="캠페인" title="${list.CAMB_SUBJECT}"/>
								</a>
							</td>
							<td>${list.CAMB_NAME}</td>
						</tr>
					</table>
				</div>
			</c:forEach>
		</div><br/>	
	</c:if>
	<c:if test="${page.totalcount eq 0}">
		<div><h2 style="text-align: center;">'${page.search}'에 대한 검색 결과가 없습니다.</h2></div>
	</c:if>
	
	
	<div class="row">
	<div class="col-sm-12">
		<table class="paging">
			<tr>
				<td style="background-color: #0ed145;">
				<c:if test="${empty page.search}">				
						<c:if test="${page.prev}">
							<a href="?pagenum=${page.getStartPage()-1}" id="pagingPre">&lt;</a>
						</c:if>&nbsp;
						<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">
							<a href="?pagenum=${idx}" id="paging">${idx}&nbsp;</a>
						</c:forEach>
						<c:if test="${page.next}">
							<a href="?pagenum=${page.getEndPage()+1}" id="pagingNext">&gt;</a>
						</c:if>
				</c:if>
				<c:if test="${!empty page.search}">
					<c:if test="${page.prev}">
						<a href="?search=${page.search}&pagenum=${page.getStartPage()-1}" id="pagingPre">&lt;</a>
					</c:if>&nbsp;
					<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">
						<a href="?search=${page.search}&pagenum=${idx}" id="paging">${idx}&nbsp;</a>
					</c:forEach>
					<c:if test="${page.next}">
						<a href="?search=${page.search}&pagenum=${page.getEndPage()+1}">&gt;</a>
					</c:if>				
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