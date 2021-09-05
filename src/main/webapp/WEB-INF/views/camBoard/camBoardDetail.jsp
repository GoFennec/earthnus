<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<style>
.facebook, .twitter, .naverblog, .kakaotalk, .clipboard {cursor: pointer;}
.facebook:hover, .twitter:hover, .naverblog:hover, .kakaotalk:hover, .clipboard:hover {transform: scale( 1.2 )}
</style>

<title>EARTH & US</title>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>

<main>
  <section class="blog_area single-post-area section-padding">
   <div class="container">
    <div class="row">
     <div class="col-12 posts-list">
      <div class="single-post">
       <div class="feature-img">
        <img src="${camBoard.CAMB_FILE}" id="IMG" width="100%" alt="캠페인" title="${camBoard.CAMB_SUBJECT}"/>
      </div>
      <div class="blog_details">
        <h2 style="color: #2d2d2d;">${camBoard.CAMB_NAME}</h2>
		<div id="subject_icon">
			<span style="display: inline-block;">
			<p><a id="subject" href="/camBoard/list/search?search=${camBoard.CAMB_SUBJECT}&search_type=CAMB_SUBJECT">${camBoard.CAMB_SUBJECT}&nbsp;&nbsp;</a>
			|&nbsp;&nbsp;진행 기간 <fmt:formatDate pattern="yyyy-MM-dd" value="${camBoard.CAMB_STARTDATE}"/> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${camBoard.CAMB_FINDATE}"/></p>
			</span>
		</div>
		<hr><br>
		<div>
		<p class="excert">
		${camBoard.CAMB_CONTENT}
		</p>
		</div>
      </div>
  	  </div>
 	 </div><br><br>
 	 
	 <div class="navigation-top col-12">
	    <div class="d-sm-flex justify-content-between" style="margin: 30px;">
	     <div>
	     <ul class="social-icons">
	     	<li style="float: left"><p style="font-size: 0.8em;">SNS공유하기&nbsp;&nbsp;</p></li>
		    <li style="float: left"><a id="facebookshare" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fnaver.com%2F%2F%2F&amp;src=sdkpreparse" class="fb-share-button fb-xfbml-parse-ignore" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button" data-size="large">
		 		<img src="/resources/camBoard/facebook.png" alt="페이스북 공유" class="facebook" width="25px"></a></li>
			<li style="float: left"><img src="/resources/camBoard/twitter.png" alt="트위터 공유" width="25px" class="twitter" onclick="shareTwitter()"></li>
		 	<li style="float: left"><img src="/resources/camBoard/naverblog.png" alt="네이버블로그 공유" width="25px" class="naverblog" onclick="shareNaverBlog()"></li>
			<li style="float: left"><img src="/resources/camBoard/kakaotalk.png" alt="카카오톡 공유" width="25px" class="kakaotalk" onclick="shareKakao()"></li>
			<li style="float: left;"><i class="clipboard fas fa-copy" style="font-size: 24px" onclick="shareURL()"></i></li>
	     </ul>
	     </div>
	     <div>
		   	<button type="button" class="btn btn-primary" onclick="donate()">후원 바로가기</button>
		 </div>
	    </div>
	   
		<div class="navigation-area">
		  <div class="row">
		   <div id="preBoard" class="col-lg-4 col-md-4 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
			   <div style="cursor: pointer;" onclick="detailUrl('${preBoard.CAMB_NAME}', '${preBoard.CAMB_NUM}', 'prev')">
				   	<div class="thumb">
						<img class="img-fluid" src="${preBoard.CAMB_FILE}" alt="" width="150px">
					</div>
						  
				   <div class="arrow">
				        <span class="lnr text-white ti-arrow-left"></span>
				   </div>
				
		   		   <div class="detials">
				  		<p>이전</p>
						<p style="font-size: 0.8em;">${preBoard.CAMB_NAME}</p>
				   </div>
			   </div>
		   </div>

		  <div class="col-lg-4 col-md-4 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
		  	<a class="btn header-btn" onclick="camBoard()" style="color: white;">목록으로</a>
		  </div>
		
			<div id="nextBoard" class="col-lg-4 col-md-4 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
				<div style="cursor: pointer;" onclick="detailUrl('${nextBoard.CAMB_NAME}', '${nextBoard.CAMB_NUM}', 'next')">
					<div class="detials">
				 	<p>다음</p>
				 	<p style="font-size: 0.8em;">${nextBoard.CAMB_NAME}</p>
				</div>
			
				   <div class="arrow">
				   		<span class="lnr text-white ti-arrow-right"></span>
				   </div>
				   <div class="thumb">
				  		<img class="img-fluid" src="${nextBoard.CAMB_FILE}"  alt="" width="150px">
				   </div>
				</div>
		    </div>
		  </div>
		</div>
	  </div>

	</div>
  </div>
</section>
</main>



<script type='text/javascript'>
	var pathname = window.location.pathname;
	var subquery = window.location.search;
	var query = subquery.slice(subquery.lastIndexOf("detail")+2, subquery.lastIndexOf("CAMB_NAME=")-1);
	substring = "pagenum";
	var URL = "";
	var num = 0;
	var pagenum = 0;				// 현재 캠페인이 위치한 실제 페이지
	
	window.onload = function(){
		console.log("${index}");
		
		num = ${index}/6;
		pagenum = Math.ceil(num);
		
		var subjecthtml = '';
		if("${camBoard.CAMB_SUBJECT}" === "해양"){
			subjecthtml += '<i class="fas fa-water"></i>';
			$('#subject_icon').prepend(subjecthtml);
		}else if("${camBoard.CAMB_SUBJECT}" === "플라스틱"){
			subjecthtml += '<i class="fas fa-recycle"></i>';
			$('#subject_icon').prepend(subjecthtml);
		}else if("${camBoard.CAMB_SUBJECT}" === "산림"){
			subjecthtml += '<i class="fas fa-tree"></i>';
			$('#subject_icon').prepend(subjecthtml);
		}else if("${camBoard.CAMB_SUBJECT}" === "극지방"){
			subjecthtml += '<i class="fas fa-snowflake"></i>';
			$('#subject_icon').prepend(subjecthtml);
		}else if("${camBoard.CAMB_SUBJECT}" === "기타"){
			subjecthtml += '<i class="fas fa-globe"></i>';
			$('#subject_icon').prepend(subjecthtml);
		}
		if(!'${preBoard.CAMB_NUM}'){
			$('#preBoard').html('<div>이전 캠페인이 없습니다.</div>');
		}else if(!'${nextBoard.CAMB_NUM}'){
			$('#nextBoard').html('<div>다음 캠페인이 없습니다.</div>');
		}
	}
	
function detailUrl(CAMB_NAME, CAMB_NUM, type){
		
		if(type === "prev"){
			num = (${index}-1)/6;
			pagenum = Math.ceil(num);
		}else if(type === "next"){
			num = (${index}+1)/6;
			pagenum = Math.ceil(num);
		}
		
		if(name || num){
			if(query){
				if(query.lastIndexOf(substring) !== -1){
					query = query.substr(0, subquery.indexOf("pagenum")-2);
				}
				if(pagenum !== 1){
					URL += pathname + "?" + query + "&pagenum=" + pagenum + "&CAMB_NAME=" + CAMB_NAME + "&CAMB_NUM=" + CAMB_NUM;
				}else{
					URL += pathname + "?" + query + "&CAMB_NAME=" + CAMB_NAME + "&CAMB_NUM=" + CAMB_NUM;
				}
			}else{
				if(pagenum !== 1){
					URL += pathname + "?pagenum=" + pagenum + "&CAMB_NAME=" + CAMB_NAME + "&CAMB_NUM=" + CAMB_NUM;
				}else{
					URL += pathname + "?CAMB_NAME=" + CAMB_NAME + "&CAMB_NUM=" + CAMB_NUM;
				}
			}
			
			location.href = URL;
			
		} else if(!num && type === "prev"){
			
			
		} else if(!num && type === "next"){
			
			
		}
		
		
	}
	
	function camBoard(){
		substring = "pagenum";
		var pagenum = parseInt(${totalIndex}/6 + 1) - parseInt(${index}/6 + 1); 
		
		if(query){
			if(query.lastIndexOf(substring) !== -1){
				query = query.substr(0, subquery.indexOf("pagenum")-2);
			}
			URL += "/camBoard/list?" + query;
		}else{
			if(pagenum !== 1){
				URL += "/camBoard/list?pagenum=" + pagenum;
			}else{
				URL += "/camBoard/list"
			}
		}
		
		location.href = URL;
	}
	
	var linkUrl = window.location.href;
	
	function resize(obj) {
	  obj.style.height = "1px";
	  obj.style.height = (12+obj.scrollHeight)+"px";
	}
	
	function donate(){
		var type = "${camBoard.CAMB_SUBJECT}";
		
		if(type === "해양"){
			location.href="/donation/ocean";
		}else if(type === "플라스틱"){
			location.href="/donation/plastic";
		}else if(type === "산림"){
			location.href="/donation/forest";
		}else if(type === "극지방"){
			location.href="/donation/ice";
		}
	}
	
	function shareURL() {
		var url = '';
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		alert("URL이 복사되었습니다.")
	}
	
	function shareTwitter() {
		//var linkUrl = "https://www.naver.com/"; 
		window.open( "https://twitter.com/intent/tweet?text=save earth&url=" + encodeURIComponent(linkUrl) );
	}
	
	function shareFacebook() {		
		window.open( 'http://www.facebook.com/sharer.php?u=' + encodeURIComponent(linkUrl) );
	}
	
	function shareNaverBlog() { 
		var url = encodeURI(encodeURIComponent(linkUrl)); 
		var title = encodeURI("${camBoard.CAMB_NAME}"); 
		var shareURL = "https://blog.naver.com/openapi/share?serviceCode=share&url=" + url + "&title=" + title; document.location = shareURL; 
	}
	
	function shareKakao() {
	    Kakao.init('3b1b5dd541e88935221a7fb05cd01dad')
	    Kakao.Link.sendDefault({
	      objectType: 'feed',
	      content: {
	    	  title: "${camBoard.CAMB_NAME}",
		        description: '지구의 웃음을 찾아서',
		        imageUrl: "${camBoard.CAMB_FILE}",
		        link: {
			          mobileWebUrl: linkUrl,
			          webUrl: linkUrl
			        }
	      },
	      social: {
	        likeCount: 286,
	        commentCount: 45,
	        sharedCount: 845,
	      },
	      buttons: [
		        {
		          title: '웹으로 보기',
		          link: {
		            mobileWebUrl: linkUrl,
		            webUrl: linkUrl
		          }
		        },
		        {
		          title: '앱으로 보기',
		          link: {
		            mobileWebUrl: linkUrl,
		            webUrl: linkUrl
		          }
		        }
		      ]
	    })
	  };
    
</script>
<jsp:include page="/WEB-INF/views/footer.jsp"/>

<!-- Scroll Up -->
<div id="back-top" >
 <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

</body>
</html>