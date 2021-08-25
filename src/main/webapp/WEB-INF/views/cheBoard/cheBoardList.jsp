<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>

<html>


<head>
<style>
table {width: 100%; border-collapse: collapse; text-align: left; line-height: 1.5;}
	thead th {padding: 10px; font-weight: bold; vertical-align: top; color: #086121; border-bottom: 3px solid #0ed145;}
	tbody th {width: 150px; padding: 10px; font-weight: bold; vertical-align: center; border-bottom: 1px solid #ccc; background: #f3f6f7;}
	td {width: 350px; padding: 10px; vertical-align: center; border-bottom: 1px solid #ccc;}
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
.delete {
	margin-top: 10px;
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
#text {
	width:85%;
	height:80px;
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
             <li><img alt="사진" class=item src="/resources/cheBoard/oceanItem1.png"></li>
		     <li><img alt="사진" class=item src="/resources/cheBoard/oceanItem2.png"></li>
		     <li><img alt="사진" class=item src="/resources/cheBoard/oceanItem3.png"></li>
		     <li><img alt="사진" class=item src="/resources/cheBoard/oceanItem4.png"></li>
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
	         <textarea id="text"></textarea>
	         <input type="button" id="replyInsert" value="응원하기">	
	         </div>
	        </c:if>
    
	
    
    
    <div>
    	<table id="addList" border="1">
        <thead>
            <tr>
            	<th>환경을 위해 한마디</th>
            </tr>
        </thead>	
        <tbody id="listDiv">
        
        
        
        
        </tbody>
    </table>  
    	
    </div>
    <div>  
        <button id="addBtn">더보기</button>
      
	</div>
  </div>



<jsp:include page="/WEB-INF/views/footer.jsp"/>



<script type="text/javascript">
	var startNum = 1;
	var step = 10;
	var insert_commet = 0;
	var All_dname = [];
	
  $(document).ready(function (){
	 
	  <c:forEach items="${payCheck}" var="row">
	    All_dname.push("${row.pay_dname}")
	  </c:forEach>
	
	    if(All_dname != null) {
	    	select_dname();
	    }
	  	slider();
	  
	  	 init();
	  	function select_dname() {
	  			  		var str = '<select id="dname_select">'
	  		for(var i=0; i < All_dname.length; i++) {
	  			var count_tree = count_tree;
		  		var count_sea = count_sea;
		  		var count_pla = count_pla;
		  		var count_bear = count_bear;
		  		
	  			if(count_tree <= 0 && All_dname[i] == "나무" || All_dname[i] == "숲" || All_dname[i] == "묘목" || All_dname[i] == "새싹" ) {
	  				str += '<option>나무 응원</option>';
	  				count_tree += 1;
	  				console.log(count_tree);
	  			}
	  			else if(count_sea <= 0 && All_dname[i] == "조개" || All_dname[i] == "새우" || All_dname[i] == "문어" || All_dname[i] == "바다" ) {
	  				str += '<option>바다 응원</option>';
	  				count_sea++;
	  			}
	  			else if(count_pla == 0 && All_dname[i] == "플라스틱 줄이기" || All_dname[i] == "해양 청소" || All_dname[i] == "대지 청소" || All_dname[i] == "친환경") {
	  				str += '<option>플라스틱 응원</option>';
	  				count_pla++;
	  			}
	  			else if( count_bear == 0 && All_dname[i] == "작은 얼음" || All_dname[i] == "큰 얼음" || All_dname[i] == "빙하 조각" || All_dname[i] == "빙하" ) {
	  				str += '<option>북극곰 응원</option>';
	  				count_bear++;
	  			}
	  		}	
	  		str += '</select>';
	  		$('#select_dname').append(str);
	  	}
	  
	  	
	  	
	  	
	  	
	  	
	  	
        $('#replyInsert').on('click',function() {
          	
        	  var text = $('#text').val();
        	  var id = "${auth.auth_id}";
  	      	  var name = "${auth.auth_name}";
        	  var dnum = $("#dname_select option:selected").val();
        	  var senData = {"cheb_id":id, "cheb_name":name, "cheb_dname":dnum, "cheb_content": text}
        	  if(text.trim().length==0) {
        		  alert("내용을 작성해주세요");
        		  $('#replyInsert').focus();
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
        	startNum += step;
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
  	
  		if(insert_commet > 0) {
    		$('#listDiv').empty();
    			insert_commet = 0;
    			 startNum = 0;
    			 step = 10;
  		}
  		
  		$.ajax({
	        url : "comment_list",
	        type : "GET",
	        data :{
	        	"startnum" : startNum,
	        	"comment_step" : step
            }, 
	        success :function(obj){
	        	var auth_id = "${auth.auth_id}";
	        	
	        	// $('#listDiv').empty();

	        	 for(var i=0; i<obj.length;i++) {
            		var str = '<tr>';
            		 str += '<td style="position:relative"><div>'+obj[i].cheb_name;
            		 if(auth_id == obj[i].cheb_id) { 
         				 str +='<span class="delete"><input type="button" value="삭제" class="deleteComment"  data_num="'+obj[i].cheb_num+'"/></span></div>';

            		 }
            		 str += '<div>'+obj[i].cheb_content+'</div>'
     				 str += '<div>'+obj[i].cheb_date+'</div>';
     				 str += '<div id="COMMENT_LIKE"><a href="javascript:void(0);" class="comment_like" data_num="'+obj[i].cheb_num+'"><img alt="사진" class=like_comment src="/resources/cheBoard/NOT_like.png"><a></div>';
            		 
            		 	 str += '</td>'
	            		 str += '</tr>';
	            		 $('#listDiv').append(str);
                      }
                  
                     
            $('.deleteComment').on('click', function(){        
                var reply_num = $(this).attr('data_num'); 
                //console.log(reply_id);
                $.ajax({
                    
                    url : "Cheboard_delete",
                    type : "POST",
                        
                    data :{
                    	"reply_id" : reply_num
                    },
                    success : function(){
                    	insert_commet++;
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