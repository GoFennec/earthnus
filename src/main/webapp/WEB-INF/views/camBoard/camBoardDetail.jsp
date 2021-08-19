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
<title>${camBoard.CAMB_NAME}�� ���Ͽ�..</title>
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
				������ : ${camBoard.CAMB_STARTDATE}<br>
				������ : ${camBoard.CAMB_FINDATE}
				</td>
			</tr>
			
			<tr>
				<td colspan = "4">
					<img src="${camBoard.CAMB_FILE}" id="IMG" width="600" alt="ķ����" title="${camBoard.CAMB_SUBJECT}"/>
					<input type="file" id="CAMB_FILE" name="CAMB_FILE" style="display:none;">
				</td>
			</tr>
			
			<tr style="text-align: center; border-bottom: 1px solid #ccc;">
				<td colspan="4"><textarea name="CAMB_CONTENT" readonly>${camBoard.CAMB_CONTENT}</textarea></td>
			</tr>
			<tr>
				<td colspan="4" class="sysBtn" style="text-align: center;">
					<input type="button" class="btn-dark" value="���" onclick="location.href='/camBoard/list'"/>
					<div style="text-align: center;">					
						<ul style="list-style-type: none; float: left;">
							<li style="list-style-type: none; float: left;"><i class="fas fa-share-alt"></i>�����ϱ�</li>
							<li style="list-style-type: none; float: left;"><a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();">Ʈ����</a></li>
							<li style="list-style-type: none; float: left;"><a id="btnFacebook" class="link-icon facebook" href="javascript:shareFacebook();">���̽���</a></li>
							<li style="list-style-type: none; float: left;"><a id="btnKakao" class="link-icon kakao" href="javascript:sendLink()">īī����</a></li>
							<li style="list-style-type: none; float: left;">
								<a id="kakao-link-btn" href="javascript:sendLink()">
									<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/>
								</a>
							</li>
						</ul>
					</div>

					<!-- <div class="share-button">
						<span><i class="fas fa-share-alt"></i>�����ϱ�</span>
						<a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();">Ʈ����</a>
						<a id="btnFacebook" class="link-icon facebook" href="javascript:shareFacebook();">���̽���</a>    
						<a id="btnKakao" class="link-icon kakao" href="javascript:sendLink()">īī����</a>    
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
		listHead += '<th width: "10%" scope="col">ķ���� ��ȣ</th>';
		listHead += '<th width: "10%" scope="col">ķ���� ����</th>'
		listHead += '<th width: "20%" scope="col">ķ���� ����</th>';
		listHead += '<th width: "10%" scope="col">ķ���� ����</th>';
		listHead += '<th width: "50%" scope="col">ķ���� ����</th>';
		listHead += '</tr>';
	
	console.log("search : " + preUrl);
		
		if(preUrl.indexOf("search") > -1){
			
			$.ajax({
				
				url:"/getList" + preUrl.substring(42) + "&pagenum=" + page,
				type:"GET",
				dataType:"json",
				"success" : function(CamBoardList){
					console.log("AJAX��� ���� + page : " + page);
					
					$.each(CamBoardList, function(index, item){
						listHead += '<tr clas="list" onclick="location.href=' + url1 + item.CAMB_NUM + '&p=' + page + url2 + '">';
						listHead += '<td width: "10%">' + item.CAMB_NUM + '</td>';
						listHead += '<td width: "10%"><img src="'+ item.CAMB_FILE +'" id="IMG" width="100" alt="ķ����" title="' + item.CAMB_SUBJECT + '"/></td>';
						listHead += '<td width: "20%">' + item.CAMB_NAME + '</td>';
						listHead += '<td width: "10%">' + item.CAMB_SUBJECT + '</td>';
						listHead += '<td width: "50%">' + item.CAMB_CONTENT + '...</td>';
						listHead += '</tr>';
					})
					$.each(CamBoardList, function(index, item){
						listHead += '<tr colspan = "5">';
						listHead += '<td><h2>����� ����¡ �ϴ°�</h2></td>';
						listHead += '</tr>';
					})
					
					$('#camBoardList').html(listHead);
				},
				"error" : function(CamBoardList){
					console.log("AJAX��� ����");
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
						console.log("AJAX��� ���� + page : " + page);
						
						$.each(CamBoardList, function(index, item){
							listHead += '<tr clas="list" onclick="location.href=' + url1 + item.CAMB_NUM + '&p=' + page + url2 + '">';
							listHead += '<td>' + item.CAMB_NUM + '</td>';
							listHead += '<td><img src="'+ item.CAMB_FILE +'" id="IMG" width="100" alt="ķ����" title="' + item.CAMB_SUBJECT + '"/></td>';
							listHead += '<td>' + item.CAMB_NAME + '</td>';
							listHead += '<td>' + item.CAMB_SUBJECT + '</td>';
							listHead += '<td>' + item.CAMB_CONTENT + '</td>';
							listHead += '</tr>';
						})
						listHead += '<tr colspan = "5">';
						listHead += '<td><h2>����� ����¡ �ϴ°�</h2></td>';
						listHead += '</tr>';
						$('#camBoardList').html(listHead);
					},
					"error" : function(CamBoardList){
						console.log("AJAX��� ����");
				    }
				});
			}else if(preUrl.indexOf("/camBoard/list") === -1){
				console.log("nothing");
				
				$.ajax({
					
					url:"/getList?search=&pagenum=" + page,
					type:"GET",
					dataType:"json",
					"success" : function(CamBoardList){
						console.log("AJAX��� ���� + page : " + page);
						
						$.each(CamBoardList, function(index, item){
							listHead += '<tr clas="list" onclick="location.href=' + url1 + item.CAMB_NUM + '&p=' + page + url2 + '">';
							listHead += '<td>' + item.CAMB_NUM + '</td>';
							listHead += '<td><img src="'+ item.CAMB_FILE +'" id="IMG" width="100" alt="ķ����" title="' + item.CAMB_SUBJECT + '"/></td>';
							listHead += '<td>' + item.CAMB_NAME + '</td>';
							listHead += '<td>' + item.CAMB_SUBJECT + '</td>';
							listHead += '<td>' + item.CAMB_CONTENT + '</td>';
							listHead += '</tr>';
						})
						$.each(CamBoardList, function(index, item){
							
						})
						listHead += '<div>';
						listHead += '<h2 style="text-align: center;">����� ����¡ �ϴ°�</h2>';
						listHead += '</div>';
						$('#camBoardList').html(listHead);
					},
					"error" : function(CamBoardList){
						console.log("AJAX��� ����");
				    }
				});
			}			
		} 
		
		if(preUrl.substring(21,36) === "/camBoard/list"){
			
			console.log("����ε� ��� : " + preUrl.substring(37));
			
			$.ajax({
				
				url:preUrl.substring(21),
				type:"GET",
				dataType:"json",
				"success" : function(CamBoardList){
					console.log("AJAX��� ����");
				    
				},
				"error" : function(CamBoardList){
					console.log("AJAX��� ����");
			    }
			});
		}else{
			console.log("���� ���� ���" + preUrl.substring(21));
			
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
	    var sendText = "�����츮��"; // ������ �ؽ�Ʈ
	    var sendUrl = url; // ������ URL
	    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
	}
	
	function shareFacebook() {
	    var sendUrl = url; // ������ URL
	    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
	}
	
    // // ����� ���� JavaScript Ű�� ������ �ּ���.
    Kakao.init('3b1b5dd541e88935221a7fb05cd01dad');
    // // īī����ũ ��ư�� �����մϴ�. ó�� �ѹ��� ȣ���ϸ� �˴ϴ�.
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
      objectType: 'feed',
      content: {
        title: title,
        description: '������ ������ ã�Ƽ�',
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
          title: '������ ����',
          link: {
            mobileWebUrl: url,
            webUrl: url
          }
        },
        {
          title: '������ ����',
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