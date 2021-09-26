<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	pageContext.setAttribute("crcn", "\n"); 
	pageContext.setAttribute("br", "<br/>");
%>
<!DOCTYPE html>
<html>
<head>
<style>
table {width: 100%; border-collapse: collapse; text-align: left; line-height: 1.5;}
	thead th {padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #388E3C;
    border-bottom: 3px solid #388E3C;
    border-bottom-width: 3px;
    border-bottom-style: solid;
    border-bottom-color: rgb(56, 142, 60);}
	tbody th {width: 150px; padding: 10px; font-weight: bold; vertical-align: center; border-bottom: 1px solid #ccc; background: #f3f6f7;}
	td .exGoodsImg {text-align: center; margin: auto; padding: 1px;}
	.exButton {text-align: center;}
	.paging {text-align: center;}
	* {
    margin: 0;
    padding: 0;
    list-style: none;
}

#select_dname > span {
	float: left;
    text-align: center;
    position: relative;
    top: 13px;
    margin-right: 10px;
}
}

#id_date {
	padding-left: 70px;
	padding-right: 23px;
}

.left-info{
	padding:0 0 0 8px;
	position:relative;
	padding: 26px 0 20px;
	border-bottom: 1px solid #ccc;
}
#main_container {
    padding-left: 10px;
    padding-right: 5px;
    margin: 0 10px;
}
.cheboard_user {
  color: #000;
}
#img_profile {
	border-radius: 150px; /* ���̾� ��ũ�⸸ŭ �ݰ��� ���*/    
    vertical-align: middle;
    object-fit: cover;
    border: none;
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    background-position: 0 -110px;
    content: '';
}
#mainpage, #pagemain {
	padding:7px;
}

.id_profile {
	float: left;
    position: relative;
    overflow: hidden;
    width: 50px;
    height: 50px;
    margin-right: 7px;
}
.id_id{
	padding: 9px 0 0 53px;
}
#cheboard_date {
	float: none;
    padding-top: 10px;
    padding-right: 3px;
}
.cheboard_content {
	height: auto;
	padding: 0;
	border: 0;
    color: #666;
    line-height: 21px;
    letter-spacing: 0;
    word-break: break-all;
    margin: 0;
    padding-right: 3px;
}
#counter {
	position: absolute;
    color: #aaa;
    top: 0;
    right: 0;
    z-index: 1;
}
.delete {
	position: absolute;
	top: 0;
	right : 0;
}
.deleteicon {
	width: 20px;
    position: absolute;
    top: 0;
    right: 7px;
    margin-top: 6px;
}
#replyInsert {
	border: none;
    padding: 13px 33px;
    border-radius: 30px;
    color: #fff;
    cursor: pointer;
    box-shadow: 0px 7px 21px 0px rgb(0 0 0 / 12%);
    background-image: linear-gradient(to left, #46C0BE, #6DD56F, #46C0BE);
    background-position: right;
    background-size: 200%;
    margin-left: 10px;
}
#dname_select {
 display: inline-block;
    background-color: #fff;
    border-radius: 5px;
    border: solid 1px #e8e8e8;
    box-sizing: border-box;
    display: block;
    font-family: inherit;
    font-size: 2rem;
    font-weight: normal;
    height: 50px;
    line-height: 40px;
    outline: none;
    padding-left: 18px;
    padding-right: 30px;
    margin-right: 5px;
  }
 #dname_option {
      background-color: #fff;
    border-radius: 5px;
    border: solid 1px #e8e8e8;
    box-sizing: border-box;
    display: block;
    font-family: inherit;
    font-size: 2rem;
    font-weight: normal;
    height: 50px;
    line-height: 40px;
    outline: none;
    padding-left: 18px;
    padding-right: 30px
 }
.btn_moreview {
position:relative;width:100%;display:inline-block;*display:inline;text-align:center;margin:20px 0 0 0;
}
.btn_moreview a {
border:1px solid #ddd;padding:8px 13px;font-size:10pt;font-weight:bold;text-align:center;text-decoration:none;
}
.btn_moreview a:hover {
background:#000;color:#fff;
}
.menu a{cursor:pointer; }
.deleteComment {
	position: relative;
    top: 28px;
    right: 10px;
    background-clip: padding-box;
    border-radius: 4px;
    display: none;
    z-index:1;
}
.deleteComment > li {
	overflow-y: auto;
    z-index: 1;
    max-height: 416px;
    padding: 10px 0;
    border: 1px solid rgba(0,0,0,.06);
    border-radius: 6px;
    box-shadow: 0 1px 12px 0 rgb(0 0 0 / 6%);
    background-color: #fff;
    box-sizing: border-box;
    min-width: 100px;
    padding: 0 15px;
    font-size: 13px;
    line-height: 37px;
}
.deleteComment>li:hover {
	background-color:#e5e5e5;
}

#comment_content{
	position: relative;
    display: block;
    width: 100%;
    padding: 0 0 5px 0;
    margin-top: 21px;
}
.like_icon {
	width: 20px;
    cursor: pointer;
}
.like_comment_div {
	position: absolute;
    right: 0;
    bottom: 0;
}
.like_total {
	margin-left: 3px;
    position: relative;
    bottom: -2px;
}
.post {
	position:relative;
}
.post .camboard_click {
	border: 2px solid #fff;
    color: #fff;
    background: none;
    border-radius: 30px;
    text-transform: capitalize;
    padding: 16px 27px;
    position: absolute;
    bottom: 6%;
    right: 4%;
    z-index: 1;
    overflow: hidden;
    margin: 0;
}
.post-slider{
  width:100%;
  margin: auto;
  margin-bottom: 20px;
}
.post-slider .next{
  position:absolute;
  top:50%;
  right:5%;
  font-size:2em;
  color:gray;
  cursor: pointer;
}
.post-slider .prev{
  position:absolute;
  top:50%;
  left:5%;
  font-size:2em;
  color:gray;
    cursor: pointer;
}

@media (max-width: 575px) {
  .post-slider .prev{
  	display:none;
  }
  .post-slider .next{
   display:none;
  }
  .contain .container {
	margin: 0 5px 0 5px;
}
}

.post-slider .post-wrapper{
  width:65%;
  margin:auto;
  overflow: hidden;
  padding:10px 0px 10px 0px;
}

.post-slider .post-wrapper .post .slider-image{
  width: 100%;
  height: 100%;
  border-top-left-radius:5px;
  border-top-right-radius:5px;
  margin: auto;
}
.post-wrapper .slick-list {
	height: auto;
}
.slick-dots {
	display: flex;
	justify-content: center;
	margin: 0;
	padding: 1rem 0;
	list-style-type: none;
	
	li {
		 margin: 0 4px;
	    display: inline-block;
	    width: 5px;
	    height: 5px;
	    border-radius: 50%;
	    background: #fff;
	    opacity: 0.5;
	    position: relative;
	    top: 0;
		}
	
		button {
			display: block;
			width: 1rem;
			height: 1rem;
			padding: 0;
			
			border: none;
			border-radius: 100%;
			background-color: orange;
			
			text-indent: -9999px;
		}
		li.slick-active button {
			width: 12px;
		    height: 12px;
		    top: 3px;
		    opacity: 1;
		    -webkit-box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
		    box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
		}
</style>

<title>EARTH & US</title>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>    
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<br><br>
	
	<div class="contain">
	<div class="container"><br>
	
	
    <div class="page-wrapper" style="position:relative;">
      <!--page slider -->
      <div class="post-slider">
        <i class="fas fa-chevron-left prev"></i> 
        <i class="fas fa-chevron-right next"></i>
        
        <div class="post-wrapper">
          	<div class="post">
            <img src="/resources/cheBoard/CAMB_PLASTIC 10.jpg" class="slider-image">
             <a href="/camBoard/detail?CAMB_NAME=플라스틱%20ZERO&CAMB_NUM=10&INDEX=1" class="hero-btn mb-10 camboard_click">캠페인 보러가기</a>
            </div>
            <div class="post">
            <img src="/resources/cheBoard/CAMB_OCEAN 03.png" class="slider-image">
            <a href="/camBoard/detail?CAMB_NAME=보이지%20않는%20무서움,%20해양%20미세플라스틱&CAMB_NUM=3&INDEX=5" class="hero-btn mb-10 camboard_click">캠페인 보러가기</a>
            </div>
            <div class="post">
            <img src="/resources/cheBoard/CAMB_FOREST 01.png" class="slider-image">
            <a href="/camBoard/detail?CAMB_NAME=숨을%20위한%20숲&CAMB_NUM=7&INDEX=3" class="hero-btn mb-10 camboard_click">캠페인 보러가기</a>
            </div>
            <div class="post">
            <img src="/resources/cheBoard/CAMB_ICE 07.jpg" class="slider-image">
            <a href="/camBoard/detail?CAMB_NAME=흐르는%20북극곰&CAMB_NUM=8&INDEX=2" class="hero-btn mb-10 camboard_click">캠페인 보러가기</a>
            </div>
            

        </div>
      </div>
      <!--post slider-->
    </div>
   
        
    <br>
    <div>
    	<table id="addList">
    	<thead>
       		<tr>
            	<th>지구를 위한 따듯한 말</th>
            </tr>
          </thead>
        </table>
        
        <div id="list">
        
        
        
        
        </div>
     
    	
    </div>
    <c:if test="${total_comment ge 10}">
	<div class="btn_moreview">
        <a href="#none" id="addBtn" title="comment more">댓글 더보기 </a>
    </div>
	</c:if>
  </div>



<jsp:include page="/WEB-INF/views/footer.jsp"/>



<div id="back-top" >
   <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

</body>
<script type="text/javascript">
	var startNum = 0;
	var step = 10;
	var insert_commet = 0;
	var All_dname = [];
	var total_comment = ${total_comment};
	var first_comming = 0;
  $(document).ready(function (){
		  
		  
	 	 	
	  	 	init();
       
        
        $('#addBtn').on('click',function() {
        	
        		step += step;
            	init();
        });
        $('.post-wrapper').slick({
	    	  slidesToShow: 1,
	    	  slidesToScroll: 1,
	    	  autoplay: true,
	    	  autoplaySpeed: 5000,
	    	  nextArrow:$('.next'),
	    	  prevArrow:$('.prev'),
	    	  
	    	  
	    	  responsive: [ // 반응형 웹 구현 옵션
					{  
						breakpoint: 570, //화면 사이즈 960px
						settings: {
							nextArrow:false,
							  prevArrow:false
						} 
					}
      	]
	    	});
      
  });
 
  
  
  
  
  //list
  	function init(){
  	
  		
  		$.ajax({
	        url : "visitor_comment_list",
	        type : "GET",
	        data :{
	        	"startnum" : startNum,
	        	"comment_step" : step
            }, 
	        success :function(obj){
	        
	        	if(startNum < 10) {
	        	var str= '<table id="listDiv">'
	        	}
	        	 for(var i=0; i<obj.length;i++) {
	        		
            		str += '<tr>';
            		str += '<td class="left-info">'
 	            	str += '<div class="id_profile"><img alt="profile" id="img_profile" src="'+obj[i].cheb_profile +'"></div>';
 	            	str +='<div id="id_date">'
 	            	str +='<p class="cheboard_content"><Strong>'+obj[i].cheb_content+'</Strong></p>';	
	           		 str += '<div id="cheboard_date">'+obj[i].cheb_date.substring(0,16)+'</div>';
	           		 str += '<div class="id_id"><span class="cheboard_user">'+obj[i].cheb_name+' 님</span></div>'
	           		 str += '<div>'
	           		 str += '<div class="like_comment_div">'
            		 str +='<a class="comment_like" idx="'+i+'" data_num="'+obj[i].cheb_num+'"><img class="like_icon" alt="comment_like" src="/resources/cheBoard/NOT_like.png"></a>'
            		
          			 str +='<span class="like_total">'+obj[i].cheb_comment_like_total+'</span></div>'
            		 str +='</div>'
            		 	 str += '</td>'
	            		 str += '</tr>';
	            		
                }
	        	 str += '</table>'
	        	if(startNum < 10) {
	        		
	        		 $('#list').html(str);
	        	}
	        	else {
	        		 $('#listDiv').append(str);
	        	}
	        	
	        	if(total_comment <= step) {
	        		$("#addBtn").remove();
	        	}
	        	     
	        	 $('.comment_like').on('click', function(){
	             	
	             	<c:if test="${auth.auth_id == null}">
	       		  		alert("로그인 을 해주세요");
	       		  		location.replace('/auth/login');
	       	  		</c:if>
	       		  		})
	        	
	        	
    	},
        error : function(error){
            console.log(error);
        }
	});
}
    
</script>
</html>