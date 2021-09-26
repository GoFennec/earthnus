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
.facebook, .twitter, .naverblog, .kakaotalk, .clipboard { cursor: pointer; }
.facebook:hover, .twitter:hover, .naverblog:hover, .kakaotalk:hover, .clipboard:hover {
   transform: scale( 1.2 ); 
   padding-bottom: 8px; 
   border-bottom: 1px solid black;
}
.thumb {
   background: none !important;
}
.thumb img{
   width: 150px;
   height: 80px;
}
.list{
   text-align: center !important;
}
.main-img{
   padding: 4%;
   text-align: center;
   margin-bottom: 50px;
}
#SNSshare{
}
#shareList {
    display: none;
    text-align: center;
    width: 303px;
    height: 109px;
    padding: 20px 60px;
    background-color: #fefefe;
    border: 1px solid #888;
    border-radius: 15px;
}

#shareList .modal_close_btn {
    background: none;
    border: none;
    cursor: pointer;
}
.modal_close_btn:hover {
    background-color: #66BB6A; color: #388E3C;
}
</style>

<title>EARTH & US</title>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>

<main>
  <section class="blog_area single-post-area section-padding">
   <div class="container">
    <div class="row">
    <div class="col-1"></div>
     <div class="col-10 posts-list">   
      <div class="single-post">
      <div class="blog_details">
        <h2 style="color: #2d2d2d;">${camBoard.CAMB_NAME}</h2>
      <div id="subject_icon">
         <span style="display: inline-block;">
         <p><a id="subject" href="/camBoard/list/search?search_type=CAMB_SUBJECT&search=${camBoard.CAMB_SUBJECT}" title="${camBoard.CAMB_SUBJECT} 캠페인">${camBoard.CAMB_SUBJECT}&nbsp;&nbsp;</a>
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
       <div class="d-sm-flex" style="margin: 30px;">
          <div class="list col-6 col-sm-6" style="text-align:right;"><i class="fas fa-comments"></i><a type="button" id="SNSshare" style="cursor: pointer;">&nbsp;&nbsp;SNS 공유하기</a></div>
           <div id="shareList">
              <ul class="social-icons">
                 <li style="float: left"><a id="facebookshare" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fnaver.com%2F%2F%2F&amp;src=sdkpreparse" class="fb-share-button fb-xfbml-parse-ignore" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button" data-size="large">
                   <img src="/resources/camBoard/facebook.png" alt="페이스북 공유" class="facebook" width="25px"></a></li>
               <li style="float: left"><img src="/resources/camBoard/twitter.png" alt="트위터 공유" width="25px" class="twitter" onclick="shareTwitter()"></li>
                <li style="float: left"><img src="/resources/camBoard/naverblog.png" alt="네이버블로그 공유" width="25px" class="naverblog" onclick="shareNaverBlog()"></li>
               <li style="float: left"><img src="/resources/camBoard/kakaotalk.png" alt="카카오톡 공유" width="25px" class="kakaotalk" onclick="shareKakao()"></li>
               <li style="float: left;"><i class="clipboard fas fa-copy" style="font-size: 24px" onclick="shareURL()"></i></li>
              </ul><br><br>
              <button class="modal_close_btn">닫기</button>
           </div>
         <div class="list col-6 col-sm-6"><i class="fab fa-gratipay"></i><a type="button" style="cursor: pointer;" onclick="donate()">&nbsp;&nbsp;후원 바로가기</a></div>
       </div>
      
      <div class="navigation-area m-4">
        <div class="row">
         <div id="preBoard" class="col-6 col-sm-6" style="text-align:right;">
            <div style="cursor: pointer;" onclick="detailUrl('${preBoard.CAMB_NAME}', '${preBoard.CAMB_NUM}', 'prev')">
                  <div class="thumb" style="margin-right:0px;">
                  <img class="img-fluid" src="${preBoard.CAMB_FILE}" title="${preBoard.CAMB_NAME}" alt="${preBoard.CAMB_NAME}">
               </div>
               <div class="arrow">
                    <span class="lnr text-white ti-arrow-left"></span>
               </div>
                  <div class="detials" style="text-align:right;">
                    <p style="font-size: 0.8em;">${preBoard.CAMB_NAME}</p>
                    <span><i class="fas fa-angle-left"></i>이전</span>
               	  </div>
            </div>
         </div>

		           

      
         <div id="nextBoard" class="col-6 col-sm-6">
            <div style="cursor: pointer;" onclick="detailUrl('${nextBoard.CAMB_NAME}', '${nextBoard.CAMB_NUM}', 'next')">
               <div class="thumb" style="margin-left:0px;">
                    <img class="img-fluid" src="${nextBoard.CAMB_FILE}" title="${nextBoard.CAMB_NAME}" alt="${nextBoard.CAMB_NAME}">
               </div>
               <div class="detials"  style="text-align:left;">
                <p style="font-size: 0.8em;">${nextBoard.CAMB_NAME}</p>
                <span>다음<i class="fas fa-angle-right"></i></span>
               </div>
               <div class="arrow">
                     <span class="lnr text-white ti-arrow-right"></span>
               </div>
            </div>
          </div>
          
        <div class="list col-12 col-sm-12" style="cursor: pointer; padding-top:30px;">
           <i class="fas fa-list-ul"></i>&nbsp;&nbsp;<a onclick="camBoard()" style="color: #425140;">목록으로</a>
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
   var pagenum = 0;            // 현재 캠페인이 위치한 실제 페이지
   
   window.onload = function(){
      num = ${index}/6;
      pagenum = Math.ceil(num);
      
      var subjecthtml = '';
      if("${camBoard.CAMB_SUBJECT}" === "해양"){
         subjecthtml += '<i class="fas fa-tint text-primary"></i>';
         $('#subject_icon').prepend(subjecthtml);
      }else if("${camBoard.CAMB_SUBJECT}" === "플라스틱"){
         subjecthtml += '<i class="fas fa-sync-alt text-secondary"></i>';
         $('#subject_icon').prepend(subjecthtml);
      }else if("${camBoard.CAMB_SUBJECT}" === "산림"){
         subjecthtml += '<i class="fas fa-tree text-success"></i>';
         $('#subject_icon').prepend(subjecthtml);
      }else if("${camBoard.CAMB_SUBJECT}" === "극지방"){
         subjecthtml += '<i class="fas fa-snowflake text-warning"></i>';
         $('#subject_icon').prepend(subjecthtml);
      }
      if(!'${preBoard.CAMB_NUM}'){
         $('#preBoard').html('<div>이전 캠페인이 없습니다.</div>');
      }else if(!'${nextBoard.CAMB_NUM}'){
         $('#nextBoard').html('<div>다음 캠페인이 없습니다.</div>');
      }
   }
   
function detailUrl(CAMB_NAME, CAMB_NUM, type){
		var currentIndex = 0;
		
		if(type === "prev"){
			num = (${index}-1)/6;
			currentIndex = ${currentIndex} - 1;
		}else if(type === "next"){
			num = (${index}+1)/6;
			currentIndex = ${currentIndex} + 1;
		}
		pagenum = Math.ceil(num);
		
		if(name || num){
			if(query){
				if(query.lastIndexOf(substring) !== -1){
					query = query.substr(0, subquery.indexOf("pagenum")-2);
				}
				if(pagenum !== 1){
					URL += pathname + "?" + query + "&pagenum=" + pagenum + "&CAMB_NAME=" + CAMB_NAME + "&CAMB_NUM=" + CAMB_NUM + "&INDEX=" + currentIndex;
				}else{
					URL += pathname + "?" + query + "&CAMB_NAME=" + CAMB_NAME + "&CAMB_NUM=" + CAMB_NUM + "&INDEX=" + currentIndex;
				}
			}else{
				if(pagenum !== 1){
					URL += pathname + "?pagenum=" + pagenum + "&CAMB_NAME=" + CAMB_NAME + "&CAMB_NUM=" + CAMB_NUM + "&INDEX=" + currentIndex;
				}else{
					URL += pathname + "?CAMB_NAME=" + CAMB_NAME + "&CAMB_NUM=" + CAMB_NUM + "&INDEX=" + currentIndex;
				}
			}
			
			location.href = URL;
			
		} else if(!num && type === "prev"){
			
			
		} else if(!num && type === "next"){
			
			
		}
		
		
	}
	
	function camBoard(){
		
		substring = "pagenum";
		var pagenum = parseInt((${index}-1)/6 + 1);
		if(${totalIndex} <= 6){
			pagenum = 1;
		}
		if(query){
			if(query.lastIndexOf("search") !== -1){
				query = "/search?" + query;
				URL += "/camBoard/list" + query;
			}
			if(query.lastIndexOf(substring) !== -1){
				query = query.substr(0, subquery.indexOf("pagenum")-2);
				URL += "/camBoard/list?" + query;
			}
			if(pagenum !== 1){
				URL += "pagenum=" + pagenum;
			}
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
	
	function modal(id) {
        var zIndex = 9999;
        var modal = document.getElementById(id);

        // 모달 div 뒤에 희끄무레한 레이어
        var bg = document.createElement('div');
        bg.setStyle({
            position: 'fixed',
            zIndex: zIndex,
            left: '0px',
            top: '0px',
            width: '100%',
            height: '100%',
            overflow: 'auto',
            // 레이어 색갈은 여기서 바꾸면 됨
            backgroundColor: 'rgba(0,0,0,0.4)'
        });
        document.body.append(bg);

        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
        modal.querySelector('.modal_close_btn').addEventListener('click', function() {
            bg.remove();
            modal.style.display = 'none';
        });
        
        modal.querySelector('.social-icons img').addEventListener('click', function() {
            bg.remove();
            modal.style.display = 'none';
        });
        
        modal.querySelector('.kakaotalk').addEventListener('click', function() {
            bg.remove();
            modal.style.display = 'none';
        });

        modal.setStyle({
            position: 'fixed',
            display: 'block',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

            // 시꺼먼 레이어 보다 한칸 위에 보이기
            zIndex: zIndex + 1,

            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        });
    }
   
   // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
    Element.prototype.setStyle = function(styles) {
        for (var k in styles) this.style[k] = styles[k];
        return this;
    };
	
    document.getElementById('SNSshare').addEventListener('click', function() {
        // 모달창 띄우기
        modal('shareList');
    });
   
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