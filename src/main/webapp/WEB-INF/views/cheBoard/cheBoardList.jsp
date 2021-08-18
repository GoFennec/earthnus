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
</style>
<title>EARTH & US</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>    
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	
	
	<img alt="사진" src="/resources/cheBoard/images1.jpg">
	
	빨리 병이 나으면 좋겠어요	
	
	
	
	<h2>응원 게시판</h2>
	 <div id="formDiv">
    
        <form id="writeForm">
        <c:if test="${auth.auth_id == null}">
         <textarea style="width:500px" id="text" disabled></textarea>
         <input type="button" id="replyInsert" value="응원하기">
        </c:if>
        </form>
    
    	<form id="writeForm">
	    	<c:if test="${auth.auth_id != null}">
	         <textarea style="width:500px" id="text"></textarea>
	         <input type="button" id="replyInsert" value="응원하기">
	        </c:if>
        </form>
    </div>
    
    
        
    
    <div id="listDiv">
    </div>
    

<script type="text/javascript">

  $(document).ready(function (){
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
        
<<<<<<< HEAD

  });
=======
        
        
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
    
    var slides = document.querySelectorAll('#slider-wrap ul li');
    
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
>>>>>>> 4333041 (jsp슬라이드 url관리자추가)
  	function init(){
    
    $.ajax({
        url : "comment_list",
        type : "GET",
        dataType : "json",
        success :function(obj){
            var str = '<table>';
            str += '<tr>'
            str += '<th scope="col">글번호</th>'
            str += '<th scope="col">내용</th>'
            str += '<th scope="col">작성자</th>'
            str += '<th scope="col">글번호</th>'
            str += '</tr>'
            if(${auth.auth_id == 'admin'}) {
            $.each(obj ,function(index, item){
            	str += '<tr>';
				 str += '<td>'+item.cheb_num+'</td>';
				 str += '<td>'+item.cheb_content+'</td>'
				 str += '<td>'+item.cheb_name+'</td>';
				 str += '<td>'+item.cheb_date+'</td>';
				 str += '<td><input type="button" value="삭제" class="deleteComment" data_num="'+item.cheb_num+'"></td>'; 
				 str += '</tr>';	
                 
             })
            }
            else {
            	 $.each(obj ,function(index, item){
                 	str += '<tr>';
     				 str += '<td>'+item.cheb_num+'</td>';
     				 str += '<td>'+item.cheb_content+'</td>'
     				 str += '<td>'+item.cheb_name+'</td>';
     				 str += '<td>'+item.cheb_date+'</td>';
     				 str += '</tr>';	
                      
                  })
            }
             
             
            str += '</table>';
            $('#listDiv').html(str);
            

            //Div가 화면에 다 보여지고 이벤트를 걸어야한다.
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

<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>