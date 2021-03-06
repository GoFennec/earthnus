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
.search-box table {
	border-collapse: collapse; 
	border-radius: 20px;
	width: 100%; 
	box-shadow: 0px 7px 10px 0px rgb(0 0 0 / 5%) !important;
}

.search-box table:hover{
	border-collapse: collapse; 
	border-radius: 20px;
	width: 100%; 
	box-shadow: 0px 7px 10px 0px rgb(0 0 0 / 20%) !important;
}

td i {
	margin-right: 10px;
}


div #selectView {text-align: right;}
#selectView a {font-weight: bold; color: #388E3C; font-size: 0.8em;}
#camBoardListDiv {margin-bottom: 4%;}
#search {
	background: none; 
	width:100%; 
	border: none; 
	font-weight: 500;
	font-size: 1.2em;
}

.blog_item_date {text-align: center;}
.blog_details {cursor: pointer;}
.search-div {text-align: center;}

article {
	box-shadow: 0px 7px 10px 0px rgb(0 0 0 / 5%) !important;
	border-radius: 15px !important;
	cursor: pointer;
}

article:hover {
	box-shadow: 0px 7px 10px 0px rgb(0 0 0 / 20%) !important;
	border-radius: 15px !important;
}

#cancelButton {border-radius: 10px; border: none; background-color: #388E3C; color: white;}
i {cursor: pointer; color: #388E3C;}

.search-type:hover > .descript-type { width: 100px; }

.search-block i{
	border: none;
	background: none;
}

#search_type {
	display: block !important;
	font-size: 1.2em;
	text-align: center;
	width: 110px;
	height: 40px;
	border: none;
	background: none;
	color: #388E3C;
}

.nice-select{
	display: none !important;
}

#nav{
	list-style: none;
	height: 40px;
	padding: 5px 1px;
	margin: 0;
}

.filter{
	border: none;
    text-transform: capitalize;
    width: 100px;
    height: 34px;
	border-radius: 17px;
    cursor: pointer;
    color: #fff;
    display: inline-block;
    font-size: 15px;
    transition: 0.6s;
    box-shadow: 0px 7px 15px 0px rgb(0 0 0 / 12%);
    background-image: linear-gradient(to left, #46C0BE, #6DD56F, #46C0BE);
    background-position: right;
    background-size: 200%;
}

.filter:active { 
	box-shadow: 1px 1px 0 rgb(0,0,0,0.5); 
	position: relative; 
	top:2px; 
}

#nav{
	font-size: 1.1em;
}

#nav li{
	float: right;
	position: relative;
	padding: 0;
}

#nav .type{
	margin: 0px 6% 0px 3%;
}

#nav li a {
	display: block;
	font-size: 15px;
	padding: 7px 8px;
	margin: 0;
	color: #388E3C;
}

#nav ul{
	z-index: 1000000;
	background: #f8f9fa;
	list-style: none;
	margin-left: -25%;
	padding: 0;
	position: absolute;
	left: 0;
	top: 40px;
	width: 150px;
	text-align: center;
	border-radius: 17px;
	box-shadow: 0px 10px 10px rgb(0 0 0 / 12%);
}

#nav ul li{
	z-index: 1000;
	float: none;
	padding: 0;
	font-size: 10px;
}

.result-null{
	text-align: center;
}

.result-null{
	font-weight: 600;
}

.result-null .changesearch:hover{
	color: #388E3C !important;
	cursor: pointer;
}
.campaign img{
	border-top-left-radius: 15px !important;
	border-top-right-radius: 15px !important;
}
</style>

<title>EARTH & US</title>

</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<br><br><br>
<div class="container">
<div class="row">
	<div class="col-sm-12" id="selectView">
		<ul id="nav">
			<li class="sub-nav type"><button class="filter">??????</button>
				<ul class="sub-type">
					<li><a href="/camBoard/list/search?search_type=CAMB_SUBJECT&search=??????" title="???????????? ?????????"><i class="type fas fa-tint"></i>&nbsp;&nbsp;??????</a></li>
					<li><a href="/camBoard/list/search?search_type=CAMB_SUBJECT&search=????????????" title="???????????? ????????? ?????????"><i class="type fas fa-sync-alt"></i>&nbsp;&nbsp;????????????</a></li>
					<li><a href="/camBoard/list/search?search_type=CAMB_SUBJECT&search=??????" title="?????? ????????? ?????????"><i class="type fas fa-tree"></i>&nbsp;&nbsp;??????</a></li>
					<li><a href="/camBoard/list/search?search_type=CAMB_SUBJECT&search=?????????" title="????????? ??? ????????? ?????????"><i class="type fas fa-snowflake"></i>&nbsp;&nbsp;?????????</a></li>
				</ul>
			</li>
			<li class="sub-nav history"><button class="filter">??????</button>
				<ul class="sub-history">
					<li><a href="/camBoard/list?arr=entire" id="entire" title="????????????">????????????</a></li>
					<li><a href="/camBoard/list?arr=doing" id="doing" title="???????????? ?????????">???????????? ?????????</a></li>
					<li><a href="/camBoard/list?arr=end" id="end" title="????????? ?????????">????????? ?????????</a></li>
				</ul>
			</li>
		</ul>
   </div>
</div>
   <hr>
</div>
<% int index = 0; %>
<div id="camBoardListDiv" class="m-4">
   <c:if test="${page.totalcount ne 0}">
   <section class="blog_area">
      <div class="container">
          <div class="row">
           <c:forEach items="${CamBoardList}" var="list" begin="0" end="5">
           <% index++; %>
              <div class="col-sm-12 col-md-6 col-lg-4">
                   <article class="blog_item campaign" onclick="detailUrl('${list.CAMB_NAME}', '${list.CAMB_NUM}', '<%= index %>')">
                       <div class="blog_item_img">
                         <img class="card-img rounded-0" src="${list.CAMB_FILE}" title="${list.CAMB_NAME}" alt="${list.CAMB_NAME} ??????" height="200px;">
                  		</div>
                       <div class="blog_details detail" style="height: 200px;">
                          <p style="font-size: 0.8em;">?????? ?????? <fmt:formatDate pattern="yyyy-MM-dd" value="${list.CAMB_STARTDATE}"/> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${list.CAMB_FINDATE}"/></p>
                           <h3 class="blog-head">${list.CAMB_NAME}</h3>
                       </div>
                     </article>
               </div>
         </c:forEach>
         </div>
	   <hr>
      </div>
   </section>
   </c:if>
   <c:if test="${page.totalcount eq 0}">
   	<div class="result-null">
   		<br><br><br><br><h1>??????????????? ????????????.</h1>
   		<c:if test="${!empty RecommandWord}">
   			<br><br>??? ???????????? ??????????&nbsp;&nbsp;&nbsp;"<a class="changesearch" title="${RecommandWord} ????????????" onclick="changesearch()">${RecommandWord}</a>"<br><br><br><br><hr>
   		</c:if>
   		<c:if test="${empty auth}"></c:if>
   		<c:if test="${!empty auth}">
   			<br><br>??? ???????????? ??????????&nbsp;&nbsp;&nbsp;"<a class="changesearch" title="${RecommandWord} ????????????" onclick="changesearch()">${RecommandWord}</a>"<br><br><br><br><hr>
   		</c:if>
   		<br><br>
   	</div>
   </c:if>
</div>

<div class="container">
	<div class="row m-4">
	<div class="col-sm-2 col-lg-3"></div>
	<div class="col-sm-8 col-lg-6 search-box">
			<table>
			    <tr>
			    	<td>
			    		<select id="search_type">
				            <option selected="selected">??????</option>
				            <option>??????</option>
				            <option>??????</option>
				         </select>
			    	</td>
			    	<td id="search-text">
			    		<div class="search-block">
			    			<input type="text" id="search" name="search" onkeyup="enterkey()" placeholder="?????? . . .">
			    		</div>
			    	</td>
			    	<td class="search-imoji">
				    	<i class="fas fa-search" onclick="searchCamBoard()"></i>
			    	</td>
			    </tr>
		 </table>
	</div>
	<div class="col-sm-2 col-lg-3"></div>
	
	<div class="col-sm-2 col-lg-4"></div>
	<div class="col-sm-8 col-lg-4">
		<nav class="blog-pagination justify-content-center d-flex">
		      <ul class="pagination">
	         <c:if test="${page.prev}">
	             <li class="page-item">
	              <a class="page-link" title="${page.getStartPage()-1}??? ?????????" aria-label="Previous" onclick="paging('${page.getStartPage()-1}')">
	                  <i class="ti-angle-left"></i>
	               </a>
	            </li>
	         </c:if>
	         <c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">   
	            <li class="page-item">
	            	<c:if test="${page.currentPage eq idx}">
	            		<a class="page-link" title="${idx}?????????" id="${idx}" style="cursor: default; background-color: #66BB6A; color: #fff;">${idx}</a>
	            	</c:if>
	            	<c:if test="${page.currentPage ne idx}">
	            		<a class="page-link" title="${idx}?????????" id="${idx}" onclick="paging('${idx}')">${idx}</a>
	            	</c:if>
	            </li>
	         </c:forEach>
	         <c:if test="${page.next}">
	            <li class="page-item">
	               <a class="page-link" title="${page.getEndPage()+1}??? ?????????" aria-label="Next" onclick="paging('${page.getEndPage()+1}')">
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
	$(document).ready(function(){
		$("#nav ul").hide();
	});
	
	function enterkey() {
		var search = document.getElementById("search").value; 
		var search_type = $("#search_type option:selected").val();
		
        if (window.event.keyCode == 13) {
             searchCamBoard();
        }
	}

	function CheckPageFocus() {
		  var info = document.getElementById("message");

		  if ( document.hasFocus() ) {
				console.log("????????? ??????");
		  } else {
				console.log("????????? ?????????");
		  }
		}
	
	$('#${page.currentPage}').off('click');
	
	$("#nav li.type").click(function(){
		$("ul", this).slideToggle("fast");
		if($("#nav .sub-history").is(':visible') === true){
			$("#nav .sub-history").slideToggle("fast");
		}
	})
	
	$("#nav li.history").click(function(){
		$("ul", this).slideToggle("fast");
		if($(".sub-type").is(':visible') === true){
			$(".sub-type").slideToggle("fast");
		}
	})
	$('html').click(function() { 
		
	});
	
   var pathname = window.location.pathname;
   var subquery = window.location.search;
   var query = subquery.slice(subquery.lastIndexOf("?")+1);
   
   substring = "pagenum";
   
   // ????????? ??????????????? ??????
   if(query.lastIndexOf(substring) !== -1){
      query = query.substr(0, subquery.indexOf("pagenum")-2);
   }
   
   function searchCamBoard(){
      var search = document.getElementById("search").value;
      var search_type = $("#search_type option:selected").val();
      
      if(!search){
         alert("???????????? ????????? ?????????.");
         return false;
      }else{
         location.href="/camBoard/list/search?search_type=" + search_type + "&search=" + search;   
      }
   }
   
   function changesearch(){
	   var search = "${RecommandWord}";
	   var search_type = $("#search_type option:selected").val();
	   
	   location.href="/camBoard/list/search?search_type=" + search_type + "&search=" + search;
   }
   
   function paging(page){
      // ????????? url ??????
      if(query){   // ??????????????? ?????????
         var URL = pathname + "?" + query + "&pagenum=" + page
         location.href = URL;
      }else if(!query){
         var URL = pathname + "?pagenum=" + page
         location.href = URL;
      }
   }
   
   function detailUrl(name, num, index){
	  var indexnum = ((${page.currentPage}-1) * 6 + index * 1);
	  if(!subquery){
         location.href="/camBoard/detail?CAMB_NAME=" + name + "&CAMB_NUM=" + num + "&INDEX=" + indexnum;
      }else{
         location.href="/camBoard/detail" + subquery +"&CAMB_NAME=" + name + "&CAMB_NUM=" + num + "&INDEX=" + indexnum;
      }
   }
   
   function setAll(){
      location.href="/camBoard/list";
   }
</script>
</body>
</html>