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
a {cursor: pointer;}
i {color: #388E3C;}

div #selectView { text-align: left;}

#selectView a {font-weight: bold; color: #388E3C; font-size: 0.8em; margin-right: 10px;}
#selectView a:hover { background-color: #388E3C; color: white;} 
#selectView i {color: #388E3C; border-color: #388E3C; margin-left: -24px;}

#searchView .arr{ float: left; }
#searchView .search { float: right; }

.blog_item_date {text-align: center;}

div #search-box{ text-align: right;}

#search{
	border-bottom-color: #388E3C;
	border-top: none;
	border-left: none;
	border-right: none;
}

#search-box #cancelButton{
	background-color: #388E3C;
	color: white;
	border: none;
}

table{ float: right; width: 50px;}

.skill{
	width: 160px;
	height: 160px;
	position: absolute;
	right: 40px;
	bottom: -80px;
}

.outer{
	background-color: white;
	height: 160px;
	width: 160px;
	border-radius: 50%;
	padding: 20px;
	box-shadow: 0px 4px 10px -1px rgba(0,0,0,0.2),
				0px 4px 10px -1px rgba(255,255,255,0.7);
}

.inner{
	background: none;
	height: 120px;
	width: 120px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	box-shadow: inset 4px 4px 6px -1px rgba(0,0,0,0.2),
				inset -4px -4px 6px -1px rgba(255,255,255,0.7),
				-0.5px -0.5px 0px rgba(255,255,255,1),
				0.5px 0.5px 0px rgba(0,0,0,0.15),
				0px 12px 10px -10px rgba(0,0,0,0.05);
}

.number{
	text-align: center;
	font-weight: 600px;
	color: #555;
}

.circle1{
	fill: none;
	stroke: #09cc7f;
	stroke-width: 20px;
	stroke-dasharray: 472;
	stroke-dashoffset: 472;
	animation: anim1 2s linear forwards;
}

.circle2{
	fill: none;
	stroke: #09cc7f;
	stroke-width: 20px;
	stroke-dasharray: 472;
	stroke-dashoffset: 472;
	animation: anim2 2s linear forwards;
}
.circle3{
	fill: none;
	stroke: #09cc7f;
	stroke-width: 20px;
	stroke-dasharray: 472;
	stroke-dashoffset: 472;
	animation: anim3 2s linear forwards;
}
.circle4{
	fill: none;
	stroke: #09cc7f;
	stroke-width: 20px;
	stroke-dasharray: 472;
	stroke-dashoffset: 472;
	animation: anim4 2s linear forwards;
}
.circle5{
	fill: none;
	stroke: #09cc7f;
	stroke-width: 20px;
	stroke-dasharray: 472;
	stroke-dashoffset: 472;
	animation: anim5 2s linear forwards;
}
.circle6{
	fill: none;
	stroke: #09cc7f;
	stroke-width: 20px;
	stroke-dasharray: 472;
	stroke-dashoffset: 472;
	animation: anim6 2s linear forwards;
}

svg{
	position: absolute;
	top: 0;
	left: 0;
}

@keyframes anim1{100%{stroke-dashoffset: ${CAMB_ABLEDATE1};}}
@keyframes anim2{100%{stroke-dashoffset: ${CAMB_ABLEDATE2};}}
@keyframes anim3{100%{stroke-dashoffset: ${CAMB_ABLEDATE3};}}
@keyframes anim4{100%{stroke-dashoffset: ${CAMB_ABLEDATE4};}}
@keyframes anim5{100%{stroke-dashoffset: ${CAMB_ABLEDATE5};}}
@keyframes anim6{100%{stroke-dashoffset: ${CAMB_ABLEDATE6};}}

</style>

<title>EARTH & US</title>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<br><br><br><br>

<div class="container">
	<div class="container">
		<div class="row ">
			<div class = "col-md-6 col-12" id="selectView">
				<a id="entire" onclick="select('${page.search}', 'entire')">전체보기</a>
				<a id="doing" onclick="select('${page.search}', 'doing')">진행중인 캠페인</a>
				<a id="end" onclick="select('${page.search}', 'end')">종료된 캠페인</a>
			</div>
			<div class= "col-md-2 col-6" style="float: right">
				<select>
					<option selected="selected">전체</option>
					<option>제목</option>
					<option>내용</option>
				</select>
			</div>
			<div class= "col-md-4 col-6" id="search-box">
				<input type="text" id="search" name="search" placeholder="검색 . . ." value="${page.search}">
				<a onclick="searchCamBoard()"><i class="fas fa-search"></i></a>
			</div>
		</div>
	</div>
</div>
	<hr>
<% int a = 1; %>
<div id="camBoardListDiv">
	<c:if test="${page.totalcount ne 0}">
	<section class="blog_area">
		<div class="container">
	    	<div class="row">
	        <c:forEach items="${CamBoardList}" var="list" begin="0" end="5">        
	        	<div class="col-md-6 col-12">
	                <article class="blog_item" style="cursor: pointer;">
	                    <div class="blog_item_img">
	                		<img class="card-img rounded-0" src="${list.CAMB_FILE}" alt="" onclick="detailUrl('${list.CAMB_NAME}', '${list.CAMB_NUM}')">
	                		<div class="skill" onclick="dateCheck('number' + <%=a%>, ${list.CAMB_ABLEDATE}, '${list.CAMB_STARTDATE}', '${list.CAMB_FINDATE}')">
								<div class="outer">
									<div class="inner">
										<div class="number" id="number<%=a%>">
											
										</div>
									</div>
								</div>
								
								<svg xmlns="https://www.w3.org/2000/svg" version="1.1" width="160px" height="160px">
									<defs>
										<lineaarGrandient id="GradientColor">
											<stop offset="0%" stop-color="#e91e63"/>
											<stop offset="100%" stop-color="#673ab7"/>
										</lineaarGrandient>
									</defs>
									<circle class="circle<%=a%>" cx="80" cy="80" r="70" stroke-linecap="round" />
								</svg>
							</div>
	                		
						</div>
	                    <div class="blog_details" onclick="detailUrl('${list.CAMB_NAME}', '${list.CAMB_NUM}')">
	                        <h2 class="blog-head" style="color: #2d2d2d;">${list.CAMB_NAME}</h2>
	                        <p>${list.CAMB_CONTENT}</p>
	                    </div>
	               	</article>
	               	
	<script type="text/javascript">
		let number<%=a%> = document.getElementById("number<%=a%>");
		let counter<%=a%> = 0;
		var test = "test<%=a%>";
		var rate = "";
		if(${list.CAMB_ABLEDATE} >= 0){
			if(${list.CAMB_ABLEDATE}-100 > 0){
				rate = "예정";
			}else if(${list.CAMB_ABLEDATE}-100 <= 100){
				rate = ${list.CAMB_ABLEDATE} + "%";
			}
		}else if(${list.CAMB_ABLEDATE} < 0){
			rate = "종료";
		}
		number<%=a%>.innerHTML = rate;			
		
		
		function dateCheck(num, CAMB_ABLEDATE, CAMB_STARTDATE, CAMB_FINDATE){
			var number = num;
			number = document.getElementById(number);
			
			var HTML = '';
			if(num === "number1"){
				HTML = '<i class="fas fa-calendar-alt"></i><br>${CAMB_STARTDATE1}<br>~<br>${CAMB_FINDATE1}'
			}else if(num === "number2"){
				HTML = '<i class="fas fa-calendar-alt"></i><br>${CAMB_STARTDATE2}<br>~<br>${CAMB_FINDATE2}'
			}else if(num === "number3"){
				HTML = '<i class="fas fa-calendar-alt"></i><br>${CAMB_STARTDATE3}<br>~<br>${CAMB_FINDATE3}'
			}else if(num === "number4"){
				HTML = '<i class="fas fa-calendar-alt"></i><br>${CAMB_STARTDATE4}<br>~<br>${CAMB_FINDATE4}'
			}else if(num === "number5"){
				HTML = '<i class="fas fa-calendar-alt"></i><br>${CAMB_STARTDATE5}<br>~<br>${CAMB_FINDATE5}'
			}else if(num === "number6"){
				HTML = '<i class="fas fa-calendar-alt"></i><br>${CAMB_STARTDATE6}<br>~<br>${CAMB_FINDATE6}'
			}
			
			if(number.innerHTML !== HTML){
				number.innerHTML = HTML;
			}else if(number.innerHTML === HTML){
				var rate = "";
				if(CAMB_ABLEDATE >= 0){
					if(CAMB_ABLEDATE-100 > 0){
						rate = "예정";
					}else if(CAMB_ABLEDATE-100 <= 100){
						rate = CAMB_ABLEDATE + "%";
					}
				}else if(CAMB_ABLEDATE < 0){
					rate = "종료";
				}
				number.innerHTML = rate;
			}
		}
	</script>
	            </div>
	            <% a++; %>
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
<input type="hidden" id="query">
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
		if(query){	// 쿼리스트링 있을때
			var URL = pathname + "?" + query + "&pagenum=" + page
			location.href = URL;
		}else if(!query){
			var URL = pathname + "?pagenum=" + page
			location.href = URL;
		}
	}
	
	function select(search, arr){
		// 리스트 조회 필터 최적화
		if(!search){
			location.href = "/camBoard/list?arr=" + arr;
		}else if(search){
			location.href = "/camBoard/list/search?search=" + search + "&arr=" + arr;
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