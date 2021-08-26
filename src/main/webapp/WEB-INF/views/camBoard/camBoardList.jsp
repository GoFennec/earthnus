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
div #selectView {text-align: right;}
#selectView a {font-weight: bold; color: #388E3C; font-size: 0.8em;}
.blog_item_date {text-align: center;}
</style>

<title>EARTH & US</title>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<br><br><br><br>

<div class="container">
	<div id="selectView">
		<c:if test="${empty page.search}">
		<a href="/camBoard/list?arr=entire" id="entire">전체보기&nbsp;&nbsp;&nbsp;&nbsp;</a>
		<a href="/camBoard/list?arr=doing" id="doing">진행중인 캠페인&nbsp;&nbsp;&nbsp;&nbsp;</a>
		<a href="/camBoard/list?arr=end" id="end">종료된 캠페인</a>
		<!-- <li><a href="/camBoard/list?arr=exp" id="exp">에쩡 캠페인&nbsp;&nbsp;</a></li>	 -->
		</c:if>
			
		<c:if test="${!empty page.search}">
		<a href="/camBoard/list/search?search=${page.search}&arr=entire" id="entire">전체보기&nbsp;&nbsp;&nbsp;&nbsp;</a>
		<a href="/camBoard/list/search?search=${page.search}&arr=doing" id="doing">진행중인 캠페인&nbsp;&nbsp;&nbsp;&nbsp;</a>
		<a href="/camBoard/list/search?search=${page.search}&arr=end" id="end">종료된 캠페인&nbsp;&nbsp;&nbsp;</a>
		<%-- <li><a href="/camBoard/list/search?search=${page.search}&arr=exp" id="exp">예정 캠페인</a></li> --%>
		</c:if>
	</div><hr>
</div>

<div id="camBoardListDiv">
	<c:if test="${page.totalcount ne 0}">
	<section class="blog_area">
		<div class="container">
	    	<div class="row">
	        <c:forEach items="${CamBoardList}" var="list" begin="0" end="5">        
	        	<div class="col-md-6 col-12">
	                <article class="blog_item">
	                    <div class="blog_item_img">
	                		<img class="card-img rounded-0" src="${list.CAMB_FILE}" alt="">
	                		<span class="blog_item_date">
		                        <h3><fmt:formatDate pattern="MMM" value="${list.CAMB_STARTDATE}"/></h3>
		                        <p><fmt:formatDate pattern="dd" value="${list.CAMB_STARTDATE}"/>일</p>
		                    </span>
						</div>
	                    <div class="blog_details">
	                    	<a class="d-inline-block" href="blog_details.html">
	                        	<h2 class="blog-head" style="color: #2d2d2d;">${list.CAMB_NAME}</h2>
	                        </a>
	                        <p>캠페인 내용 뽑아오기</p>
	                    </div>
	               	</article>
	            </div>
			</c:forEach>
			</div>
		</div>
	</section>
	</c:if>
</div>

<!-- Scroll Up -->
<div id="back-top" >
	<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>