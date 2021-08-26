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
#selectView {text-align: right;}
#selectView a {font-weight: bold; color: #388E3C;}

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
#searchBlock:hover {min-width: }
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

<title>EARTH & US</title>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<br><br><br><br>

// 검색기능
<%-- <div class="floating">
		<div class="container h-100">
		    <div class="d-flex justify-content-center h-100">
		      <div class="searchbar">
		        <input class="search_input" type="text" id="search" placeholder="캠페인 검색" value="${page.search}"autocomplete="off">
		        <a class="search_icon"><i class="fas fa-search" onclick="searchUrl()"></i></a>
		      </div>
		    </div>
		</div>
	</div> --%>
	
<div class="container">
	<div id="selectView">
		<c:if test="${empty page.search}">
		<a href="/camBoard/list?arr=entire" id="entire">전체보기&nbsp;&nbsp;&nbsp;</a>
		<a href="/camBoard/list?arr=doing" id="doing">진행중인 캠페인&nbsp;&nbsp;&nbsp;</a>
		<a href="/camBoard/list?arr=end" id="end">종료된 캠페인</a>
		<!-- <li><a href="/camBoard/list?arr=exp" id="exp">에쩡 캠페인&nbsp;&nbsp;</a></li>	 -->
		</c:if>
			
		<c:if test="${!empty page.search}">
		<a href="/camBoard/list/search?search=${page.search}&arr=entire" id="entire">전체보기&nbsp;&nbsp;&nbsp;</a>
		<a href="/camBoard/list/search?search=${page.search}&arr=doing" id="doing">진행중인 캠페인&nbsp;&nbsp;&nbsp;</a>
		<a href="/camBoard/list/search?search=${page.search}&arr=end" id="end">종료된 캠페인&nbsp;&nbsp;&nbsp;</a>
		<%-- <li><a href="/camBoard/list/search?search=${page.search}&arr=exp" id="exp">예정 캠페인</a></li> --%>
		</c:if>
	</div><hr><br>
	
	<div id="camBoardListDiv">
	<c:if test="${page.totalcount ne 0}">
		<section class="blog_area">
        	<div class="container">
        		<div class="row">
        			<c:forEach items="${CamBoardList}" var="list" begin="0" end="5">
						<div class="col-lg-6 col-sm-12">
        				<article class="blog_item">
	                        <table>
	                         <tr onclick="detailUrl('${list.CAMB_NAME}','${list.CAMB_NUM}')">
	                          <td style="padding-bottom: 20%;">
	                          <div style="height: 520px;">
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
	<nav class="blog-pagination justify-content-center d-flex">
		<c:if test="${page.totalcount ne 0}">
			<ul class="pagination">
				<c:if test="${page.prev}">
		    		<li class="page-item">
						<a href="?pagenum=${page.getStartPage()-1}" class="page-link" aria-label="Previous">
							<i class="ti-angle-left"></i>
						</a>
					</li>
				</c:if>
				<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">	
					<li class="page-item">
						<a href="?pagenum=${idx}" class="page-link">${idx}</a>
					</li>
				</c:forEach>
				<c:if test="${page.next}">
					<li class="page-item">
						<a href="?pagenum=${page.getEndPage()+1}" class="page-link" aria-label="Next">
							<i class="ti-angle-right"></i>
						</a>
					</li>
				</c:if>
			</ul>
		</c:if>
		<c:if test="${page.totalcount eq 0}"></c:if>
	</nav>
</div>
<!-- Scroll Up -->
<div id="back-top" >
	<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"/>
<script>

	//검색기능
	function searchUrl(){
		location.href="/camBoard/list/search?search="+ document.getElementById("search").value;
	}
	
	// 이전다음캠페인 보기위한 로직
	function detailUrl(name, num){
		var query = window.location.search;
		
		if(!query){
			location.href="/camBoard/detail?CAMB_NAME=" + name + "&CAMB_NUM=" + num;
		}else{
			location.href="/camBoard/detail" + query +"&CAMB_NAME=" + name + "&CAMB_NUM=" + num;
		}
	}
	
	// 뭔지모름
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