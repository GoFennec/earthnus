<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="http://jsgetip.appspot.com"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style>
	table {max-width: 90%; margin:auto; border-collapse: collapse; text-align: left; line-height: 1.5;}
	thead th {padding: 10px; font-weight: bold; vertical-align: top; color: #086121; border-bottom: 3px solid #0ed145;}
	tbody th {width: 150px; padding: 10px; font-weight: bold; vertical-align: center; border-bottom: 1px solid #ccc; background: #f3f6f7;}
	.list:hover {background-color: #FFFFDE; cursor: pointer;}
	td {width: 350px; padding: 10px; vertical-align: center;}
	td .exGoodsImg {text-align: center; margin: auto; padding: 1px;}
	.exButton{text-align: center;}
	input {border: none;}
	textarea {border: none; width: 100%; height: auto; overflow:visible;}
	#subject:hover {color: #2962FF; }
	.main{margin-right: 30px;}
	.paging {text-align: center;}
	.facebook:hover, .twitter:hover, .naverblog:hover, .kakaotalk:hover, .clipboard:hover {transform: scale( 1.2 )}
	i {
		border-radius: 80px;
	    opacity: 0;
	    font-size: 28px;
	    color: #31b528;
	    will-change: transform;
	    -webkit-transform: scale(.1);
	            transform: scale(.1);
	    -webkit-transition: all .3s ease;
	    transition: all .3s ease;
	}

	.btn_wrap {
	    position: relative;
	    display: -webkit-box;
	    display: -ms-flexbox;
	    display: flex;
	    -webkit-box-pack: center;
	        -ms-flex-pack: center;
	            justify-content: center;
	    -webkit-box-align: center;
	        -ms-flex-align: center;
	            align-items: center;
	    overflow: hidden;
	    cursor: pointer;
	    width: 180px;
	    height: 60px;
	    background-color: #EEEEED;   // 내부색
	    border-radius: 80px;
	    padding: 0 18px;
	    will-change: transform;
	    -webkit-transition: all .2s ease-in-out;
	    transition: all .2s ease-in-out;
	}

	.btn_wrap:hover {
	    /* transition-delay: .4s; */
	    -webkit-transform: scale(1);
	            transform: scale(1)
	}
	
	.shareButton {
	    position: absolute;
	    z-index: 99;
	    width: 180px;
	    height: 60px;
	    border-radius: 80px;
	    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
	    font-size: 20px;
	    text-align: center;
	    line-height: 70px;
	    letter-spacing: 2px;
	    color: #EEEEED;				
	    background-color: #35c718;	
	    padding: 0 18px;
	    -webkit-transition: all 1.2s ease;
	    transition: all 1.2s ease;
	}
	
	.container {
	    display: -webkit-box;
	    display: -ms-flexbox;
	    display: flex;
	    -ms-flex-pack: distribute;
	        justify-content: space-around;
	    -webkit-box-align: center;
	        -ms-flex-align: center;
	            align-items: center;
	    width: 180x;
	    height: 60px;
	    border-radius: 80px;
	}
	
	.container i:nth-of-type(1) {-webkit-transition-delay: 1.1s; transition-delay: 1.1s;}
	
	.container i:nth-of-type(2) {-webkit-transition-delay: .9s; transition-delay: .9s;}
	
	.container i:nth-of-type(3) {-webkit-transition-delay: .7s; transition-delay: .7s;}
	
	.container i:nth-of-type(4) {-webkit-transition-delay: .4s; transition-delay: .4s;}
	
	.btn_wrap:hover .shareButton {
	    -webkit-transition-delay: .25s;
	            transition-delay: .25s;
	    -webkit-transform: translateX(-280px);
	            transform: translateX(-280px)
	}	
	
	.btn_wrap:hover i {opacity: 1; -webkit-transform: scale(1); transform: scale(1);}
	
	.dr {position: absolute; bottom: 16px; right: 16px; width:100px;}
	
	.link-icon { position: relative; display: inline-block; width: auto;    font-size: 14px; font-weight: 500; color: #333; margin-right: 10px; padding-top: 50px; }
	.link-icon.twitter { background-image: url(./images/icon-twitter.png); background-repeat: no-repeat; }
	.link-icon.facebook { background-image: url(./images/icon-facebook.png); background-repeat: no-repeat; } 
	.link-icon.kakao { background-image: url(./images/icon-kakao.png); background-repeat: no-repeat; }
</style>
<title>${camBoard.CAMB_NAME}에 대하여..</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="/resources/assets/img/favicon.ico">
<link rel="icon" href="/resources/assets/img/favicon.ico">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
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

</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>	

	<div class="main col-sm-12 col-lg-12">
		<table class="mainlist goodsTable" id="detail" style="border-collapse: separate;">
			
			<tr>
				<td colspan = "4">
					<img src="${camBoard.CAMB_FILE}" id="IMG" width="100%" alt="캠페인" title="${camBoard.CAMB_SUBJECT}"/>
				</td>
			</tr>
			
			
			<tr>
				<td colspan = "3" style="text-align: left; color: black; font-size: 45px;"><b>${camBoard.CAMB_NAME}</b></td>
				<td style="text-align: right; color: gray; font-size: 10px;">
				시작일 : <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${camBoard.CAMB_STARTDATE}" /><br>
				종료일 : <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${camBoard.CAMB_FINDATE}" />
				</td>
			</tr>
			<tr>
				<td colspan = "4" id="subject_icon">
					<a id="subject" href="/camBoard/list/search?search=${camBoard.CAMB_SUBJECT}&search_type=CAMB_SUBJECT">${camBoard.CAMB_SUBJECT}</a>
				</td>
			</tr>
			
			<tr style="text-align: left;">
				<td colspan="4" style=" border-bottom: 1px solid #ccc;">${camBoard.CAMB_CONTENT}</td>
			</tr>
			<tr>
				<td colspan="4" class="sysBtn" style="text-align: center;">
					<input type="button" class="btn-dark" value="목록" onclick="location.href='/camBoard/list'"/>	
				</td>
			</tr>
			<tr>
				<td colspan = "4">
					<div class="navigation-top">
					   <div class="d-sm-flex justify-content-between text-center">
					    <div class="col-sm-4 text-center my-2 my-sm-0">
					     <span class="align-middle" onclick="donate()"><i class="fas fa-donate" style="margin-right: 15px"></i>후원하기</span>
					   </div>
					   <ul class="social-icons" style="float: left">
					     <li style="float: left"><a id="facebookshare" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fnaver.com%2F%2F%2F&amp;src=sdkpreparse" class="fb-share-button fb-xfbml-parse-ignore" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button" data-size="large">
			        			<img src="/resources/camBoard/facebook.png" alt="페이스북 공유" class="facebook" width="20px">
			        		</a></li>
					     <li style="float: left"><img src="/resources/camBoard/twitter.png" alt="트위터 공유" width="20px" class="twitter" onclick="shareTwitter()"></li>
					     <li style="float: left"><img src="/resources/camBoard/naverblog.png" alt="네이버블로그 공유" width="20px" class="naverblog" onclick="shareNaverBlog()"></li>
					     <li style="float: left"><img src="/resources/camBoard/kakaotalk.png" alt="카카오톡 공유" width="20px" class="kakaotalk" onclick="shareKakaotalk()"></li>
					   	<li style="float: left;"><i class="clipboard far fa-clipboard" style="font-size: 20px" onclick="shareURL()"></i></li>
					   </ul>
					 </div>
					 <div class="navigation-area">
					  <div class="row"  style="text-align: center;">
					   <div
					   class="col-lg-4 col-md-4 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
					   <div class="thumb">
					     <a href="#">
					      <img class="img-fluid" src="assets/img/post/preview.png" alt="">
					    </a>
					  </div>
					  <div class="arrow">
					   <a href="#">
					    <span class="lnr text-white ti-arrow-left"></span>
					  </a>
					</div>
					<div class="detials">
					 <p>Prev Post</p>
					 <a href="#">
					  <h4 style="color: #2d2d2d;">Space The Final Frontier</h4>
					</a>
					</div>
					</div>
					<div class="col-lg-4 col-md-4 col-12 flex-row align-items-center">
					<br><i class="fas fa-list-ul"></i>&nbsp;&nbsp;&nbsp;목록
					</div>
					<div
					class="col-lg-4 col-md-4 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
					<div class="detials">
					 <p>Next Post</p>
					 <a href="#">
					  <h4 style="color: #2d2d2d;">Telescopes 101</h4>
					</a>
					</div>
					<div class="arrow">
					 <a href="#">
					  <span class="lnr text-white ti-arrow-right"></span>
					</a>
					</div>
					<div class="thumb">
					 <a href="#">
					  <img class="img-fluid" src="assets/img/post/next.png" alt="">
					</a>
					</div>
					</div>
					</div>
					</div>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="margin: auto;">
					<div class="btn_wrap" style="border-radius: 80px; background-color: #f3f6f7">
				        <span class="shareButton"><i class="fas fa-share-alt" style="margin-right: 15px"></i>공유하기</span>
				        <div class="container">
			        		<a id="facebookshare" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fnaver.com%2F%2F%2F&amp;src=sdkpreparse" class="fb-share-button fb-xfbml-parse-ignore" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button" data-size="large">
			        			<img src="/resources/camBoard/facebook.png" alt="페이스북 공유" class="facebook" width="20px">
			        		</a>
							<img src="/resources/camBoard/twitter.png" alt="트위터 공유" width="20px" class="twitter" onclick="shareTwitter()">
							<img src="/resources/camBoard/naverblog.png" alt="네이버블로그 공유" width="20px" class="naverblog" onclick="shareNaverBlog()">
							<img src="/resources/camBoard/kakaotalk.png" alt="카카오톡 공유" width="20px" class="kakaotalk" onclick="shareKakaotalk()">
			        		<i class="clipboard far fa-clipboard" style="font-size: 20px" onclick="shareURL()"></i>
				        </div>
				    </div>
				</td>
				<td colspan="2" style="margin: auto;">
					<div class="btn_wrap" style="border-radius: 80px; background-color: #f3f6f7"  onclick="donate()">
				        <span class="shareButton"><i class="fas fa-donate" style="margin-right: 15px"></i>후원하기</span>
				        <div class="container">
			        		<span>
			        			<b>${camBoard.CAMB_SUBJECT}</b>
			        		</span>
				        </div>
				    </div>
				</td>
			</tr>
		</table>
	</div>
	
	<div>
	
	</div>
		
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<script type='text/javascript'>
	window.onload = function(){
		var subjecthtml = '';
		if("${camBoard.CAMB_SUBJECT}" === "해양"){
			subjecthtml += '<i class="fas fa-fish"></i>';
			$('#subject_icon').prepend(subjecthtml);
		} else if("${camBoard.CAMB_SUBJECT}" === "플라스틱"){
			subjecthtml += '<i class="fas fa-recycle"></i>';
			$('#subject_icon').prepend(subjecthtml);
		}else if("${camBoard.CAMB_SUBJECT}" === "산림"){
			subjecthtml += '<i class="fas fa-tree"></i>';
			$('#subject_icon').prepend(subjecthtml);
		}else if("${camBoard.CAMB_SUBJECT}" === "극지방"){
			subjecthtml += '<i class="fas fa-icicles"></i>';
			$('#subject_icon').prepend(subjecthtml);
		}
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
	
	function shareKakaotalk() {
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
	  }
	;
    
  //]]>
</script>
</body>
</html>