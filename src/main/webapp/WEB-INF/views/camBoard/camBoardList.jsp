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

<style>
div #selectView {text-align: right;}
#selectView a {font-weight: bold; color: #388E3C; font-size: 0.8em;}
#camBoardListDiv {margin-bottom: 4%;}
#search {
	background: none; 
	width:91%; 
	margin-left: 10px; 
	border-left: none; 
	border-right: none; 
	border-top: none; 
	margin-right: -20px; 
	border-bottom-color: #388E3C;
}

.blog_item_date {text-align: center;}
.blog_details {cursor: pointer;}
.search-div {text-align: center;}
article {cursor: pointer;}

#cancelButton {border-radius: 10px; border: none; background-color: #388E3C; color: white;}
i {cursor: pointer; color: #388E3C;}

.type:hover {transform: scale( 1.1 )}
.search-type {margin-left: 20px;}
.descript-type{background-color: #388E3C; width: 0px;}

.search-type:hover > .descript-type {width: 100px;}

.nice-select{

}

#search_type {
	display: block !important;
	height: 28px;
	margin-right: -12px;
	border-top: none;
	border-right: none;
	border-left: none;
	border-bottom: 2px solid #388E3C; 
	background: none;
	color: red;
}

.nice-select{
	display: none !important;
}
</style>

<title>EARTH & US</title>

</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<br><br><br><br>

<div class="container">
<div class="row">
	<div class="col-sm-12 col-md-6">
		<table>
			    <tr>
			    	<td>
			    		<select id="search_type">
				            <option selected="selected">전체</option>
				            <option>제목</option>
				            <option>내용</option>
				         </select>
			    	</td>
			    	<td id="search-text">
			    		<div class="search-block">
			    			<input type="text" id="search" name="search" placeholder="검색 . . .">
		         			<a onclick="searchCamBoard()" title="검색하기"><i class="fas fa-search"></i></a>
			    		</div>
			    	</td>
			    </tr>
		      </table>
	</div>
	<div class="col-sm-12 col-md-6" id="selectView">
      <a href="/camBoard/list?arr=entire" id="entire" title="전체보기">전체보기&nbsp;&nbsp;&nbsp;&nbsp;</a>
      <a href="/camBoard/list?arr=doing" id="doing" title="진행중인 캠페인">진행중인 캠페인&nbsp;&nbsp;&nbsp;&nbsp;</a>
      <a href="/camBoard/list?arr=end" id="end" title="종료된 캠페인">종료된 캠페인</a><br><br>
      <a style="margin-right: 20px">주제</a>|
      <a href="/camBoard/list/search?search_type=CAMB_SUBJECT&search=ocean" class="search-type" title="해양"><i class="type fas fa-globe">&nbsp;&nbsp;해양</i></a>
      <a href="/camBoard/list/search?search_type=CAMB_SUBJECT&search=plastic" class="search-type" title="플라스틱"><i class="type fas fa-recycle">&nbsp;&nbsp;플라스틱</i></a>
      <a href="/camBoard/list/search?search_type=CAMB_SUBJECT&search=forest" class="search-type" title="산림"><i class="type fas fa-tree">&nbsp;&nbsp;산림</i></a>
      <a href="/camBoard/list/search?search_type=CAMB_SUBJECT&search=ice" class="search-type" title="극지방"><i class="type fas fa-snowflake">&nbsp;&nbsp;극지방</i></a>
      <a href="/camBoard/list/search?search_type=CAMB_SUBJECT&search=all" class="search-type" title="기타"><i class="type fas fa-globe">&nbsp;&nbsp;기타</i></a><br>
   </div>
</div>
   <hr>
</div>
<% int index = 0; %>
<div id="camBoardListDiv">
   <c:if test="${page.totalcount ne 0}">
   <section class="blog_area">
      <div class="container">
          <div class="row">
           <c:forEach items="${CamBoardList}" var="list" begin="0" end="5">
           <% index++; %>
              <div class="col-sm-12 col-md-6">
                   <article class="blog_item" onclick="detailUrl('${list.CAMB_NAME}', '<%= index %>')">
                       <div class="blog_item_img">
                         <img class="card-img rounded-0" src="${list.CAMB_FILE}" title="${list.CAMB_NAME}" alt="${list.CAMB_NAME} 사진" height="250px;">
                  		</div>
                       <div class="blog_details" style="height: 200px;">
                          <p style="font-size: 0.8em;">진행 기간 <fmt:formatDate pattern="yyyy-MM-dd" value="${list.CAMB_STARTDATE}"/> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${list.CAMB_FINDATE}"/></p>
                           <h3 class="blog-head">${list.CAMB_NAME}</h3>
                       </div>
                     </article>
               </div>
         </c:forEach>
         </div>
      </div>
   </section>
   </c:if>
</div>

<div class="container">
	<div class="row">
	<div class="col-sm-2 col-lg-4"></div>
	<div class="col-sm-8 col-lg-4">
		<nav class="blog-pagination justify-content-center d-flex">
		      <ul class="pagination">
	         <c:if test="${page.prev}">
	             <li class="page-item">
	              <a class="page-link" title="${page.getStartPage()-1}번 페이지" aria-label="Previous" onclick="paging('${page.getStartPage()-1}')">
	                  <i class="ti-angle-left"></i>
	               </a>
	            </li>
	         </c:if>
	         <c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">   
	            <li class="page-item">
	               <a class="page-link" title="${idx}페이지" onclick="paging('${idx}')">${idx}</a>
	            </li>
	         </c:forEach>
	         <c:if test="${page.next}">
	            <li class="page-item">
	               <a class="page-link" title="${page.getEndPage()+1}번 페이지" aria-label="Next" onclick="paging('${page.getEndPage()+1}')">
	                  <i class="ti-angle-right"></i>
	               </a>
	            </li>
	         </c:if>
	      </ul>
	   </nav>
	</div>
	<div class="col-sm-2 col-lg-4"></div>
	</div>
	
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"/>
<div id="back-top" >
   <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<script type="text/javascript">
   window.onload = function(){
   }
   
   var pathname = window.location.pathname;
   var subquery = window.location.search;
   var query = subquery.slice(subquery.lastIndexOf("?")+1);
   
   substring = "pagenum";
   
   // 필요한 쿼리스트링 뽑음
   if(query.lastIndexOf(substring) !== -1){
      query = query.substr(0, subquery.indexOf("pagenum")-2);
   }
   
   function searchCamBoard(){
      var search = document.getElementById("search").value;
      var search_type = $("#search_type option:selected").val();
      
      if(!search){
         alert("검색어를 입력해 주세요.");
         return false;
      }else{
         location.href="/camBoard/list/search?search_type=" + search_type + "&search=" + search;   
      }
   }
   
   function paging(page){
      // 페이징 url 설정
      if(query){   // 쿼리스트링 있을때
         var URL = pathname + "?" + query + "&pagenum=" + page
         location.href = URL;
      }else if(!query){
         var URL = pathname + "?pagenum=" + page
         location.href = URL;
      }
   }
   
   function detailUrl(name, num){
	  var index = ((${page.currentPage}-1) * 6 + num * 1);
	  if(!subquery){
         location.href="/camBoard/detail?CAMB_NAME=" + name + "&CAMB_NUM=" + index;
      }else{
         location.href="/camBoard/detail" + subquery +"&CAMB_NAME=" + name + "&CAMB_NUM=" + index;
      }
   }
   
   function setAll(){
      location.href="/camBoard/list";
   }
</script>
</body>
</html>