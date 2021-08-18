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
    width: 100%;
    height: 100%;
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
    
	
	<div>
	<input type="radio" name="chk_info" value="해양"> 해양 살리기 응원
	<input type="radio" name="chk_info" value="플라스틱"> 플라스틱 줄이기 응원
	<input type="radio" name="chk_info" value="나무 살리기">나무 응원
	<input type="radio" name="chk_info" value="북극 곰살리기">북극곰 응원
	</div>
	<div id="formDiv">
    
       
        <c:if test="${auth.auth_id == null}">
         <textarea style="width:90%" id="text" disabled></textarea>
         <input type="button" id="replyInsert" value="응원하기">
        </c:if>
    
    	
	    	<c:if test="${auth.auth_id != null}">
	         <textarea style="width:90%" id="text"></textarea>
	         <input type="button" id="replyInsert" value="응원하기">
	        </c:if>
        
    </div>
    
	
    
    
    <div id="listDiv">
    </div>
    </div>



<jsp:include page="/WEB-INF/views/footer.jsp"/>



<script type="text/javascript">

  $(document).ready(function (){
	  //list불러오고 insert 버튼 클릭시 ajax
        init();
        $('#replyInsert').on('click',function() {
          	
        	  var text = $('#text').val();
        	  var id = "${auth.auth_id}";
        	  var name = "${auth.auth_name}";
        	  var dnum = "123";
        	  var senData = {"cheb_id":id, "cheb_name":name, "cheb_dnum":dnum, "cheb_content": text}
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
                     init();
                 },
                 error : function(error){
                     console.log(error);
                 }
        		
        	 });
          });
        
        
        
        $("input:radio[name=chk_info]").click(function() {
        	var str = "";
        	
        	var element = document.getElementById("slider");
        	
        	
        	if($("input[name=chk_info]:checked").val() == '해양') {
        		 
        		str ='<li><img alt="사진" class=item src="/resources/cheBoard/oceanItem1.png"></li>';
        		str +='<li><img alt="사진" class=item src="/resources/cheBoard/oceanItem2.png"></li>';
        		str +='<li><img alt="사진" class=item src="/resources/cheBoard/oceanItem3.png"></li>';
        		str +='<li><img alt="사진" class=item src="/resources/cheBoard/oceanItem4.png"></li>';
        		}
        	else if($("input[name=chk_info]:checked").val() == '플라스틱') {
        		
    		  	str ='<li><img alt="사진" class=item src="/resources/cheBoard/plasticItem1.png"></li>';
	    		str +='<li><img alt="사진" class=item src="/resources/cheBoard/plasticItem2.png"></li>';
	    		str +='<li><img alt="사진" class=item src="/resources/cheBoard/plasticItem3.png"></li>';
	    		str +='<li><img alt="사진" class=item src="/resources/cheBoard/plasticItem4.png"></li>';	    	
        	}
        	else if($("input[name=chk_info]:checked").val() == '나무 살리기') {
	   			
	    		 str ='<li><img alt="사진" class=item src="/resources/cheBoard/forestItem1.png"></li>';
	    		str +='<li><img alt="사진" class=item src="/resources/cheBoard/forestItem2.png"></li>';
	    		str +='<li><img alt="사진" class=item src="/resources/cheBoard/forestItem3.png"></li>';
	    		str +='<li><img alt="사진" class=item src="/resources/cheBoard/forestItem4.png"></li>';
	    	}
        	else if($("input[name=chk_info]:checked").val() == '북극 곰살리기') {
      			
    			str ='<li><img alt="사진" class=item src="/resources/cheBoard/iceItem1.png"></li>';
	    		str +='<li><img alt="사진" class=item src="/resources/cheBoard/iceItem2.png"></li>';
	    		str +='<li><img alt="사진" class=item src="/resources/cheBoard/iceItem3.png"></li>';
	    		str +='<li><img alt="사진" class=item src="/resources/cheBoard/iceItem4.png"></li>';
      	}
        	element.innerHTML = str;
    		slider();
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
        autoSlider = setInterval(function () {
            plusSlides(1);
        }, 3000);
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
    }, 1000); 
    }


  
  
  
  
  
  
  //list
  	function init(){
    
    $.ajax({
        url : "comment_list",
        type : "GET",
        dataType : "json",
        success :function(obj){
        	var auth_id = "${auth.auth_id}";
            var str = '<table>';
            str += '<tr>'
            str += '<th scope="col">글번호</th>'
            str += '<th scope="col">내용</th>'
            str += '<th scope="col">작성자</th>'
            str += '<th scope="col">글번호</th>'
            str += '</tr>'
            	 $.each(obj ,function(index, item){
            		 var item_id = item.cheb_id;
            		 str += '<tr>';
            		 
            		 if(auth_id == item_id) {
            			 
         				 str += '<td>'+item.cheb_num+'</td>';
         				 str += '<td>'+item.cheb_content+'</td>'
         				 str += '<td>'+item.cheb_name+'</td>';
         				 str += '<td>'+item.cheb_date+'</td>';
         				 str += '<td><input type="button" value="수정"/></td>';
         				 str += '<td><input type="button" value="삭제" class="deleteComment" data_num="'+item.cheb_num+'"/></td>';
            		 }
            		 else {
	     				 str += '<td>'+item.cheb_num+'</td>';
	     				 str += '<td>'+item.cheb_content+'</td>'
	     				 str += '<td>'+item.cheb_name+'</td>';
	     				 str += '<td>'+item.cheb_date+'</td>';
	     				 
            		 }
                  })
             
            str += '</tr>';	
            str += '</table>';
            $('#listDiv').html(str);
            

            $('.deleteComment').on('click', function(){        
                var reply_id = $(this).attr('data_num'); 
                $.ajax({
                    
                    url : "Cheboard_delete",
                    type : "POST",
                        
                    data :{
                    	reply_id : reply_id
                    },
                    success : function(){
                        init();
                    },
                    error : function(error){
                        console.log(error);
                    }
                    
                });
            
            });
    }
	});
	}
</script>
</body>
</html>