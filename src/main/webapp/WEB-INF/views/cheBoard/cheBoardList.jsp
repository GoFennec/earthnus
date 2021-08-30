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
	td {width: 350px;border-bottom: 1px solid #ccc;}
	td .exGoodsImg {text-align: center; margin: auto; padding: 1px;}
	.exButton {text-align: center;}
	.paging {text-align: center;}
	* {
    margin: 0;
    padding: 0;
    list-style: none;
}

#slider-wrap {
    width: 100%;
    height: 400px;
    position: relative;
    overflow: hidden;
}
#slider-wrap ul#slider {
    height: 100%;
    position: absolute;
    top: 0;
    left: 0;
}
#slider-wrap ul#slider li {
    float: left;
    position: relative;
    width: 600px;
    height: 400px;
}
#slider-wrap ul#slider li img {
    display: block;
    width: 50%;
    height: 100%;
    margin:auto;
}
/*btns*/
.slider-btns {
    position: absolute;
    width: 50px;
    height: 60px;
    top: 50%;
    margin-top: -25px;
    line-height: 57px;
    text-align: center;
    cursor: pointer;
    background: rgba(0, 0, 0, 0.1);
    z-index: 100;
    -webkit-user-select: none;
    -moz-user-select: none;
    -khtml-user-select: none;
    -ms-user-select: none;
    -webkit-transition: all 0.1s ease;
    -o-transition: all 0.1s ease;
    transition: all 0.1s ease;
}
.slider-btns:hover {
    background: rgba(0, 0, 0, 0.3);
}
#next {
    right: -50px;
    border-radius: 7px 0px 0px 7px;
    color: #eee;
}
#previous {
    left: -50px;
    border-radius: 0px 7px 7px 7px;
    color: #eee;
}
#slider-wrap.active #next {
    right: 0px;
}
#slider-wrap.active #previous {
    left: 0px;
}
/*bar*/
#slider-pagination-wrap {
    min-width: 20px;
    margin-top: 350px;
    margin-left: auto;
    margin-right: auto;
    height: 15px;
    position: relative;
    text-align: center;
}
#slider-pagination-wrap ul {
    width: 100%;
}
#slider-pagination-wrap ul li {
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
#slider-pagination-wrap ul li.active {
    width: 12px;
    height: 12px;
    top: 3px;
    opacity: 1;
    -webkit-box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
    box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
}
/*ANIMATION*/
#slider-wrap ul,
#slider-pagination-wrap ul li {
    -webkit-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
    -o-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
    transition: all 0.3s cubic-bezier(1, .01, .32, 1);
}
#COMMENT_LIKE img {
	width:30px;
	height:30px;
	position: absolute;
	bottom: 0;
	right : 0;
}

#listDiv {
	 border-top:1px solid black;
}

#id_date {
	padding-left: 70px;
}
.left-id{
	width: 400px;
}

.left-content {
	display:block;
	padding: 0px 0px 10px 0px;
	
}

.left-info{
	padding:0 0 0 8px;
	position:relative;
	display:block;
	width:100%;
	padding: 21px 0 20px
}

.
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
    margin-top: 5px;
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
    
}
.id_id{
	padding: 19px 0 0;
}
#cheboard_date {
	float: none;
    padding-top: 10px;
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
}
.delete {
	position: absolute;
	top: 0;
	right : 0;
}
#replyInsert {
	border: none;
    padding: 13px 33px;
    text-transform: capitalize;
    border-radius: 30px;
    color: #fff;
    display: inline-block;
    font-size: 15px;
    box-shadow: 0px 7px 21px 0px rgb(0 0 0 / 12%);
    background-image: linear-gradient(to left, #46C0BE, #6DD56F, #46C0BE);
    background-position: right;
    background-size: 200%;
    position: absolute;
    top: 25%;
    margin-left: 10px;
}
#insert_div {
	position: relative;
}
#dname_select {
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
  position: relative;
  width: 200px; }
  
.btn_moreview {
position:relative;width:100%;display:inline-block;*display:inline;text-align:center;margin:20px 0 0 0;
}
.btn_moreview a {
border:1px solid #ddd;padding:8px 13px;font-size:10pt;font-weight:bold;text-align:center;text-decoration:none;
}
.btn_moreview a:hover {
background:#000;color:#fff;
}
</style>


<title>EARTH & US</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>    
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	
	
		
	
	
	
	
	<div class="container"><br>
	<table class="exGoods" style="margin-bottom: 10px">
		<thead>
			<tr><th scope="col">응원 게시판</th></tr>
		</thead>
	</table>
	
        <div id="slider-wrap">
       
            <ul id="slider">
             <li><img alt="사진" class=item src="/resources/cheBoard/plastics.jpg"></li>
		     <li><img alt="사진" class=item src="/resources/cheBoard/animal.jpg"></li>
		     <li><img alt="사진" class=item src="/resources/cheBoard/bear.jpg"></li>
		     <li><img alt="사진" class=item src="/resources/cheBoard/tree.jpg"></li>
          	 </ul>
         
     <div class="slider-btns" id="next"><span>▶</span></div>
    <div class="slider-btns" id="previous"><span>◀</span></div>
	
    <div id="slider-pagination-wrap">
        <ul>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        </ul>
    </div>
    </div>     
    
	
	
	
	
	
	 	<c:if test="${auth.auth_id != null}">
    	<c:choose>
    		
    		<c:when test="${payCheck eq null}">
    		
    			 <select disabled>
	       			<option>응원 카테고리</option>
	       		</select>
	       	
    		</c:when>
    		
    		<c:when test="${payCheck != null }">
    		
    			<div id="select_dname">
    			</div>
    				
    		
    	
    		</c:when>
    	</c:choose>
    	</c:if>
	   
    
    
    	
	    	<c:if test="${auth.auth_id != null}">
	    	<div id="insert_div">
	         <textarea id="text" wrap="hard" rows="4" cols="100"></textarea>
	         <input type="button" id="replyInsert" value="응원하기">	
	         </div>
	        </c:if>
    
	
    
    
    <div>
    	<table id="addList" style="margin-bottom: 10px">
    	<thead>
       		<tr>
            	<th>환경을 위해 한마디</th>
            </tr>
          </thead>
        </table>
        
        <div id="list">
        
        
        
        
        </div>
     
    	
    </div>
	<div class="btn_moreview">
        <a href="#none" id="addBtn">댓글 더보기 </a>
    </div>
	
  </div>



<jsp:include page="/WEB-INF/views/footer.jsp"/>



<script type="text/javascript">
	var startNum = 0;
	var step = 10;
	var insert_commet = 0;
	var All_dname = [];
  $(document).ready(function (){
	 
	  <c:forEach items="${payCheck}" var="row">
	    All_dname.push("${row.pay_dname}");
	  </c:forEach>
	
	    if(All_dname != null) {
	    	select_dname();
	    }
	  	slider();
	  
	  	 init();
	  	function select_dname() {
	  		
	  		var count_tree = 0;
	  		var count_sea = 0;
	  		var count_pla = 0;
	  		var count_bear = 0;
	  
	  		var str = '<select id="dname_select">'
	  		for(var i=0; i < All_dname.length; i++) {
	  			
	  			
	  			if((count_sea <= 0) && (All_dname[i] == "조개" || All_dname[i] == "새우" || All_dname[i] == "문어" || All_dname[i] == "바다") ) {
	  				str += '<option>바다</option>';
	  				count_sea += 1;
	  				
	  			}
		
	  			if((count_tree <= 0 ) && (All_dname[i] == "나무" || All_dname[i] == "숲" || All_dname[i] == "묘목" || All_dname[i] == "새싹") ) {
	  				str += '<option>숲</option>';
	  				count_tree += 1;
	  				
	  			}
	  			
	  			if((count_pla <= 0) && (All_dname[i] == "플라스틱 줄이기" || All_dname[i] == "해양 청소" || All_dname[i] == "대지 청소" || All_dname[i] == "친환경")) {
	  				str += '<option>친환경</option>';
	  				count_pla += 1;
	  			}
	  			if( (count_bear <= 0) && (All_dname[i] == "작은 얼음" || All_dname[i] == "큰 얼음" || All_dname[i] == "빙하 조각" || All_dname[i] == "빙하")) {
	  				str += '<option>북극곰</option>';
	  				count_bear +=1;
	  			}
	  		}	
	  		str += '</select>';
	  		$('#select_dname').append(str);
	  	}
	  
	  	
	  	
	  	
	  	
	  	
	  	
        $('#replyInsert').on('click',function() {
          	
        	  var text = $('#text').val().replace(/(?:\r\n|\r|\n)/g,'<br/>');
        	  var id = "${auth.auth_id}";
  	      	  var name = "${auth.auth_name}";
        	  var dnum = $("#dname_select option:selected").val();
        	  var senData = {"cheb_id":id, "cheb_name":name, "cheb_dname":dnum, "cheb_content": text}
        	  if(text.trim().length==0) {
        		  alert("내용을 작성해주세요");
        		  $('#replyInsert').focus();
        		  return;
        	  }
        	  if(dnum == null) {
        		  alert("카테고리를 선택해주세요");
        		  return;
        	  }
        	 $.ajax({
        		 url : "Cheboard_insert",
        		 type : "POST",
        		 data :	JSON.stringify(senData),
        		 contentType : "application/json; charset=utf-8",
        		 success : function(){
        			 $('#text').val("");
        			 insert_commet++;
                     init();
                 },
                 error : function(error){
                     console.log(error);
                 }
        		
        	 });
        	 
          });
        
        $('#addBtn').on('click',function() {
        	step += step;
        	init();
        });
       
  });
 
  function slider() {
    var slideWrapper = document.getElementById('slider-wrap');
    var count = 0;
    var slideIndex = 0;
    
    var slides = document.querySelectorAll('#slider-wrap #slider li');
    
    var totalSlides = slides.length;
    
    
    var sliderWidth = slideWrapper.clientWidth;
   
    slides.forEach(function (element) {
        element.style.width = sliderWidth + 'px';
    })
    
    var slider = document.querySelector('#slider-wrap ul#slider');
    
    clearInterval(autoSlider);
    slider.style.left = 0 + 'px';
    slider.style.width = sliderWidth * totalSlides + 'px';
   
    var nextBtn = document.getElementById('next');
    var prevBtn = document.getElementById('previous');
    nextBtn.addEventListener('click', function () {
        plusSlides(1);
    });
    prevBtn.addEventListener('click', function () {
        plusSlides(-1);
    });
   
    slideWrapper.addEventListener('mouseover', function () {
        this.classList.add('active');
        clearInterval(autoSlider);
    });
    slideWrapper.addEventListener('mouseleave', function () {
        this.classList.remove('active');
        autoSlider =setInterval(function () {
            plusSlides(1);
        }, 1000);
    });
    function plusSlides(n) {
        showSlides(slideIndex += n);
    }
    function currentSlides(n) {
        showSlides(slideIndex = n);
    }
    function showSlides(n) {
        slideIndex = n;
        if (slideIndex == -1) {
            slideIndex = totalSlides - 1;
        } else if (slideIndex === totalSlides) {
            slideIndex = 0;
        }
        slider.style.left = -(sliderWidth * slideIndex) + 'px';
        pagination();
    }
    
    function pagination() {
        var dots = document.querySelectorAll('#slider-pagination-wrap ul li');
        dots.forEach(function (element) {
            element.classList.remove('active');
        });
        dots[slideIndex].classList.add('active');
    }
    pagination();	
    var autoSlider = setInterval(function () {
        plusSlides(1);
    }, 3000); 
    }
  
  
  
  
  
  
  //list
  	function init(){
  	
  		
  		$.ajax({
	        url : "comment_list",
	        type : "GET",
	        data :{
	        	"startnum" : startNum,
	        	"comment_step" : step
            }, 
	        success :function(obj){
	        	var auth_id = "${auth.auth_id}";
	        	
	        	if(startNum < 10) {
	        	var str= '<table id="listDiv">'
	        	}
	        	 for(var i=0; i<obj.length;i++) {
	        		
            		str += '<tr>';
            		str += '<td class="left-info">'
 	            	str += '<div class="id_profile"><img id="img_profile" src="'+obj[i].d_img +'"></div>';
 	            	str +='<div id="id_date">'
	            	 if(auth_id == obj[i].cheb_id) { 
         				 str +='<span class="delete"><input type="button" value="삭제" class="deleteComment"  data_num="'+obj[i].cheb_num+'"/></span>';
            		 }
            		 str +='<p class="cheboard_content">'+obj[i].cheb_content+'</p>';	
            		 str += '<div id="cheboard_date">'+obj[i].cheb_date+'</div>';
            		 str += '<div class="id_id"><Strong><span class="cheboard_user">'+obj[i].cheb_name+' 님</span></Strong</div>'
            		 str +='</div>'
            		 	 str += '</td>'
	            		 str += '</tr>';
	            		
	            		
                      }
	        	if(startNum < 10) {
	        		
	        		 $('#list').html(str);
	        	}
	        	else {
	        		 $('#listDiv').append(str);
	        	}
	        	 str += '</table>'
	        	
                     
            $('.deleteComment').on('click', function(){        
                var reply_num = $(this).attr('data_num'); 
                console.log(reply_num);
                
                $.ajax({
                    
                    url : "Cheboard_delete",
                    type : "POST",
                        
                    data :{
                    	"reply_id" : reply_num
                    },
                    success : function(){
                    	init();
                    },
                    error : function(error){
                        console.log(error);
                    }
                    
                });
            
            });
            
            $('.comment_like').on('click', function(){
            	var reply_num = $(this).attr('data_num');
            	
            	var senData = {"comment_user_id":auth_id, "comment_num": reply_num}
      	    if(auth_id == null) {
        		  alert("로그인 을 해주세요");
        		  return;
        	  }
            	$.ajax({
            	 
            		url: "Cheboard_comment_like",
            		type : "POST",
            		data :	JSON.stringify(senData),
           		 	contentType : "application/json; charset=utf-8",
           			success : function() {
           				init();
           			}
            	})
            });
            
    	}
	});
	}
</script>
</body>
</html>