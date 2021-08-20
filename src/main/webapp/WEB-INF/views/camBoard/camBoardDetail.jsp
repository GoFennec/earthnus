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
<script>
	function resize(obj) {
	  obj.style.height = "1px";
	  obj.style.height = (12+obj.scrollHeight)+"px";
	}
</script>
<style>
	table {max-width: 90%; margin:auto; border-collapse: collapse; text-align: left; line-height: 1.5;}
	thead th {padding: 10px; font-weight: bold; vertical-align: top; color: #086121; border-bottom: 3px solid #0ed145;}
	tbody th {width: 150px; padding: 10px; font-weight: bold; vertical-align: center; border-bottom: 1px solid #ccc; background: #f3f6f7;}
	.list {background-color: #FFFFDE}
	td {width: 350px; padding: 10px; vertical-align: center;}
	td .exGoodsImg {text-align: center; margin: auto; padding: 1px;}
	.exButton{text-align: center;}
	input {border: none;}
	textarea {border: none; width: 100%; height: auto; overflow:visible;}
	#subject:hover {color: #2962FF;}
	.main{margin-right: 30px;}


	i {
	    opacity: 0;
	    font-size: 28px;
	    color: #1F1E1E;
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
	    width: 240px;
	    height: 72px;
	    background-color: #EEEEED;
	    border-radius: 80px;
	    padding: 0 18px;
	    will-change: transform;
	    -webkit-transition: all .2s ease-in-out;
	    transition: all .2s ease-in-out;
	}

	.btn_wrap:hover {
	    /* transition-delay: .4s; */
	    -webkit-transform: scale(1.1);
	            transform: scale(1.1)
	}
	
	span {
	    position: absolute;
	    z-index: 99;
	    width: 240px;
	    height: 72px;
	    border-radius: 80px;
	    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
	    font-size: 20px;
	    text-align: center;
	    line-height: 70px;
	    letter-spacing: 2px;
	    color: #EEEEED;
	    background-color: #1F1E1E;
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
	    width: 240px;
	    height: 64px;
	    border-radius: 80px;
	}
	
	.container i:nth-of-type(1) {-webkit-transition-delay: 1.1s; transition-delay: 1.1s;}
	
	.container i:nth-of-type(2) {-webkit-transition-delay: .9s; transition-delay: .9s;}
	
	.container i:nth-of-type(3) {-webkit-transition-delay: .7s; transition-delay: .7s;}
	
	.container i:nth-of-type(4) {-webkit-transition-delay: .4s; transition-delay: .4s;}
	
	.btn_wrap:hover span {
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${camBoard.CAMB_NAME}에 대하여..</title>
<link rel="shortcut icon" href="/resources/assets/img/favicon.ico">
<link rel="icon" href="/resources/assets/img/favicon.ico">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">

</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>	
	<div class="main col-sm-12 col-lg-12">
		<table class="mainlist goodsTable" id="detail" style="border-collapse: separate;">
			<tr>
				<td colspan = "4">
					<a id="subject" href="/camBoard/list/search?search=${camBoard.CAMB_SUBJECT}&search_type=CAMB_SUBJECT">${camBoard.CAMB_SUBJECT}</a>
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
				<td colspan = "4">
					<img src="${camBoard.CAMB_FILE}" id="IMG" width="800" alt="캠페인" title="${camBoard.CAMB_SUBJECT}"/>
					<input type="file" id="CAMB_FILE" name="CAMB_FILE" style="display:none;">
				</td>
			</tr>
			
			<tr style="text-align: center; border-bottom: 1px solid #ccc;">
				<td colspan="4"><textarea name="CAMB_CONTENT" readonly>${camBoard.CAMB_CONTENT}</textarea></td>
			</tr>
			<tr>
				<td colspan="4" class="sysBtn" style="text-align: center;">
					<input type="button" class="btn-dark" value="목록" onclick="location.href='/camBoard/list'"/>	<br><br><br><br>
					    <div class="btn_wrap">
					        <span>Share</span>
					        <div class="container">
					            <a href="/"><img src="/resources/camBoard/facebook.png" alt="페이스북 공유" title="" width="40px" onclick="shareFacebook()"></a>&nbsp;&nbsp;&nbsp;
								<a href="/"><img src="/resources/camBoard/twitter.png" alt="트위터 공유" title="" width="40px" onclick="shareTwitter()"></a>&nbsp;&nbsp;&nbsp;
								<a href="/"><img src="/resources/camBoard/kakaotalk.png" alt="카카오톡 공유" title="" width="40px" onclick="shareKakaotalk()"></a>
					        </div>
					    </div>
				</td>
			</tr>
		</table>
	</div>		
		<div id="camBoardList"></div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<script type="text/javascript">
	$(document).ready(function(){
		var preUrl = document.referrer;
		var pagingUrl = "/getList" + preUrl.substring(42) + "&pagenum=";
		var page = ${page};
		var url1 = "'/camBoard/detail?CAMB_NUM=";		var url2 = "'";
		
		var listHead = '<table classs="sublist">';
		listHead += '<tr>';
		listHead += '<th scope="col">캠페인 번호</th>';
		listHead += '<th scope="col">캠페인 사진</th>'
		listHead += '<th scope="col">캠페인 제목</th>';
		listHead += '<th scope="col">캠페인 주제</th>';
		listHead += '<th scope="col">캠페인 내용</th>';
		listHead += '</tr>';
	
	console.log("search : " + preUrl);
		
		if(preUrl.indexOf("search") > -1){
			
			$.ajax({
				
				url:"/getList" + preUrl.substring(42) + "&pagenum=" + page,
				type:"GET",
				dataType:"json",
				"success" : function(CamBoardList){
					console.log("AJAX통신 성공 + page : " + page);
					
					$.each(CamBoardList, function(index, item){
						listHead += '<tr clas="list" onclick="location.href=' + url1 + item.CAMB_NUM + '&p=' + page + url2 + '">';
						listHead += '<td>' + item.CAMB_NUM + '</td>';
						listHead += '<td><img src="'+ item.CAMB_FILE +'" id="IMG" width="100" alt="캠페인" title="' + item.CAMB_SUBJECT + '"/></td>';
						listHead += '<td>' + item.CAMB_NAME + '</td>';
						listHead += '<td>' + item.CAMB_SUBJECT + '</td>';
						listHead += '<td>' + item.CAMB_CONTENT + '...</td>';
						listHead += '</tr>';
					})
						listHead += '<tr colspan = "5"><td>';
					$.each(CamBoardList, function(index, item){
						listHead += '1';
					})
						listHead += '</td></tr>';
					
					$('#camBoardList').html(listHead);
				},
				"error" : function(CamBoardList){
					console.log("AJAX통신 실패");
			    }
			});
		} 
		if(preUrl.indexOf("search") === -1){
			if(preUrl.indexOf("/camBoard/list") > -1){
				console.log("list");
				
				$.ajax({
					
					url:"/getList?search=&pagenum=" + page,
					type:"GET",
					dataType:"json",
					"success" : function(CamBoardList){
						console.log("AJAX통신 성공 + page : " + page);
						
						$.each(CamBoardList, function(index, item){
							listHead += '<tr clas="list" onclick="location.href=' + url1 + item.CAMB_NUM + '&p=' + page + url2 + '">';
							listHead += '<td>' + item.CAMB_NUM + '</td>';
							listHead += '<td><img src="'+ item.CAMB_FILE +'" id="IMG" width="100" alt="캠페인" title="' + item.CAMB_SUBJECT + '"/></td>';
							listHead += '<td>' + item.CAMB_NAME + '</td>';
							listHead += '<td>' + item.CAMB_SUBJECT + '</td>';
							listHead += '<td>' + item.CAMB_CONTENT + '</td>';
							listHead += '</tr>';
						})
					listHead += '<tr colspan = "5"><td>';
						$.each(CamBoardList, function(index, item){
							listHead += '1';
					})
						listHead += '</td></tr>';
						$('#camBoardList').html(listHead);
					},
					"error" : function(CamBoardList){
						console.log("AJAX통신 실패");
				    }
				});
			}else if(preUrl.indexOf("/camBoard/list") === -1){
				console.log("nothing");
				
				$.ajax({
					
					url:"/getList?search=&pagenum=" + page,
					type:"GET",
					dataType:"json",
					"success" : function(CamBoardList){
						console.log("AJAX통신 성공 + page : " + page);
						
						$.each(CamBoardList, function(index, item){
							listHead += '<tr clas="list" onclick="location.href=' + url1 + item.CAMB_NUM + '&p=' + page + url2 + '">';
							listHead += '<td>' + item.CAMB_NUM + '</td>';
							listHead += '<td><img src="'+ item.CAMB_FILE +'" id="IMG" width="100" alt="캠페인" title="' + item.CAMB_SUBJECT + '"/></td>';
							listHead += '<td>' + item.CAMB_NAME + '</td>';
							listHead += '<td>' + item.CAMB_SUBJECT + '</td>';
							listHead += '<td>' + item.CAMB_CONTENT + '</td>';
							listHead += '</tr>';
						})
						$.each(CamBoardList, function(index, item){
							
						})
						listHead += '<tr colspan = "5"><td>';
						$.each(CamBoardList, function(index, item){
							listHead += '1';
					})
						$('#camBoardList').html(listHead);
					},
					"error" : function(CamBoardList){
						console.log("AJAX통신 실패");
				    }
				});
			}			
		} 
		
		if(preUrl.substring(21,36) === "/camBoard/list"){
			
			console.log("제대로된 경로 : " + preUrl.substring(37));
			
			$.ajax({
				
				url:preUrl.substring(21),
				type:"GET",
				dataType:"json",
				"success" : function(CamBoardList){
					console.log("AJAX통신 성공");
				    
				},
				"error" : function(CamBoardList){
					console.log("AJAX통신 실패");
			    }
			});
		}else{
			console.log("옳지 않은 경로" + preUrl.substring(21));
			
			$.ajax({
				
				url:"/camBoard/list",
				type:"GET",
				dataType:"json",
				success:function(args){
					var str = "";
				}
			});
		}

		
	})
</script>
<script type='text/javascript'>
	var url = document.location.href;
	var title = ${camBoard.CAMB_NAME};
	var img = ${camBoard.CAMB_FILE};
	
	function shareTwitter() {
	    var sendText = "지구살리기"; // 전달할 텍스트
	    var sendUrl = url; // 전달할 URL
	    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
	}
	
	function shareFacebook() {
	    var sendUrl = url; // 전달할 URL
	    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
	}
	
	function shareKakaotalk() {
	    Kakao.init('3b1b5dd541e88935221a7fb05cd01dad')
	    Kakao.Link.sendDefault({
	      objectType: 'feed',
	      content: {
	    	  title: title,
		        description: '지구의 웃음을 찾아서',
		        imageUrl: img,
		        link: {
			          mobileWebUrl: url,
			          webUrl: url
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
		            mobileWebUrl: url,
		            webUrl: url
		          }
		        },
		        {
		          title: '앱으로 보기',
		          link: {
		            mobileWebUrl: url,
		            webUrl: url
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