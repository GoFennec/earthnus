<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	table {width: 100%; border-collapse: collapse; text-align: left; line-height: 1.5;}
	thead th {padding: 10px; font-weight: bold; vertical-align: top; color: #086121; border-bottom: 3px solid #0ed145;}
	tbody th {width: 150px; padding: 10px; font-weight: bold; vertical-align: center; border-bottom: 1px solid #ccc; background: #f3f6f7;}
	.list {background-color: #FFFFDE}
	td {width: 350px; padding: 10px; vertical-align: center;}
	td .exGoodsImg {text-align: center; margin: auto; padding: 1px;}
	.exButton{text-align: center;}
	input {border: none;}
	textarea {border: none; width: 100%; height: auto; overflow:visible;}
	#subject:hover {color: #2962FF;}
	
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
	
	<div class="container col-sm-12 col-lg-4">
		<table class="goodsTable" id="detail" style="border-collapse: separate;">
			<tr>
				<td colspan = "4">
					<a id="subject" href="/camBoard/list/search?search=${camBoard.CAMB_SUBJECT}&search_type=CAMB_SUBJECT">${camBoard.CAMB_SUBJECT}</a>
				</td>
			</tr>
			
			<tr>
				<td colspan = "3" style="text-align: left; color: black; font-size: 45px;"><b>${camBoard.CAMB_NAME}</b></td>
				<td style="text-align: right; color: gray; font-size: 10px;">
				시작일 : ${camBoard.CAMB_STARTDATE}<br>
				종료일 : ${camBoard.CAMB_FINDATE}
				</td>
			</tr>
			
			<tr>
				<td colspan = "4">
					<img src="${camBoard.CAMB_FILE}" id="IMG" width="600" alt="캠페인" title="${camBoard.CAMB_SUBJECT}"/>
					<input type="file" id="CAMB_FILE" name="CAMB_FILE" style="display:none;">
				</td>
			</tr>
			
			<tr style="text-align: center; border-bottom: 1px solid #ccc;">
				<td colspan="4"><textarea name="CAMB_CONTENT" readonly>${camBoard.CAMB_CONTENT}</textarea></td>
			</tr>
			<tr>
				<td colspan="4" class="sysBtn" style="text-align: center;">
					<input type="button" class="btn-dark" value="목록" onclick="location.href='/camBoard/list'"/>
					<div style="text-align: center;">					
						<ul style="list-style-type: none; float: left;">
							<li style="list-style-type: none; float: left;"><i class="fas fa-share-alt"></i>공유하기</li>
							<li style="list-style-type: none; float: left;"><a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();">트위터</a></li>
							<li style="list-style-type: none; float: left;"><a id="btnFacebook" class="link-icon facebook" href="javascript:shareFacebook();">페이스북</a></li>
							<li style="list-style-type: none; float: left;"><a id="btnKakao" class="link-icon kakao" href="javascript:sendLink()">카카오톡</a></li>
							<li style="list-style-type: none; float: left;">
								<a id="kakao-link-btn" href="javascript:sendLink()">
									<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/>
								</a>
							</li>
						</ul>
					</div>

					<!-- <div class="share-button">
						<span><i class="fas fa-share-alt"></i>공유하기</span>
						<a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();">트위터</a>
						<a id="btnFacebook" class="link-icon facebook" href="javascript:shareFacebook();">페이스북</a>    
						<a id="btnKakao" class="link-icon kakao" href="javascript:sendLink()">카카오톡</a>    
						<a id="kakao-link-btn" href="javascript:sendLink()">
							<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/>
						</a>
					</div> -->
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
		var url1 = "'/camBoard/detail?CAMB_NUM=";
		var url2 = "'";
		var listHead = '<table>';
		listHead += '<tr>';
		listHead += '<th width: "10%" scope="col">캠페인 번호</th>';
		listHead += '<th width: "10%" scope="col">캠페인 사진</th>'
		listHead += '<th width: "20%" scope="col">캠페인 제목</th>';
		listHead += '<th width: "10%" scope="col">캠페인 주제</th>';
		listHead += '<th width: "50%" scope="col">캠페인 내용</th>';
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
						listHead += '<td width: "10%">' + item.CAMB_NUM + '</td>';
						listHead += '<td width: "10%"><img src="'+ item.CAMB_FILE +'" id="IMG" width="100" alt="캠페인" title="' + item.CAMB_SUBJECT + '"/></td>';
						listHead += '<td width: "20%">' + item.CAMB_NAME + '</td>';
						listHead += '<td width: "10%">' + item.CAMB_SUBJECT + '</td>';
						listHead += '<td width: "50%">' + item.CAMB_CONTENT + '...</td>';
						listHead += '</tr>';
					})
					$.each(CamBoardList, function(index, item){
						listHead += '<tr colspan = "5">';
						listHead += '<td><h2>여기는 페이징 하는곳</h2></td>';
						listHead += '</tr>';
					})
					
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
						listHead += '<tr colspan = "5">';
						listHead += '<td><h2>여기는 페이징 하는곳</h2></td>';
						listHead += '</tr>';
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
						listHead += '<div>';
						listHead += '<h2 style="text-align: center;">여기는 페이징 하는곳</h2>';
						listHead += '</div>';
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
	
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('3b1b5dd541e88935221a7fb05cd01dad');
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
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
        sharedCount: 845
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
    });
  //]]>
</script>
</body>
</html>