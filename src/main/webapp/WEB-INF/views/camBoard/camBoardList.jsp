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
	.trbg:hover {background-color: #FFFFDE; cursor: pointer;}
	ul {list-style: none; margine: 0; padding: 0;}
	li {margine: 0 0 0 0; padding: 0 0 0 0; border: 0; float: left;}
	a:visited{ color: #086121;}
	.camBoardInfo {cursor: pointer;}
	.exButton {text-align: center;}
	.paging {text-align: center;}
	.option{
	float: left;
	padding-top: 0px;
	padding-right: 9px;
	padding-left: 0px;
	padding-bottom: 8px;
	}
	#searchBlock{width: 0px; height: 0px;}
	#searchBlock:hover {
	min-width: 
}
	.cambTD{}

	.searchbar{
    margin-bottom: auto;
    margin-top: auto;
    height: 60px;
    background-color: #388E3C;
    border-radius: 30px;
    padding: 10px;
    }

    .search_input{
    color: white;
    border: 0;
    outline: 0;
    background: none;
    width: 0;
    caret-color:transparent;
    line-height: 40px;
    transition: width 0.4s linear;
    }

    .searchbar:hover > .search_input{
    width: 600px;
    caret-color:red;
    animation-direction: reverse;
    transition: width 0.4s linear;
    }

    .searchbar:hover > .search_icon{
    background: white;
    color: #e74c3c;
    }

    .search_icon{
    height: 40px;
    width: 40px;
    float: right;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 50%;
    color:white;
    text-decoration:none;
    }
    
    .floating { position: fixed; right: 5%; bottom: 10%; text-align:center; width: 120px; }
</style>

<link rel="stylesheet" type="text/css" href="css/camBoard.css">

<title>Campaign</title>
<link rel="shortcut icon" href="/resources/assets/img/favicon.ico">
<link rel="icon" href="/resources/assets/img/favicon.ico">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/slicknav.css">
<link rel="stylesheet" href="assets/css/animate.min.css">
<link rel="stylesheet" href="assets/css/hamburgers.min.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/slick.css">
<link rel="stylesheet" href="assets/css/nice-select.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/responsive.css">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>

	<div class="floating">
		<div class="container h-100">
		    <div class="d-flex justify-content-center h-100">
		      <div class="searchbar">
		        <input class="search_input" type="text" id="search" placeholder="캠페인 검색" value="${page.search}"autocomplete="off">
		        <a class="search_icon"><i class="fas fa-search" onclick="searchUrl()"></i></a>
		      </div>
		    </div>
		</div>
	</div>
	<div class="container"><br>
	<div>
		<ul style="text-align: left;">
			<c:if test="${empty page.search}">
			<li><a href="/camBoard/list?arr=entire" id="entire">전체 캠페인</a></li>
			<li><a href="/camBoard/list?arr=doing" id="doing">진행 캠페인</a></li>
			<li><a href="/camBoard/list?arr=exp" id="exp">에쩡 캠페인</a></li>	
			<li><a href="/camBoard/list?arr=end" id="end">종료 캠페인</a></li>
			</c:if>
			<c:if test="${!empty page.search}">
			<li><a href="/camBoard/list/search?search=${page.search}&arr=entire" id="entire">전체 캠페인</a></li>
			<li><a href="/camBoard/list/search?search=${page.search}&arr=doing" id="doing">진행 캠페인</a></li>
			<li><a href="/camBoard/list/search?search=${page.search}&arr=exp" id="exp">예정 캠페인</a></li>
			<li><a href="/camBoard/list/search?search=${page.search}&arr=end" id="end">종료 캠페인</a></li>
			</c:if>
		</ul>
	</div>
	<div id="camBoardListDiv">
	<c:if test="${page.totalcount ne 0}">
		<section class="blog_area section-padding">
        	<div class="container">
        		<div class="row">
        			<c:forEach items="${CamBoardList}" var="list" begin="0" end="1">
						<div class="col-lg-6 col-sm-12">
        				<article class="blog_item">
	                        <table>
	                         <tr onclick="location.href='/camBoard/detail?CAMB_NUM=${list.CAMB_NUM}&p=${page.currentPage}'">
	                          <td>
	                           <div class="blog_item_img">
	                               <img class="card-img rounded-0" src="${list.CAMB_FILE}" alt="">
	                               <span class="blog_item_date">
	                                   <h3><fmt:formatDate pattern="dd" value="${list.CAMB_STARTDATE}" /></h3>
	                                   <p><fmt:formatDate pattern="MMM" value="${list.CAMB_STARTDATE}" /></p>
	                               </span>
	                           </div>
	                          	<div class="blog_details">
	                               <a class="d-inline-block" href="blog_details.html">
	                                   <h2 class="blog-head" style="color: #2d2d2d;">${list.CAMB_NAME}</h2>
	                               </a>
	                               <p>여긴 캠페인 내용</p>
	                           </div>
	                          </td>
	                         </tr>
	                        </table>
                        </article>
        				</div>
					</c:forEach>
      			</div>
       			<div class="row">
        			<c:forEach items="${CamBoardList}" var="list" begin="2" end="3">
						<div class="col-lg-6 col-sm-12">
        				<article class="blog_item">
	                        <table>
	                         <tr onclick="location.href='/camBoard/detail?CAMB_NUM=${list.CAMB_NUM}&p=${page.currentPage}'">
	                          <td>
	                           <div class="blog_item_img">
	                               <img class="card-img rounded-0" src="${list.CAMB_FILE}" alt=""  style="max-height: 80%">
	                               <span class="blog_item_date">
	                                   <h3><fmt:formatDate pattern="dd" value="${list.CAMB_STARTDATE}" /></h3>
	                                   <p><fmt:formatDate pattern="MMM" value="${list.CAMB_STARTDATE}" /></p>
	                               </span>
	                           </div>
	                          	<div class="blog_details">
	                               <a class="d-inline-block" href="blog_details.html">
	                                   <h2 class="blog-head" style="color: #2d2d2d;">${list.CAMB_NAME}</h2>
	                               </a>
	                               <p>여긴 캠페인 내용</p>
	                           </div>
	                          </td>
	                         </tr>
	                        </table>
                        </article>
        				</div>
					</c:forEach>
   				</div>
       			<div class="row">
       				<c:forEach items="${CamBoardList}" var="list" begin="4" end="5">
						<div class="col-lg-6 col-sm-12">
        				<article class="blog_item">
	                        <table>
	                         <tr onclick="location.href='/camBoard/detail?CAMB_NUM=${list.CAMB_NUM}&p=${page.currentPage}'">
	                          <td>
	                           <div class="blog_item_img">
	                               <img class="card-img rounded-0" src="${list.CAMB_FILE}" alt=""  style="max-height: px">
	                               <span class="blog_item_date">
	                                   <h3><fmt:formatDate pattern="dd" value="${list.CAMB_STARTDATE}" /></h3>
	                                   <p><fmt:formatDate pattern="MMM" value="${list.CAMB_STARTDATE}" /></p>
	                               </span>
	                           </div>
	                          	<div class="blog_details">
	                               <a class="d-inline-block" href="blog_details.html">
	                                   <h2 class="blog-head" style="color: #2d2d2d;">${list.CAMB_NAME}</h2>
	                               </a>
	                               <p>여긴 캠페인 내용</p>
	                           </div>
	                          </td>
	                         </tr>
	                        </table>
                        </article>
        				</div>
					</c:forEach>
     			</div>
        	</div>
        </section>
	</c:if>
	
	<c:if test="${page.totalcount eq 0}">
		<div><h2 style="text-align: center;">'${page.search}'에 대한 검색 결과가 없습니다.</h2></div>
	</c:if>
	</div>
	
	<div id="pagingDiv">
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
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>

<script type="text/javascript">

	function changepage(){
		location.href="file:///Users/gimjeongbin/Desktop/finalproject/camBoardDetail.html";
	}
 
	function searchUrl(){
		location.href="/camBoard/list/search?search="+ document.getElementById("search").value;
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
</body>
</html>