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
#camBoardListDiv {margin-bottom: 4%;}
.blog_item_date {text-align: center;}
.blog_details {cursor: pointer;}
.search-div {text-align: center;}
.search-box {display:inline-block}
#search {border-left: none; border-right: none; border-top: none; margin-right: -20px; border-bottom-color: #388E3C;}
#cancelButton {border-radius: 10px; border: none; background-color: #388E3C; color: white;}
i {cursor: pointer;  margin-right: 10px; color: #388E3C;}
</style>

<title>EARTH & US</title>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<br><br>

<div class="container">
   <div id="selectView">
      <c:if test="${empty page.search}">
      <a href="/camBoard/list?arr=entire" id="entire">전체보기&nbsp;&nbsp;&nbsp;&nbsp;</a>
      <a href="/camBoard/list?arr=doing" id="doing">진행중인 캠페인&nbsp;&nbsp;&nbsp;&nbsp;</a>
      <a href="/camBoard/list?arr=end" id="end">종료된 캠페인</a>
      </c:if>
         
      <c:if test="${!empty page.search}">
      <a href="/camBoard/list/search?search=${page.search}&arr=entire" id="entire">전체보기&nbsp;&nbsp;&nbsp;&nbsp;</a>
      <a href="/camBoard/list/search?search=${page.search}&arr=doing" id="doing">진행중인 캠페인&nbsp;&nbsp;&nbsp;&nbsp;</a>
      <a href="/camBoard/list/search?search=${page.search}&arr=end" id="end">종료된 캠페인&nbsp;&nbsp;&nbsp;</a>
      </c:if>
   </div><hr>
</div>

<div id="camBoardListDiv">
   <c:if test="${page.totalcount ne 0}">
   <section class="blog_area">
      <div class="container">
          <div class="row">
           <c:forEach items="${CamBoardList}" var="list" begin="0" end="3">        
              <div class="col-md-6 col-12">
                   <article class="blog_item">
                       <div class="blog_item_img">
                         <img class="card-img rounded-0" src="${list.CAMB_FILE}" alt="" height="250px;">
                  </div>
                       <div class="blog_details" style="height: 200px;" onclick="detailUrl('${list.CAMB_NAME}', '${list.CAMB_NUM}')">
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
      <div class= "col-md-2 col-6" >
         <select>
            <option selected="selected">전체</option>
            <option>제목</option>
            <option>내용</option>
         </select>
      </div>
      <div class="col-md-4 col-6" id="search-box" style="margin-left: 20px;">
         <input type="text" id="search" name="search" placeholder="검색 . . ." value="${page.search}">
         <a onclick="searchCamBoard()"><i class="fas fa-search"></i></a>
      </div>
   </div>
   <nav class="blog-pagination justify-content-center d-flex">
      <ul class="pagination">
         <c:if test="${page.prev}">
             <li class="page-item">
               <a class="page-link" aria-label="Previous" onclick="paging('${page.getStartPage()-1}')">
                  <i class="ti-angle-left"></i>
               </a>
            </li>
         </c:if>
         <c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">   
            <li class="page-item">
               <a class="page-link" onclick="paging('${idx}')">${idx}</a>
            </li>
         </c:forEach>
         <c:if test="${page.next}">
            <li class="page-item">
               <a class="page-link" aria-label="Next" onclick="paging('${page.getEndPage()+1}')">
                  <i class="ti-angle-right"></i>
               </a>
            </li>
         </c:if>
      </ul>
   </nav>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"/>
<div id="back-top" >
   <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<script type="text/javascript">
   window.onload = function(){
      if("${page.search}"){
         var cancelButton = '<input type="button" id="cancelButton" onclick="setAll()" value="취소">';
         $("#search-box").append(cancelButton);
      }else if(!"${page.search}"){
         
      }
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
      
      if(!search){
         alert("검색어를 입력해 주세요.");
      }else{
         location.href="/camBoard/list/search?search=" + search;   
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
      if(!subquery){
         location.href="/camBoard/detail?CAMB_NAME=" + name + "&CAMB_NUM=" + num;
      }else{
         location.href="/camBoard/detail" + subquery +"&CAMB_NAME=" + name + "&CAMB_NUM=" + num;
      }
   }
   
   function setAll(){
      location.href="/camBoard/list";
   }
</script>
</body>
</html>