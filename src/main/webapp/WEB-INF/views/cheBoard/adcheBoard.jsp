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
	
	<div class="container"><br>
	<table class="exGoods" style="margin-bottom: 10px">
		<thead>
			<tr><th scope="col">관리자응원 게시판</th></tr>
		</thead>
	</table>

    <div id="listDiv">
    </div>
    </div>

<script type="text/javascript">

  $(document).ready(function (){
        init(); 
  });
  
  
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
            		 
         				 str += '<td>'+item.cheb_num+'</td>';
         				 str += '<td>'+item.cheb_content+'</td>'
         				 str += '<td>'+item.cheb_name+'</td>';
         				 str += '<td>'+item.cheb_date+'</td>';
         				
         				 str += '<td><input type="button" value="삭제" class="deleteComment" data_num="'+item.cheb_num+'"/></td>';
            	
                  })
             
            str += '</tr>';	
            str += '</table>';
            $('#listDiv').html(str);
            

            $('.deleteComment').on('click', function(){        
                var reply_id = $(this).attr('data_num'); 
                $.ajax({
                    
                    url : "adCheboard_delete",
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